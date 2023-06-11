package com.autumn.minio;

import cn.dev33.satoken.annotation.SaIgnore;
import com.autumn.result.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author liqiuzhuang
 * @date 2023-06-11 9:49
 */
@RestController
@RequestMapping("/minio")
public class Controller {

    @Resource
    private MinioUtil minioUtil;

    @GetMapping("/view")
    @SaIgnore
    public Result preview(@RequestParam("fileName") String fileName) {
        return Result.success(minioUtil.preview(fileName));
    }

}
