package com.autumn.upload;

import com.autumn.result.Result;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;

/**
 * @author liqiuzhuang
 * @date 2023-06-11 9:49
 */
@Validated
@RestController
@RequestMapping("/file")
public class UploadController {

    @Resource
    private UploadUtil uploadUtil;

    @GetMapping("/view")
    public Result view(@RequestParam("filesIds") @NotBlank(message = "filesIds不能为空") String filesIds) {
        return Result.successData(uploadUtil.filesIdsTofiles(filesIds));
    }

    @GetMapping("/delete")
    public Result delete(@RequestParam("filesId") @NotBlank(message = "filesId不能为空") String filesId) {
        Result remove = uploadUtil.remove(filesId);
        return Result.successData(remove);
    }

    @GetMapping("/download")
    public Result download(@RequestParam("filesId") @NotBlank(message = "filesId不能为空") String filesId, HttpServletResponse response) {
        uploadUtil.download(filesId, response);
        return Result.success();
    }

    @PostMapping("/upload")
    public Result img(MultipartFile file) {
        return uploadUtil.uploadWeb(file);
    }

    @GetMapping("/parse")
    public Result parse(@RequestParam("fileIds") @NotBlank(message = "fileIds不能为空") String fileIds) throws Exception {
        return uploadUtil.parse(fileIds);
    }

}
