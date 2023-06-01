package com.autumn.sa_token;

import cn.dev33.satoken.stp.StpUtil;
import com.autumn.user.entity.User;

public class LoginInfoData {

    public static User getUserInfo(){
        return StpUtil.getSession().get("user", new User());
    }

}
