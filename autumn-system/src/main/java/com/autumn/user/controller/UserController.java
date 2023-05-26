package com.autumn.user.controller;

import cn.hutool.crypto.SecureUtil;
import com.autumn.user.entity.User;
import com.autumn.result.Result;
import com.autumn.user.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.NotBlank;

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

    @GetMapping("/delete")
    public Result delete(@NotBlank(message = "用户id不能为空") String ids) {
        return userService.delete(ids);
    }

    @PostMapping("/update")
    public Result update(@RequestBody User user) {
        boolean b = userService.updateById(user);
        return Result.success(b);
    }

}
