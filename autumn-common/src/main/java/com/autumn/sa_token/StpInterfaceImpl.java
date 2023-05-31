package com.autumn.sa_token;

import cn.dev33.satoken.stp.StpInterface;
import cn.dev33.satoken.stp.StpUtil;
import com.alibaba.fastjson2.JSON;
import com.autumn.redis.RedisUtil;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 自定义权限验证接口扩展
 */
@Component
public class StpInterfaceImpl implements StpInterface {

    @Resource
    private RedisUtil redisUtil;

    /**
     * 返回一个账号所拥有的权限码集合
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        Object o = redisUtil.get(loginId + "_permissionList");
        List<String> list = o != null ? JSON.parseObject(String.valueOf(o), List.class) : new ArrayList<>();
        return list;
    }

    /**
     * 返回一个账号所拥有的角色标识集合 (权限与角色可分开校验)
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        Object o = redisUtil.get(StpUtil.getLoginId() + "_roleList");
        List<String> list = o != null ? JSON.parseObject(String.valueOf(o), List.class) : new ArrayList<>();
        return list;
    }

}
