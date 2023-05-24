package com.autumn.test.controller;


import cn.dev33.satoken.annotation.SaCheckPermission;
import com.alibaba.fastjson.JSON;
import com.autumn.test.service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/demo")
public class TestController {

    @Autowired
    private DemoService demoService;

    @GetMapping("/list")
    @SaCheckPermission("user-get")
    public String select() {
        return JSON.toJSONString(demoService.list());
    }


}
