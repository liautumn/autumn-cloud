package com.autumn.menu.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.alibaba.excel.EasyExcel;
import com.alibaba.fastjson2.JSON;
import com.autumn.dictionary.Dictionary;
import com.autumn.easyExcel.CustomRowHeightColWidthHandler;
import com.autumn.easyExcel.RowHeightColWidthModel;
import com.autumn.menu.excel.MenuDataListener;
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
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.*;
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
            return Result.failMsg("当前用户为空");
        }
        List<Menu> list = null;
        if (Dictionary.ADMINFLAG.equals(userInfo.getUserType())) {
            LambdaQueryWrapper queryWrapper = new LambdaQueryWrapper<Menu>()
                    .eq(Menu::getStatus, Dictionary.NO)
                    .orderByAsc(Menu::getOrderNum);
            list = menuMapper.selectList(queryWrapper);
        } else {
            list = menuMapper.getMenuList(userInfo.getId());
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
            meta.put("isLink", menu.getIsLink().equals(Dictionary.YES) ? menu.getPath() : "");
            meta.put("isHide", menu.getIsHide().equals(Dictionary.YES) ? true : false);
            meta.put("isFull", menu.getIsFull().equals(Dictionary.YES) ? true : false);
            meta.put("isAffix", menu.getIsAffix().equals(Dictionary.YES) ? true : false);
            meta.put("isKeepAlive", menu.getIsKeepAlive().equals(Dictionary.YES) ? true : false);
            data.put("meta", meta);
            nodeList.add(new TreeNode<>(menu.getId(), menu.getParentId(), menu.getName(), null).setExtra(data));
        });
        // 0表示最顶层的id是0
        List<Tree<String>> treeList = TreeUtil.build(nodeList, Dictionary.ROOTID);
        return Result.successData(treeList);
    }

    @Override
    public Result getBtnsList() {
        //获取当前用户id
        String loginId = String.valueOf(StpUtil.getLoginId());
        if ("".equals(loginId)) {
            return Result.failMsg("当前用户ID为空");
        }
        List<Menu> list = menuMapper.getBtnPermsList(loginId);
        List<String> collect = list.stream().map(menu -> menu.getPerms()).collect(Collectors.toList());
        //存入redis
        boolean b = redisUtil.set(loginId + "_permissionList", JSON.toJSONString(collect));
        if (b) {
            stpInterface.getRoleList(loginId, null);
            return Result.successData(collect);
        } else {
            return Result.failMsg("获取菜单按钮权限失败");
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
                nodeList.add(new TreeNode<>(menu.getId(), menu.getParentId(), null, null).setExtra(map));
            });
            // 0表示最顶层的id是0
            List<Tree<String>> treeList = TreeUtil.build(nodeList, Dictionary.YES);
            return ResData.setDataTotal(page, treeList);
        } else {
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
        List<String> idList = Arrays.asList(ids.split(","));
        int i = menuMapper.deleteBatchIds(idList);
        return i > 0 ? Result.success() : Result.fail();
    }

    @Override
    public void exportMenu(MenuSelectDto menuSelectDto, HttpServletResponse response) {
        List<Menu> menus = new ArrayList<>();
        if (!menuSelectDto.getTempFlag()) {
            LambdaQueryWrapper<Menu> queryWrapper = new LambdaQueryWrapper<Menu>()
                    .orderByAsc(Menu::getOrderNum);
            menus = menuMapper.selectList(queryWrapper);
        }
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("utf-8");
        try {
            // 这里URLEncoder.encode可以防止中文乱码 当然和easyexcel没有关系
            String fileName = URLEncoder.encode("菜单列表", "UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");

            List<RowHeightColWidthModel> rowHeightColWidthList = new ArrayList<>();
            String sheetName = "菜单";
            //设置行高
//            rowHeightColWidthList.add(RowHeightColWidthModel.createRowHeightModel(sheetName, 0, 20f));
            //隐藏行
//            rowHeightColWidthList.add(RowHeightColWidthModel.createHideRowModel(sheetName, 2));
            //设置列宽
            rowHeightColWidthList.add(RowHeightColWidthModel.createColWidthModel(sheetName, 0, 20));
            //隐藏列
            rowHeightColWidthList.add(RowHeightColWidthModel.createHideColModel(sheetName, 0));

            EasyExcel.write(response.getOutputStream(), Menu.class)
                    .sheet(sheetName)
                    .registerWriteHandler(new CustomRowHeightColWidthHandler(rowHeightColWidthList))
                    .doWrite(menus);
        } catch (Exception e) {
            e.getMessage();
        }
    }

    @Resource
    private MenuService menuService;

    @Override
    public Result importMenu(MultipartFile file) {
        try {
            EasyExcel.read(file.getInputStream(), Menu.class, new MenuDataListener(menuService)).sheet("菜单").doRead();
        } catch (Exception e) {
            e.getMessage();
        }
        return Result.success();
    }

}




