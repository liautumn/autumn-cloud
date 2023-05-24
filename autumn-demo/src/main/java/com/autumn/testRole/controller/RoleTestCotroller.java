package com.autumn.testRole.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: autumn
 * @Date: 2022/1/22
 */
@RestController
@RequestMapping("/role2")
public class RoleTestCotroller {

    @GetMapping("/admin")
    @SaCheckRole("admin")
    public String admin() {
        return "admin ok";
    }

    @GetMapping("/root")
    @SaCheckRole("root")
    public String root() {
        return "root ok";
    }

}
