package com.autumn.mybatis_plus;

import com.autumn.sa_token.LoginInfoData;
import com.autumn.sa_token.entity.User;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
class MyMetaObjectHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        User user = LoginInfoData.getUserInfo();
        this.strictInsertFill(metaObject, "createTime", LocalDateTime.class, LocalDateTime.now());
        this.strictInsertFill(metaObject, "createBy", String.class, user.getUserName());
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        User user = LoginInfoData.getUserInfo();
        this.strictUpdateFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());
        this.strictUpdateFill(metaObject, "updateBy", String.class, user.getUserName());
    }
}
