package com.autumn.auth.controller;

import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.crypto.SecureUtil;
import com.autumn.auth.entity.LoginDto;
import com.autumn.auth.entity.LoginVo;
import com.autumn.user.entity.User;
import com.autumn.user.service.UserService;
import com.autumn.utils.Result;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@RestController
public class LoginController {

    @Value("${autumn.password.salt}")
    private String salt;

    @Resource
    private UserService userService;

    @PostMapping("/login")
    public Result login(@RequestBody @Validated LoginDto login) {
        String password = login.getPassword();
        String userName = login.getUserName();
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<User>().eq(User::getUserName, userName);
        User user = userService.getOne(queryWrapper);
        if (user != null) {
            String pass = SecureUtil.pbkdf2(password.toCharArray(), salt.getBytes());
            if (pass.equals(user.getPassword())) {
                StpUtil.login(user.getUserId(), new SaLoginModel().setDevice("PC").setIsLastingCookie(true));
                SaTokenInfo tokenInfo = StpUtil.getTokenInfo();
                LoginVo loginVo = new LoginVo();
                BeanUtils.copyProperties(user, loginVo);
                Map data = new HashMap();
                data.put("userInfo", loginVo);
                data.put("access_token", tokenInfo.tokenValue);
                return Result.success(data);
            } else {
                return Result.fail("密码错误");
            }
        } else {
            return Result.fail("用户不存在");
        }
    }

    @PostMapping("/logout")
    public Result logout() {
        StpUtil.logout();
        return Result.success("退出登录成功");
    }

}
