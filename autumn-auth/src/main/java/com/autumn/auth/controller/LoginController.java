package com.autumn.auth.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.autumn.result.Result;
import com.autumn.user.entity.LoginDto;
import com.autumn.user.entity.UserInsertDto;
import com.autumn.user.entity.UserUpdateDto;
import com.autumn.user.service.UserService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
public class LoginController {

    @Resource
    private UserService userService;

    /**
     * 登录
     *
     * @param login
     * @return
     */
    @PostMapping("/login")
    public Result login(@RequestBody @Validated LoginDto login) {
        return userService.login(login);
    }

    /**
     * 登出
     *
     * @return
     */
    @GetMapping("/logout")
    public Result logout() {
        StpUtil.logout();
        return Result.success();
    }

    /**
     * 注册
     *
     * @param userInsertDto
     * @return
     */
    @PostMapping("/signUp")
    public Result signUp(@RequestBody @Validated UserInsertDto userInsertDto) {
        return userService.insertUser(userInsertDto);
    }

    /**
     * 注销
     *
     * @param id
     * @return
     */
    @GetMapping("/delete")
    public Result delete(@RequestParam("id") String id) {
        return userService.deleteUser(id);
    }

    /**
     * 修改信息
     *
     * @param userUpdateDto
     * @return
     */
    @PostMapping("/update")
    public Result update(@RequestBody @Validated UserUpdateDto userUpdateDto) {
        return userService.updateUser(userUpdateDto);
    }

}
