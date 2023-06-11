package com.autumn.generate.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import com.autumn.generate.entity.GenDto;
import com.autumn.generate.service.GenerateService;
import com.autumn.result.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
class GenerateController {

    @Resource
    private GenerateService generateService;

    @GetMapping("/generate")
    @SaIgnore
    public Result generate(GenDto genDto) {
        return generateService.generate(genDto);
    }


}
