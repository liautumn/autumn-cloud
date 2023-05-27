package com.autumn.user.controller;

import com.autumn.result.Result;
import com.autumn.user.entity.User;
import com.autumn.user.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.NotBlank;

@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @PostMapping("/insert")
    public Result insert(@RequestBody User user) {
        return userService.insert(user);
    }

    @GetMapping("/delete")
    public Result delete(@NotBlank(message = "用户id不能为空") String ids) {
        return userService.delete(ids);
    }

    @PostMapping("/update")
    public Result update(@RequestBody User user) {
        return userService.updateUser(user);
    }

    @GetMapping("/select")
    public Result select() {
        return userService.select();
    }

}
