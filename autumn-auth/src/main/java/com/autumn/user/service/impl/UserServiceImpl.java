package com.autumn.user.service.impl;


import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.crypto.SecureUtil;
import com.anji.captcha.model.common.ResponseModel;
import com.anji.captcha.model.vo.CaptchaVO;
import com.anji.captcha.service.CaptchaService;
import com.autumn.dictionary.Dictionary;
import com.autumn.result.Result;
import com.autumn.saToken.LoginInfoData;
import com.autumn.saToken.entity.User;
import com.autumn.user.entity.*;
import com.autumn.user.mapper.UserMapper;
import com.autumn.user.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Administrator
 * @description 针对表【sys_user(用户信息表)】的数据库操作Service实现
 * @createDate 2023-05-25 13:48:41
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Value("${autumn.password.salt}")
    private String salt;
    @Resource
    private CaptchaService captchaService;

    @Override
    public Result deleteUser(String id) {
        int i = userMapper.deleteById(id);
        return i > 0 ? Result.success() : Result.fail();
    }

    @Override
    public Result insertUser(UserInsertDto userInsertDto) {
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<User>().eq(User::getUserName, userInsertDto.getUserName());
        if (userMapper.selectOne(queryWrapper) != null) {
            return Result.failMsg("用户名已存在");
        } else {
            String pass = SecureUtil.pbkdf2(userInsertDto.getPassword().toCharArray(), salt.getBytes());
            userInsertDto.setPassword(pass);
            User user = new User();
            BeanUtils.copyProperties(userInsertDto, user);
            return userMapper.insert(user) > 0 ? Result.success() : Result.fail();
        }
    }

    @Override
    public Result updateUser(UserUpdateDto userUpdateDto) {
        User user = new User();
        BeanUtils.copyProperties(userUpdateDto, user);
        return userMapper.updateById(user) > 0 ? Result.success() : Result.fail();
    }

    @Override
    public Result login(LoginDto login) {
        CaptchaVO captchaVO = new CaptchaVO();
        captchaVO.setCaptchaVerification(login.getCaptchaVerification());
        ResponseModel response = captchaService.verification(captchaVO);
        if (response.isSuccess() == false) {
            return Result.failMsg("验证码校验失败");
        }
        String password = login.getPassword();
        String userName = login.getUserName();
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<User>().eq(User::getUserName, userName).eq(User::getStatus, Dictionary.NO);
        User user = userMapper.selectOne(queryWrapper);
        if (user != null) {
            String pass = SecureUtil.pbkdf2(password.toCharArray(), salt.getBytes());
            if (pass.equals(user.getPassword())) {
                StpUtil.login(user.getId(), new SaLoginModel().setDevice(Dictionary.PC).setIsLastingCookie(login.getIsRemember()));
                SaTokenInfo tokenInfo = StpUtil.getTokenInfo();
                LoginInfoData.setUserInfo(user);
                LoginVo loginVo = new LoginVo();
                BeanUtils.copyProperties(user, loginVo);
                Map data = new HashMap();
                data.put("userInfo", loginVo);
                data.put("token", tokenInfo.tokenValue);
                //修改登录时间, 登录IP
                User us = new User();
                us.setId(user.getId());
                us.setLoginIp(login.getLoginIp());
                us.setLoginDate(LocalDateTime.now());
                userMapper.updateById(us);
                return Result.successData(data);
            } else {
                return Result.failMsg("密码错误");
            }
        } else {
            return Result.failMsg("用户不存在或用户已被停用");
        }
    }

    @Override
    public Result getOneUser(String id) {
        Map user = userMapper.getInfoById(id);
        return Result.successData(user);
    }

    @Override
    public Result updatePassword(PasswordDto passwordDto) {
        User user = userMapper.selectById(passwordDto.getId());
        if (user == null) {
            return Result.failMsg("用户不存在");
        }
        String pass = SecureUtil.pbkdf2(passwordDto.getOldPassword().toCharArray(), salt.getBytes());
        if (!pass.equals(user.getPassword())) {
            return Result.failMsg("原密码错误");
        }
        String newPass = SecureUtil.pbkdf2(passwordDto.getNewPassword().toCharArray(), salt.getBytes());
        User userUpdate = new User();
        userUpdate.setId(passwordDto.getId());
        userUpdate.setPassword(newPass);
        int i = userMapper.updateById(userUpdate);
        return i > 0 ? Result.success() : Result.failMsg("修改密码失败");
    }
}
