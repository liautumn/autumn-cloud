package com.autumn.auth.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.autumn.result.Result;
import com.autumn.user.entity.LoginDto;
import com.autumn.user.entity.PasswordDto;
import com.autumn.user.entity.UserInsertDto;
import com.autumn.user.entity.UserUpdateDto;
import com.autumn.user.service.UserService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.NotBlank;

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
    @PostMapping("/logout")
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
    public Result delete(@RequestParam("id") @NotBlank(message = "id不能为空") String id) {
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

    /**
     * 获取用户信息
     *
     * @param id
     * @return
     */
    @GetMapping("/getOneUser")
    public Result getOneUser(@RequestParam("id") @NotBlank(message = "id不能为空") String id) {
        return userService.getOneUser(id);
    }

    /**
     * 修改密码
     *
     * @param passwordDto
     * @return
     */
    @PostMapping("/updatePassword")
    public Result updatePassword(@RequestBody @Validated PasswordDto passwordDto) {
        return userService.updatePassword(passwordDto);
    }

}
