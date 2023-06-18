package com.autumn.upload.minio;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.UUID;
import com.autumn.result.Result;
import com.autumn.result.StatusCode;
import com.autumn.sa_token.LoginInfoData;
import com.autumn.springConfig.StaticMethodGetBean;
import com.autumn.upload.entity.Files;
import com.autumn.upload.entity.FilesInsertDto;
import com.autumn.upload.entity.FilesVo;
import com.autumn.upload.mapper.FilesMapper;
import com.autumn.upload.service.FilesService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.minio.*;
import io.minio.http.Method;
import io.minio.messages.Bucket;
import io.minio.messages.Item;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.*;

@Component
@Slf4j
public class MinioUtil {

    @Resource
    private MinioConfig minioConfig;
    @Resource
    private MinioClient minioClient;
    @Value("${minio.endpoint}")
    private String endpoint;
    @Value("${minio.bucketName}")
    private String bucketName;
    @Resource
    private FilesService filesService;

    /**
     * 根据fileIds获取files
     */
    public List<FilesVo> filesIdsTofiles(String filesIds) {
        if (StringUtils.isEmpty(filesIds)) {
            return null;
        }
        List<String> idList = Arrays.asList(filesIds.split(","));
        FilesMapper filesMapper = StaticMethodGetBean.getBean(FilesMapper.class);
        LambdaQueryWrapper<Files> queryWrapper = new LambdaQueryWrapper<Files>()
                .in(Files::getId, idList).orderByDesc(Files::getCreateTime);
        List<Files> files = filesMapper.selectList(queryWrapper);
        List<FilesVo> filesVos = new ArrayList<>();
        if (!StringUtils.isEmpty(files)) {
            for (Files file : files) {
                FilesVo filesVo = new FilesVo();
                filesVo.setFileId(file.getId());
                filesVo.setName(file.getFileNameBefore());
                filesVo.setUrl(endpoint + "/" + bucketName + "/" + file.getFileNameAfter());
                filesVos.add(filesVo);
            }
        }
        return filesVos;
    }

    /**
     * 解析id
     *
     * @param fileIds
     * @return
     */
    public Result parse(String fileIds) {
        List<String> ids = Arrays.asList(fileIds.split(","));
        FilesService filesService = StaticMethodGetBean.getBean(FilesService.class);
        List<Files> files = filesService.listByIds(ids);
        List<FilesVo> list = new ArrayList();
        if (!CollectionUtils.isEmpty(files)) {
            for (Files file : files) {
                FilesVo filesVo = new FilesVo();
                filesVo.setFileId(file.getId());
                filesVo.setName(file.getFileNameBefore());
                filesVo.setUrl(endpoint + "/" + bucketName + "/" + file.getFileNameAfter());
                list.add(filesVo);
            }
        }
        Map res = new HashMap();
        res.put("list", list);
        return Result.successData(res);
    }

    /**
     * 文件上传
     *
     * @param file 文件
     * @return Boolean
     */
    public Result uploadWeb(MultipartFile file) {
        String originalFilename = file.getOriginalFilename();
        if (StringUtils.isEmpty(originalFilename)) {
            return Result.failMsg("上传文件为空");
        }
        //判断桶是否存在
        if (!bucketExists(bucketName)) {
            if (!makeBucket(bucketName)) {
                return Result.failMsg("Minio创建桶失败");
            }
        }
        String objectName = DateUtil.format(DateUtil.date(), "yyyyMMddHHmmss") + "-" + UUID.fastUUID() +
                originalFilename.substring(originalFilename.lastIndexOf("."));
        try {
            PutObjectArgs objectArgs = PutObjectArgs.builder().bucket(minioConfig.getBucketName()).object(objectName)
                    .stream(file.getInputStream(), file.getSize(), -1).contentType(file.getContentType()).build();
            //文件名称相同会覆盖
            minioClient.putObject(objectArgs);
            //新增到记录表
            FilesInsertDto insertDto = new FilesInsertDto();
            insertDto.setFileNameBefore(originalFilename);
            insertDto.setFileNameAfter(objectName);
            insertDto.setFileSize(String.valueOf(file.getSize()));
            try {
                String updateBy = LoginInfoData.getUserInfo().getUpdateBy();
                insertDto.setUploadBy(updateBy);
            } catch (Exception e) {
                return Result.failMsg("登录失效");
            }
            Result result = filesService.insertFiles(insertDto);
            Files files = (Files) result.getData();
            FilesVo filesVo = new FilesVo();
            filesVo.setFileId(files.getId());
            filesVo.setName(files.getFileNameBefore());
            filesVo.setUrl(endpoint + "/" + bucketName + "/" + files.getFileNameAfter());
            return result.getCode() == StatusCode.SUCCESS.getCode() ? Result.successData(filesVo) : Result.failMsg("Minio文件记录失败");
        } catch (Exception e) {
            return Result.failMsg("Minio文件上传失败" + e.getMessage());
        }
    }

    /**
     * 下载文件
     *
     * @param fileId
     * @param response
     */
    public void download(String fileId, HttpServletResponse response) {
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            if (StringUtils.isEmpty(fileId)) {
                response.setHeader("Content-type", "text/html;charset=UTF-8");
                String data = "文件下载失败";
                OutputStream ps = response.getOutputStream();
                ps.write(data.getBytes("UTF-8"));
                return;
            }
            //查询
            FilesMapper filesMapper = StaticMethodGetBean.getBean(FilesMapper.class);
            Files files = filesMapper.selectById(fileId);
            outputStream = response.getOutputStream();
            // 获取文件对象
            inputStream = minioClient.getObject(GetObjectArgs.builder().bucket(bucketName).object(files.getFileNameAfter()).build());
            byte buf[] = new byte[1024];
            int length = 0;
            response.reset();
            response.setHeader("Content-Disposition", "attachment;filename=" +
                    URLEncoder.encode(files.getFileNameBefore().substring(files.getFileNameBefore().lastIndexOf("/") + 1), "UTF-8"));
            response.setContentType("application/octet-stream");
            response.setCharacterEncoding("UTF-8");
            // 输出文件
            while ((length = inputStream.read(buf)) > 0) {
                outputStream.write(buf, 0, length);
            }
            log.info("Minio=========> 下载成功");
            inputStream.close();
        } catch (Throwable ex) {
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            String data = "文件下载失败";
            try {
                OutputStream ps = response.getOutputStream();
                ps.write(data.getBytes("UTF-8"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        } finally {
            try {
                outputStream.close();
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 查看存储bucket是否存在
     *
     * @return boolean
     */
    public Boolean bucketExists(String bucketName) {
        Boolean found;
        try {
            found = minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return found;
    }

    /**
     * 创建存储bucket
     *
     * @return Boolean
     */
    public Boolean makeBucket(String bucketName) {
        try {
            minioClient.makeBucket(MakeBucketArgs.builder()
                    .bucket(bucketName)
                    .build());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 删除存储bucket
     *
     * @return Boolean
     */
    public Boolean removeBucket(String bucketName) {
        try {
            minioClient.removeBucket(RemoveBucketArgs.builder()
                    .bucket(bucketName)
                    .build());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 获取全部bucket
     */
    public List<Bucket> getAllBuckets() {
        try {
            List<Bucket> buckets = minioClient.listBuckets();
            return buckets;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 预览图片
     *
     * @param fileName
     * @return
     */
    public String preview(String fileName) {
        // 查看文件地址
        GetPresignedObjectUrlArgs build = new GetPresignedObjectUrlArgs().builder().bucket(minioConfig.getBucketName()).object(fileName).method(Method.GET).build();
        try {
            String url = minioClient.getPresignedObjectUrl(build);
            return url;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 查看文件对象
     *
     * @return 存储bucket内文件对象信息
     */
    public List<Item> listObjects() {
        Iterable<io.minio.Result<Item>> results = minioClient.listObjects(
                ListObjectsArgs.builder().bucket(minioConfig.getBucketName()).build());
        List<Item> items = new ArrayList<>();
        try {
            for (io.minio.Result<Item> result : results) {
                items.add(result.get());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return items;
    }

    /**
     * 删除
     *
     * @param fileName
     * @return
     * @throws Exception
     */
    public boolean remove(String fileName) {
        try {
            minioClient.removeObject(RemoveObjectArgs.builder().bucket(minioConfig.getBucketName()).object(fileName).build());
        } catch (Exception e) {
            return false;
        }
        return true;
    }

}
