package com.autumn.user.controller;

import com.autumn.result.Result;
import com.autumn.user.entity.UserInsertDto;
import com.autumn.user.entity.UserSelectDto;
import com.autumn.user.entity.UserUpdateDto;
import com.autumn.user.service.UserService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;

/**
 * @author lqz
 * @date 2023-07-10 15:27:07
 * 用户信息 Controller
 */
@Validated
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    /**
     * 用户信息查询
     */
    @PostMapping("/select")
    public Result selectUser(@RequestBody UserSelectDto userSelectDto) {
        return userService.selectUser(userSelectDto);
    }

    /**
     * 用户信息新增
     */
    @PostMapping("/insert")
    public Result insertUser(@RequestBody @Validated UserInsertDto userInsertDto) {
        return userService.insertUser(userInsertDto);
    }

    /**
     * 用户信息修改
     */
    @PostMapping("/update")
    public Result updateUser(@RequestBody @Validated UserUpdateDto userUpdateDto) {
        return userService.updateUser(userUpdateDto);
    }

    /**
     * 用户信息删除
     */
    @GetMapping("/delete")
    public Result deleteUser(@RequestParam("ids") @NotBlank(message = "ids不能为空") String ids) {
        return userService.deleteUser(ids);
    }

    /**
     * 用户信息excel导出
     */
    @PostMapping("/export")
    public void exportUser(@RequestBody UserSelectDto userSelectDto, HttpServletResponse response) {
        userService.exportUser(userSelectDto, response);
    }

    /**
     * 用户信息excel导入
     */
    @PostMapping("/import")
    public Result importUser(MultipartFile file) {
        return userService.importUser(file);
    }

}
