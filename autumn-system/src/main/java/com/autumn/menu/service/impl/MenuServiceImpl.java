package com.autumn.menu.service.impl;

import com.autumn.menu.mapper.MenuMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.autumn.menu.entity.Menu;
import com.autumn.menu.service.MenuService;
import org.springframework.stereotype.Service;

/**
* @author Administrator
* @description 针对表【sys_menu(菜单权限表)】的数据库操作Service实现
* @createDate 2023-05-25 14:01:20
*/
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu>
    implements MenuService{

}




