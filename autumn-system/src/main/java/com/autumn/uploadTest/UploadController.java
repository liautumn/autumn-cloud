package com.autumn.uploadTest;

import cn.dev33.satoken.annotation.SaIgnore;
import com.autumn.fileUpload.UploadUtil;
import com.autumn.result.Result;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * @author liqiuzhuang
 * @date 2023-06-11 9:49
 */
@RestController
@RequestMapping("/file")
public class UploadController {

    @GetMapping("/view")
    @SaIgnore
    public Result preview(@RequestParam("filesIds") String filesIds) {
        return Result.successData(UploadUtil.filesIdsTofiles(filesIds));
    }

    @GetMapping("/delete")
    @SaIgnore
    public Result delete(@RequestParam("filesId") String filesId) {
        boolean remove = UploadUtil.remove(filesId);
        return Result.successData(remove);
    }

    @GetMapping("/download")
    @SaIgnore
    public Result download(@RequestParam("filesId") String filesId, HttpServletResponse res) {
        UploadUtil.download(filesId, res);
        return Result.success();
    }

    @PostMapping("/upload/img")
    @SaIgnore
    public Result img(MultipartFile file) {
        return UploadUtil.uploadWeb(file);
    }

    @PostMapping("/upload/video")
    @SaIgnore
    public Result video(MultipartFile file) {
        return UploadUtil.uploadWeb(file);
    }

}
