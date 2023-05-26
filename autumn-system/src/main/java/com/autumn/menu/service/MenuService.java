package com.autumn.menu.service;

import com.autumn.menu.entity.Menu;
import com.autumn.result.Result;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author Administrator
* @description 针对表【sys_menu(菜单权限表)】的数据库操作Service
* @createDate 2023-05-25 14:01:20
*/
public interface MenuService extends IService<Menu> {

    Result getMenuList();

}
