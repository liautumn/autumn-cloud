package com.autumn.auth.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.autumn.auth.entity.LoginDto;
import com.autumn.result.Result;
import com.autumn.user.service.UserService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class LoginController {

    @Resource
    private UserService userService;

    @PostMapping("/login")
    public Result login(@RequestBody @Validated LoginDto login) {
        return userService.login(login);
    }

    @PostMapping("/logout")
    public Result logout() {
        StpUtil.logout();
        return Result.success("退出登录成功");
    }

}
