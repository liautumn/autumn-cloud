package com.autumn.mybatis_plus;

import cn.dev33.satoken.stp.StpUtil;
import com.autumn.user.entity.User;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
class MyMetaObjectHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        User user = StpUtil.getSession().get("user", new User());
        this.strictInsertFill(metaObject, "createTime", LocalDateTime.class, LocalDateTime.now());
        this.strictInsertFill(metaObject, "createBy", String.class, user.getUserName());
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        User user = StpUtil.getSession().get("user", new User());
        this.strictUpdateFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());
        this.strictUpdateFill(metaObject, "updateBy", String.class, user.getUserName());
    }
}
