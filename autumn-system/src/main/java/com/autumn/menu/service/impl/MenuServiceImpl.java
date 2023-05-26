package com.autumn.menu.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.alibaba.fastjson2.JSON;
import com.autumn.menu.entity.Menu;
import com.autumn.menu.mapper.MenuMapper;
import com.autumn.menu.service.MenuService;
import com.autumn.redis.RedisUtils;
import com.autumn.result.Result;
import com.autumn.sa_token.StpInterfaceImpl;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Administrator
 * @description 针对表【sys_menu(菜单权限表)】的数据库操作Service实现
 * @createDate 2023-05-25 14:01:20
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu>
        implements MenuService {

    @Resource
    private MenuMapper menuMapper;
    @Resource
    private RedisUtils redisUtils;
    @Resource
    private StpInterfaceImpl stpInterface;

    @Override
    public Result getMenuList() {
        //获取当前用户id
        String loginId = String.valueOf(StpUtil.getLoginId());
        if ("".equals(loginId)) {
            return Result.fail("当前用户ID为空");
        }
        List<Menu> list = menuMapper.getMenuPermsList(loginId);
        List<String> collect = list.stream().map(role -> role.getPerms()).collect(Collectors.toList());
        //存入redis
        boolean b = redisUtils.set(loginId + "_permissionList", JSON.toJSONString(collect));
        if (b) {
            stpInterface.getRoleList(loginId, null);
            return Result.success(collect);
        } else {
            return Result.fail("获取菜单按钮权限失败");
        }
    }
}




