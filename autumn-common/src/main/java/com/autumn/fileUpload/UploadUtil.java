package com.autumn.fileUpload;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.UUID;
import com.autumn.fileUpload.entity.Files;
import com.autumn.fileUpload.entity.FilesInsertDto;
import com.autumn.fileUpload.entity.FilesVo;
import com.autumn.fileUpload.mapper.FilesMapper;
import com.autumn.fileUpload.minio.MinioConfig;
import com.autumn.fileUpload.service.FilesService;
import com.autumn.result.Result;
import com.autumn.result.StatusCode;
import com.autumn.sa_token.LoginInfoData;
import com.autumn.springConfig.StaticMethodGetBean;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.minio.*;
import io.minio.messages.Bucket;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.*;

/**
 * 文件上传工具
 */
public class UploadUtil {

    /**
     * 根据files获取fileIds
     */
    public static String filesTofilesIds(List<FilesVo> files) {
        if (StringUtils.isEmpty(files)) {
            return null;
        }

        return null;
    }

    /**
     * 根据fileIds获取files
     */
    public static List<FilesVo> filesIdsTofiles(String filesIds) {
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
                filesVo.setName(file.getFileNameBefore());
                filesVo.setUrl("http://127.0.0.1:9000/files/" + file.getFileNameAfter());
                filesVos.add(filesVo);
            }
        }
        return filesVos;
    }

    /**
     * 文件上传
     *
     * @param file 文件
     * @return Boolean
     */
    public static Result uploadWeb(MultipartFile file) {
        String originalFilename = file.getOriginalFilename();
        if (StringUtils.isEmpty(originalFilename)) {
            return Result.failMsg("上传文件为空");
        }
        //判断桶是否存在
        if (!UploadUtil.bucketExists("files")) {
            if (!UploadUtil.makeBucket("files")) {
                return Result.failMsg("创建桶失败");
            }
        }
        String fileName = UUID.fastUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
        String objectName = DateUtil.format(DateUtil.date(), "yyyyMMddHHmmss") + "-" + fileName;
        try {
            MinioConfig minioConfig = StaticMethodGetBean.getBean(MinioConfig.class);
            MinioClient minioClient = StaticMethodGetBean.getBean(MinioClient.class);
            FilesService filesService = StaticMethodGetBean.getBean(FilesService.class);
            PutObjectArgs objectArgs = PutObjectArgs.builder().bucket(minioConfig.getBucketName()).object(objectName)
                    .stream(file.getInputStream(), file.getSize(), -1).contentType(file.getContentType()).build();
            //文件名称相同会覆盖
            minioClient.putObject(objectArgs);

            //新增到记录表
            FilesInsertDto insertDto = new FilesInsertDto();
            insertDto.setFileNameBefore(originalFilename);
            insertDto.setFileNameAfter(objectName);
            insertDto.setFileSize(String.valueOf(file.getSize()));
            String updateBy = null;
            try {
                updateBy = LoginInfoData.getUserInfo().getUpdateBy();
            } catch (Exception e) {
                return Result.failMsg("登录失效");
            }
            insertDto.setUploadBy(updateBy);
            Result result = filesService.insertFiles(insertDto);
            HashMap map = new HashMap();
            map.put("fileIds", "http://127.0.0.1:9000/files/" + objectName);
            return result.getCode() == StatusCode.SUCCESS.getCode() ? Result.successData(map) : Result.failMsg("文件记录失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failMsg("文件上传失败" + e.getMessage());
        }
    }

    /**
     * 文件上传代码逻辑中使用
     *
     * @param file 文件
     * @return Boolean
     */
    public static Map uploadInterior(MultipartFile file) {
        String originalFilename = file.getOriginalFilename();
        if (StringUtils.isEmpty(originalFilename)) {
            throw new RuntimeException("上传文件为空");
        }
        //判断桶是否存在
        if (!UploadUtil.bucketExists("files")) {
            if (!UploadUtil.makeBucket("files")) {
                throw new RuntimeException("创建桶失败");
            }
        }
        String fileName = UUID.fastUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
        String objectName = DateUtil.format(DateUtil.date(), "yyyyMMddHHmmss") + "-" + fileName;
        try {
            MinioConfig minioConfig = StaticMethodGetBean.getBean(MinioConfig.class);
            MinioClient minioClient = StaticMethodGetBean.getBean(MinioClient.class);
            FilesService filesService = StaticMethodGetBean.getBean(FilesService.class);
            PutObjectArgs objectArgs = PutObjectArgs.builder().bucket(minioConfig.getBucketName()).object(objectName)
                    .stream(file.getInputStream(), file.getSize(), -1).contentType(file.getContentType()).build();
            //文件名称相同会覆盖
            minioClient.putObject(objectArgs);

            //新增到记录表
            FilesInsertDto insertDto = new FilesInsertDto();
            insertDto.setFileNameBefore(originalFilename);
            insertDto.setFileNameAfter(objectName);
            insertDto.setFileSize(String.valueOf(file.getSize()));
            String updateBy = null;
            try {
                updateBy = LoginInfoData.getUserInfo().getUserName();
            } catch (Exception e) {
                throw new RuntimeException("登录失效");
            }
            insertDto.setUploadBy(updateBy);
            Result result = filesService.insertFiles(insertDto);
            if (result.getCode() == StatusCode.SUCCESS.getCode()) {
                HashMap map = new HashMap();
                map.put("fileUrl", "http://127.0.0.1:9000/files/" + objectName);
                return result.getCode() == StatusCode.SUCCESS.getCode() ? map : null;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 查看存储bucket是否存在
     *
     * @return boolean
     */
    private static Boolean bucketExists(String bucketName) {
        Boolean found;
        try {
            MinioClient minioClient = StaticMethodGetBean.getBean(MinioClient.class);
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
    private static Boolean makeBucket(String bucketName) {
        try {
            MinioClient minioClient = StaticMethodGetBean.getBean(MinioClient.class);
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
    private Boolean removeBucket(String bucketName) {
        try {
            MinioClient minioClient = StaticMethodGetBean.getBean(MinioClient.class);
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
    private List<Bucket> getAllBuckets() {
        try {
            MinioClient minioClient = StaticMethodGetBean.getBean(MinioClient.class);
            List<Bucket> buckets = minioClient.listBuckets();
            return buckets;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 下载文件
     *
     * @param fileId
     * @param response
     */
    public static void download(String fileId, HttpServletResponse response) {
        MinioClient minioClient = StaticMethodGetBean.getBean(MinioClient.class);
        MinioConfig minioConfig = StaticMethodGetBean.getBean(MinioConfig.class);
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
            inputStream = minioClient.getObject(GetObjectArgs.builder().bucket("files").object(files.getFileNameAfter()).build());
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
            System.out.println("下载成功");
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
     * 删除
     *
     * @param fileId
     * @return
     * @throws Exception
     */
    public static boolean remove(String fileId) {
        try {
            MinioClient minioClient = StaticMethodGetBean.getBean(MinioClient.class);
            MinioConfig minioConfig = StaticMethodGetBean.getBean(MinioConfig.class);
            //查询
            FilesMapper filesMapper = StaticMethodGetBean.getBean(FilesMapper.class);
            Files file = filesMapper.selectById(fileId);
            if (file != null) {
                minioClient.removeObject(RemoveObjectArgs.builder().bucket(minioConfig.getBucketName()).object(file.getFileNameAfter()).build());
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
        return true;
    }

}
