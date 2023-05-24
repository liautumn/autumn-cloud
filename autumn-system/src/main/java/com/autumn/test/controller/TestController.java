package com.autumn.test.controller;


import cn.dev33.satoken.annotation.SaCheckPermission;
import com.alibaba.fastjson.JSON;
import com.autumn.test.service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/demo")
public class TestController {

    @Autowired
    private DemoService demoService;

    @GetMapping("/list")
    @SaCheckPermission("user-delete")
    public String select() {
        return JSON.toJSONString(demoService.list());
    }


}
