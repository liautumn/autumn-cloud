package com.autumn.menu.entity;

import com.autumn.page.Page;
import lombok.Data;

import java.io.Serializable;

@Data
public class MenuSelectDto extends Page implements Serializable {
    /**
     * 菜单ID
     */
    private Long menuId;

    /**
     * 父菜单ID
     */
    private Long parentId;

    /**
     * 路由地址
     */
    private String path;

    /**
     * name
     */
    private String name;

    /**
     * 重定向地址
     */
    private String redirect;

    /**
     * 组件路径
     */
    private String component;

    /**
     * 菜单图标
     */
    private String icon;

    /**
     * 菜单名称
     */
    private String title;

    /**
     * 活动菜单
     */
    private String activeMenu;

    /**
     * 是否为外链（0是 1否）
     */
    private String isLink;

    /**
     * 是否隐藏（0是 1否）
     */
    private String isHide;

    /**
     * 是否全屏显示（0是 1否）
     */
    private String isFull;

    /**
     * affix（0是 1否）
     */
    private String isAffix;

    /**
     * 是否缓存（0是 1否）
     */
    private String isKeepAlive;

    /**
     * 路由参数
     */
    private String query;


    private static final long serialVersionUID = 1L;
}
