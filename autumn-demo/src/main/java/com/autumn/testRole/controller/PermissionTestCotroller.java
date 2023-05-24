package com.autumn.testRole.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.annotation.SaIgnore;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: autumn
 * @Date: 2022/1/22
 */
@RestController
@RequestMapping("/per2")
public class PermissionTestCotroller {

    @GetMapping("/add")
    @SaCheckPermission("user-add")
    public String add() {
        return "add ok";
    }

    @GetMapping("/delete")
    @SaIgnore
    public String delete() {
        return "delete ok";
    }

    @GetMapping("/update")
    @SaCheckPermission("user-update")
    public String update() {
        return "update ok";
    }

    @GetMapping("/select")
    @SaCheckPermission("user-select")
    public String select() {
        return "select ok";
    }

}
