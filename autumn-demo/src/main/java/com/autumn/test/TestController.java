package com.autumn.test;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.annotation.SaCheckRole;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/roleCommon")
    @SaCheckRole("common")
    public String ok() {
        return "ok";
    }

    @GetMapping("/roleAdmin")
    @SaCheckRole("admin")
    public String no() {
        return "no";
    }

    @GetMapping("/list")
    @SaCheckPermission("system:user:list")
    public String list() {
        return "ok";
    }

    @GetMapping("/list111")
    @SaCheckPermission("system:user:list111")
    public String l111() {
        return "no";
    }

}
