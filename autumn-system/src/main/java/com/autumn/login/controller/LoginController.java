package com.autumn.login.controller;

import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.autumn.login.entity.LoginVo;
import com.autumn.utils.ErrorCode;
import com.autumn.utils.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: autumn
 * @Date: 2022/1/22
 */
@RestController
public class LoginController {

    @Value("${sa-token.timeout}")
    private String tokenTimeOut;

    @GetMapping("/login")
    public Result login(LoginVo loginVo) {
        // 此处仅作模拟示例，真实项目需要从数据库中查询数据进行比对
        if ("admin".equals(loginVo.getAccount()) && "123456".equals(loginVo.getPassword())) {
            //登录认证
            StpUtil.login(loginVo.getId(), new SaLoginModel()
                    .setDevice("PC")           // 此次登录的客户端设备标识, 用于[同端互斥登录]时指定此次登录的设备名称
                    .setIsLastingCookie(loginVo.getRemember())  //开启记住我
            );
            //获取登录成功后的token
            SaTokenInfo tokenInfo = StpUtil.getTokenInfo();
            Map data = new HashMap();
            data.put("account", loginVo.getAccount());
            data.put("token", tokenInfo.tokenValue);
            data.put("failure_time", new Date().getTime() + Long.parseLong(tokenTimeOut));
            return Result.success(data, "登录成功");
        }
        return Result.fail(ErrorCode.LOGIN_ERROR.getCode(), ErrorCode.LOGIN_ERROR.getMsg());
    }

    @GetMapping("/logout")
    public Result logout() {
        StpUtil.logout();
        return Result.success("退出成功");
    }

}
