package com.autumn.uploadTest;

import cn.dev33.satoken.annotation.SaIgnore;
import com.autumn.fileUpload.UploadUtil;
import com.autumn.result.Result;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * @author liqiuzhuang
 * @date 2023-06-11 9:49
 */
@RestController
@RequestMapping("/file")
public class UploadController {

    @Resource
    private UploadUtil uploadUtil;

    @GetMapping("/view")
    @SaIgnore
    public Result view(@RequestParam("filesIds") String filesIds) {
        return Result.successData(uploadUtil.filesIdsTofiles(filesIds));
    }

    @GetMapping("/delete")
    @SaIgnore
    public Result delete(@RequestParam("filesId") String filesId) {
        Result remove = uploadUtil.remove(filesId);
        return Result.successData(remove);
    }

    @GetMapping("/download")
    @SaIgnore
    public Result download(@RequestParam("filesId") String filesId, HttpServletResponse response) {
        uploadUtil.download(filesId, response);
        return Result.success();
    }

    @PostMapping("/upload/img")
    @SaIgnore
    public Result img(MultipartFile file) {
        return uploadUtil.uploadWeb(file);
    }

    @PostMapping("/upload/video")
    @SaIgnore
    public Result video(MultipartFile file) {
        return uploadUtil.uploadWeb(file);
    }

    @GetMapping("/parse")
    @SaIgnore
    public Result parse(String fileIds) throws Exception {
        return uploadUtil.parse(fileIds);
    }

}
