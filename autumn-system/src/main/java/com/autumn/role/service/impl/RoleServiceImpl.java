package com.autumn.role.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.alibaba.fastjson2.JSON;
import com.autumn.redis.RedisUtils;
import com.autumn.result.Result;
import com.autumn.role.entity.Role;
import com.autumn.role.mapper.RoleMapper;
import com.autumn.role.service.RoleService;
import com.autumn.sa_token.StpInterfaceImpl;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Administrator
 * @description 针对表【sys_role(角色信息表)】的数据库操作Service实现
 * @createDate 2023-05-25 14:19:47
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Resource
    private RoleMapper roleMapper;
    @Resource
    private RedisUtils redisUtils;
    @Resource
    private StpInterfaceImpl stpInterface;

    @Override
    public Result getRolelist() {
        //获取当前用户id
        String loginId = String.valueOf(StpUtil.getLoginId());
        if ("".equals(loginId)) {
            return Result.fail("当前用户ID为空");
        }
        List<Role> list = roleMapper.getRoleKeyList(loginId);
        List<String> collect = list.stream().map(role -> role.getRoleKey()).collect(Collectors.toList());
        //存入redis
        boolean b = redisUtils.set(loginId + "_roleList", JSON.toJSONString(collect));
        if (b) {
            stpInterface.getRoleList(loginId, null);
            return Result.success(collect);
        } else {
            return Result.fail("获取角色权限失败");
        }
    }
}




