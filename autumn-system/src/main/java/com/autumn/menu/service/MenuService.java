package com.autumn.menu.service;

import com.autumn.menu.entity.*;
import com.autumn.result.Result;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * @author Administrator
 * @description 针对表【sys_menu(菜单权限表)】的数据库操作Service
 * @createDate 2023-05-31 14:56:54
 */
public interface MenuService extends IService<Menu> {

    Result getMenuList(MenuSelectDto menuSelectDto);

    Result getBtnsList();

    Result selectMenu(MenuSelectDto menuSelectDto);

    Result insertMenu(MenuInsertDto menuInsertDto);

    Result updateMenu(MenuUpdateDto menuUpdateDto);

    Result deleteMenu(String ids);

    void exportMenu(MenuSelectDto menuSelectDto, HttpServletResponse response);

    Result importMenu(MultipartFile file);

    Result getMenuTree(MenuTreeDto menuTreeDto);

    Result selectNoTree(MenuSelectDto menuSelectDto);
}
