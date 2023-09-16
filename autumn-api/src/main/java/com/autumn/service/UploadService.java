package com.autumn;

import com.autumn.result.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * @author liqiuzhuang
 * @date 2023-06-11 15:26
 */
@Component
@FeignClient(name = "autumn-file")
public interface UploadService {

    //上传文件
    @PostMapping("/upload")
    Result img(@RequestParam("file") MultipartFile file);

    //下载文件
    @GetMapping("/download")
    void download(@RequestParam("filesId") String filesId, HttpServletResponse response);

    //删除文件
    @GetMapping("/file/delete")
    Result delete(@RequestParam("filesId") String filesId);

    //解析文件
    @GetMapping("/parse")
    Result parse(@RequestParam("fileIds") String fileIds);

}
