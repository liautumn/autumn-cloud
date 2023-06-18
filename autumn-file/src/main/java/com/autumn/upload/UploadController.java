package com.autumn.upload;

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
    public Result view(@RequestParam("filesIds") String filesIds) {
        return Result.successData(uploadUtil.filesIdsTofiles(filesIds));
    }

    @GetMapping("/delete")
    public Result delete(@RequestParam("filesId") String filesId) {
        Result remove = uploadUtil.remove(filesId);
        return Result.successData(remove);
    }

    @GetMapping("/download")
    public Result download(@RequestParam("filesId") String filesId, HttpServletResponse response) {
        uploadUtil.download(filesId, response);
        return Result.success();
    }

    @PostMapping("/upload")
    public Result img(MultipartFile file) {
        return uploadUtil.uploadWeb(file);
    }

    @GetMapping("/parse")
    public Result parse(String fileIds) throws Exception {
        return uploadUtil.parse(fileIds);
    }

}
