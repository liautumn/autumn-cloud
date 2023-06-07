package com.autumn.auth.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.autumn.result.Result;
import com.autumn.user.entity.LoginDto;
import com.autumn.user.entity.User;
import com.autumn.user.service.UserService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
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
        return Result.success();
    }

    @PostMapping("/signUp")
    public Result signUp(@RequestBody User user) {
        return userService.insert(user);
    }

    @GetMapping("/delete")
    public Result delete(String id) {
        return userService.delete(id);
    }

    @PostMapping("/update")
    public Result update(@RequestBody User user) {
        return userService.updateUser(user);
    }

}
