package com.autumn.menu.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.alibaba.fastjson2.JSON;
import com.autumn.dictionary.Dictionary;
import com.autumn.menu.entity.Menu;
import com.autumn.menu.entity.MenuInsertDto;
import com.autumn.menu.entity.MenuSelectDto;
import com.autumn.menu.entity.MenuUpdateDto;
import com.autumn.menu.mapper.MenuMapper;
import com.autumn.menu.service.MenuService;
import com.autumn.page.ResData;
import com.autumn.redis.RedisUtil;
import com.autumn.result.Result;
import com.autumn.sa_token.LoginInfoData;
import com.autumn.sa_token.StpInterfaceImpl;
import com.autumn.user.entity.User;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author Administrator
 * @description 针对表【sys_menu(菜单权限表)】的数据库操作Service实现
 * @createDate 2023-05-31 14:56:54
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    @Resource
    private MenuMapper menuMapper;
    @Resource
    private RedisUtil redisUtil;
    @Resource
    private StpInterfaceImpl stpInterface;

    @Override
    public Result getMenuList() {
        //获取当前用户id
        User userInfo = LoginInfoData.getUserInfo();
        if (userInfo == null) {
            return Result.fail("当前用户为空");
        }
        List<Menu> list = null;
        if (Dictionary.adminFlag.equals(userInfo.getUserType())) {
            LambdaQueryWrapper queryWrapper = new LambdaQueryWrapper<Menu>()
                    .orderByAsc(Menu::getOrderNum);
            list = menuMapper.selectList(queryWrapper);
        } else {
            list = menuMapper.getMenuList(userInfo.getUserId());
        }
        // 构建node列表
        List<TreeNode<String>> nodeList = CollUtil.newArrayList();
        list.stream().forEach(menu -> {
            Map data = new HashMap();
            data.put("path", menu.getPath());
            data.put("component", menu.getComponent());
            data.put("redirect", menu.getRedirect());
            Map meta = new HashMap();
            meta.put("icon", menu.getIcon());
            meta.put("title", menu.getTitle());
            meta.put("activeMenu", menu.getActiveMenu());
            meta.put("isLink", menu.getIsLink().equals("0") ? true : false);
            meta.put("isHide", menu.getIsHide().equals("0") ? true : false);
            meta.put("isFull", menu.getIsFull().equals("0") ? true : false);
            meta.put("isAffix", menu.getIsAffix().equals("0") ? true : false);
            meta.put("isKeepAlive", menu.getIsKeepAlive().equals("0") ? true : false);
            data.put("meta", meta);
            nodeList.add(new TreeNode<>(String.valueOf(menu.getMenuId()), String.valueOf(menu.getParentId()), menu.getName(), null).setExtra(data));
        });
        // 0表示最顶层的id是0
        List<Tree<String>> treeList = TreeUtil.build(nodeList, "0");
        return Result.success(treeList);
    }

    @Override
    public Result getBtnsList() {
        //获取当前用户id
        String loginId = String.valueOf(StpUtil.getLoginId());
        if ("".equals(loginId)) {
            return Result.fail("当前用户ID为空");
        }
        List<Menu> list = menuMapper.getBtnPermsList(loginId);
        List<String> collect = list.stream().map(menu -> menu.getPerms()).collect(Collectors.toList());
        //存入redis
        boolean b = redisUtil.set(loginId + "_permissionList", JSON.toJSONString(collect));
        if (b) {
            stpInterface.getRoleList(loginId, null);
            return Result.success(collect);
        } else {
            return Result.fail("获取菜单按钮权限失败");
        }
    }

    @Override
    public Result selectMenu(MenuSelectDto menuSelectDto) {
        Page<Menu> page = PageHelper.startPage(menuSelectDto.getPageNum(), menuSelectDto.getPageSize());
        LambdaQueryWrapper<Menu> queryWrapper = new LambdaQueryWrapper<Menu>()
                .orderByAsc(Menu::getOrderNum);
        List<Menu> menus = menuMapper.selectList(queryWrapper);
        if (!CollectionUtils.isEmpty(menus)) {
            // 构建node列表
            List<TreeNode<String>> nodeList = CollUtil.newArrayList();
            menus.stream().forEach(menu -> {
                Map map = JSON.parseObject(JSON.toJSONString(menu), Map.class);
                map.remove("parentId");
                nodeList.add(new TreeNode<>(String.valueOf(menu.getMenuId()), String.valueOf(menu.getParentId()), null, null).setExtra(map));
            });
            // 0表示最顶层的id是0
            List<Tree<String>> treeList = TreeUtil.build(nodeList, "0");
            return ResData.setDataTotal(page, treeList);
        }else {
            return ResData.setDataTotal(page);
        }
    }

    @Override
    public Result insertMenu(MenuInsertDto menuInsertDto) {
        Menu menu = new Menu();
        BeanUtils.copyProperties(menuInsertDto, menu);
        int i = menuMapper.insert(menu);
        return i > 0 ? Result.success() : Result.fail();
    }

    @Override
    public Result updateMenu(MenuUpdateDto menuUpdateDto) {
        Menu menu = new Menu();
        BeanUtils.copyProperties(menuUpdateDto, menu);
        int i = menuMapper.updateById(menu);
        return i > 0 ? Result.success() : Result.fail();
    }

    @Override
    public Result deleteMenu(String ids) {
        String[] split = ids.split(",");
        List<Long> idList = Arrays.stream(split).map(s -> Long.parseLong(s.trim())).collect(Collectors.toList());
        int i = menuMapper.deleteBatchIds(idList);
        return i > 0 ? Result.success() : Result.fail();
    }

}




