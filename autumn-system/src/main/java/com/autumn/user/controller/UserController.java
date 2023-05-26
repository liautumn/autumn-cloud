package com.autumn.user.controller;

import cn.hutool.crypto.SecureUtil;
import com.autumn.user.entity.User;
import com.autumn.user.service.UserService;
import com.autumn.result.Result;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/user")
public class UserController {

    @Value("${autumn.password.salt}")
    private String salt;

    @Resource
    private UserService userService;

    @PostMapping("/insert")
    public Result insert(@RequestBody User user) {
        String pass = SecureUtil.pbkdf2(user.getPassword().toCharArray(), salt.getBytes());
        user.setPassword(pass);
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<User>().eq(User::getUserName, user.getUserName());
        if (userService.getOne(queryWrapper) != null) {
            return Result.fail("用户名已存在");
        } else {
            return userService.save(user) ? Result.success() : Result.fail();
        }
    }

}
