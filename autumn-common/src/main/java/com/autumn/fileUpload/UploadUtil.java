package com.autumn.fileUpload;

import com.autumn.fileUpload.entity.FilesVo;
import com.autumn.fileUpload.minio.MinioUtil;
import com.autumn.result.Result;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文件上传工具
 */
@Component
public class UploadUtil {

    @Resource
    private MinioUtil minioUtil;

    /**
     * 根据fileIds获取files
     */
    public List<FilesVo> filesIdsTofiles(String filesIds) {
        return minioUtil.filesIdsTofiles(filesIds);
    }

    /**
     * 文件上传
     */
    public Result uploadWeb(MultipartFile file) {
        return minioUtil.uploadWeb(file);
    }

    /**
     * 解析文件
     *
     * @param fileIds
     * @return
     */
    public Result parse(String fileIds) {
        return minioUtil.parse(fileIds);
    }


    /**
     * 下载文件
     *
     * @param fileId
     * @param response
     */
    public void download(String fileId, HttpServletResponse response) {
        minioUtil.download(fileId, response);
    }


    /**
     * 删除
     *
     * @param fileName
     * @return
     * @throws Exception
     */
    public Result remove(String fileName) {
        minioUtil.remove(fileName);
        return Result.success();
    }

}
