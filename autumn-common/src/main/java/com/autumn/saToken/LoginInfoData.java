package com.autumn.saToken;

import cn.dev33.satoken.stp.StpUtil;
import com.autumn.saToken.entity.User;

public class LoginInfoData {

    public static User getUserInfo() {
        return StpUtil.getSession().get("user", new User());
    }

    public static void setUserInfo(Object data) {
        StpUtil.getSession().set("user", data);
    }

}
