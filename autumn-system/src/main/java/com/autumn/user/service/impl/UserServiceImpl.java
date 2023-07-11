package com.autumn.user.service.impl;

import com.alibaba.excel.EasyExcel;
import com.alibaba.fastjson2.JSON;
import com.autumn.easyExcel.CustomRowHeightColWidthHandler;
import com.autumn.easyExcel.RowHeightColWidthModel;
import com.autumn.easyExcel.listener.ImportExcelListener;
import com.autumn.page.ResData;
import com.autumn.result.Result;
import com.autumn.saToken.entity.User;
import com.autumn.user.entity.UserInsertDto;
import com.autumn.user.entity.UserSelectDto;
import com.autumn.user.entity.UserUpdateDto;
import com.autumn.user.mapper.UserMapper;
import com.autumn.user.service.UserService;
import com.autumn.userRole.entity.UserRole;
import com.autumn.userRole.mapper.UserRoleMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author lqz
 * @date 2023-07-10 15:27:07
 * 用户信息 ServiceImpl
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Resource
    private UserMapper userMapper;
    @Resource
    private UserService userService;
    @Resource
    private UserRoleMapper userRoleMapper;

    /**
     * 用户信息查询
     */
    @Override
    public Result selectUser(UserSelectDto userSelectDto) {
        Page<User> page = PageHelper.startPage(userSelectDto.getPageNum(), userSelectDto.getPageSize());
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<User>()
                .orderByDesc(User::getCreateTime);
        List<User> userList = userMapper.selectList(queryWrapper);
        List<Map> list = new ArrayList<>();
        for (User user : userList) {
            Map map = JSON.parseObject(JSON.toJSONString(user), Map.class);
            LambdaQueryWrapper<UserRole> wrapper = new LambdaQueryWrapper<UserRole>()
                    .eq(UserRole::getUserId, user.getId());
            List<UserRole> userRoles = userRoleMapper.selectList(wrapper);
            List<String> roleIds = userRoles.stream().map(m -> {
                return m.getRoleId();
            }).collect(Collectors.toList());
            map.put("roleList", roleIds);
            list.add(map);
        }
        return ResData.setDataTotal(page, list);
    }

    /**
     * 用户信息新增
     */
    @Transactional
    @Override
    public Result insertUser(UserInsertDto userInsertDto) {
        User user = new User();
        BeanUtils.copyProperties(userInsertDto, user);
        //新增主表
        int i = userMapper.insert(user);
        //新增子表
        List<String> roleList = userInsertDto.getRoleList();
        if (!CollectionUtils.isEmpty(roleList)) {
            for (String s : roleList) {
                UserRole userRole = new UserRole();
                userRole.setRoleId(s);
                userRole.setUserId(user.getId());
                userRoleMapper.insert(userRole);
            }
        }
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 用户信息修改
     */
    @Transactional
    @Override
    public Result updateUser(UserUpdateDto userUpdateDto) {
        User user = new User();
        BeanUtils.copyProperties(userUpdateDto, user);
        //修改主表
        int i = userMapper.updateById(user);
        //修改子表
        List<String> roleList = userUpdateDto.getRoleList();
        if (!CollectionUtils.isEmpty(roleList)) {
            //查询原来数据集
            LambdaQueryWrapper<UserRole> wrapper = new LambdaQueryWrapper<UserRole>()
                    .eq(UserRole::getUserId, user.getId());
            List<UserRole> userRoles = userRoleMapper.selectList(wrapper);
            List<String> roleIds = userRoles.stream().map(m -> {
                return m.getRoleId();
            }).collect(Collectors.toList());
            List<String> differenceIds = Stream.concat(
                            roleIds.stream().filter(str -> !roleList.contains(str)),
                            roleList.stream().filter(str -> !roleIds.contains(str)))
                    .collect(Collectors.toList());
            if (!CollectionUtils.isEmpty(differenceIds)) {
                for (String s : differenceIds) {
                    UserRole userRole = new UserRole();
                    userRole.setRoleId(s);
                    userRole.setUserId(user.getId());
                    LambdaQueryWrapper<UserRole> wrapper1 = new LambdaQueryWrapper<UserRole>()
                            .eq(UserRole::getUserId, user.getId())
                            .eq(UserRole::getRoleId, s);
                    UserRole selectOne = userRoleMapper.selectOne(wrapper1);
                    if (selectOne == null) {
                        userRoleMapper.insert(userRole);
                    } else {
                        userRoleMapper.deleteById(selectOne.getId());
                    }
                }
            }
        } else {
            LambdaQueryWrapper<UserRole> wrapper = new LambdaQueryWrapper<UserRole>()
                    .eq(UserRole::getUserId, user.getId());
            UserRole selectOne = userRoleMapper.selectOne(wrapper);
            userRoleMapper.deleteById(selectOne.getId());
        }
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 用户信息删除
     */
    @Transactional
    @Override
    public Result deleteUser(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        //删除主表
        int i = userMapper.deleteBatchIds(idList);
        //删除子表
        for (String id : idList) {
            LambdaQueryWrapper<UserRole> wrapper = new LambdaQueryWrapper<UserRole>()
                    .eq(UserRole::getUserId, id);
            userRoleMapper.delete(wrapper);
        }
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 用户信息excel导出
     */
    @Override
    public void exportUser(UserSelectDto userSelectDto, HttpServletResponse response) {
        List<User> list = new ArrayList<>();
        if (!userSelectDto.getTempFlag()) {
            LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<User>()
                    .orderByDesc(User::getCreateTime);
            list = userMapper.selectList(queryWrapper);
        }
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("utf-8");
        try {
            String sheetName = "用户信息";
            // 这里URLEncoder.encode可以防止中文乱码
            String fileName = URLEncoder.encode(sheetName + "列表", "UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
            List<RowHeightColWidthModel> rowHeightColWidthList = new ArrayList<>();
            //隐藏列
            rowHeightColWidthList.add(RowHeightColWidthModel.createHideColModel(sheetName, 0));
            EasyExcel.write(response.getOutputStream(), User.class)
                    .sheet(sheetName)
                    .registerWriteHandler(new CustomRowHeightColWidthHandler(rowHeightColWidthList))
                    .doWrite(list);
        } catch (Exception e) {
            e.getMessage();
        }
    }

    /**
     * 用户信息excel导入
     */
    @Override
    public Result importUser(MultipartFile file) {
        try {
            EasyExcel.read(file.getInputStream(), User.class, new ImportExcelListener<User>(userService)).sheet("岗位信息").doRead();
        } catch (Exception e) {
            e.getMessage();
        }
        return Result.success();
    }

}
