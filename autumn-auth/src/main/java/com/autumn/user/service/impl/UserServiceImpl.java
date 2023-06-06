package com.autumn.user.service.impl;


import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.crypto.SecureUtil;
import com.autumn.result.Result;
import com.autumn.user.entity.LoginDto;
import com.autumn.user.entity.LoginVo;
import com.autumn.user.entity.User;
import com.autumn.user.mapper.UserMapper;
import com.autumn.user.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

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

    @Override
    public Result delete(String ids) {
        List<String> list = new ArrayList(Arrays.asList(ids.split(",")));
        int batchIds = userMapper.deleteBatchIds(list);
        return Result.success(batchIds);
    }

    @Override
    public Result insert(User user) {
        String pass = SecureUtil.pbkdf2(user.getPassword().toCharArray(), salt.getBytes());
        user.setPassword(pass);
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<User>().eq(User::getUserName, user.getUserName());
        if (userMapper.selectOne(queryWrapper) != null) {
            return Result.fail("用户名已存在");
        } else {
            return userMapper.insert(user) > 0 ? Result.success() : Result.fail();
        }
    }

    @Override
    public Result updateUser(User user) {
        return userMapper.updateById(user) > 0 ? Result.success() : Result.fail();
    }

    @Override
    public Result login(LoginDto login) {
        String password = login.getPassword();
        String userName = login.getUserName();
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<User>().eq(User::getUserName, userName);
        User user = userMapper.selectOne(queryWrapper);
        if (user != null) {
            String pass = SecureUtil.pbkdf2(password.toCharArray(), salt.getBytes());
            if (pass.equals(user.getPassword())) {
                StpUtil.login(user.getUserId(), new SaLoginModel().setDevice("PC").setIsLastingCookie(true));
                SaTokenInfo tokenInfo = StpUtil.getTokenInfo();
                StpUtil.getSession().set("user", user);
                LoginVo loginVo = new LoginVo();
                BeanUtils.copyProperties(user, loginVo);
                Map data = new HashMap();
                data.put("userInfo", loginVo);
                data.put("token", tokenInfo.tokenValue);
                return Result.success(data);
            } else {
                return Result.fail("密码错误");
            }
        } else {
            return Result.fail("用户不存在");
        }
    }
}
