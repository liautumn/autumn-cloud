package com.autumn.menu.entity;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
public class MenuUpdateDto implements Serializable {
    /**
     * 菜单ID
     */
    @NotNull(message = "菜单ID不能为空")
    private Long menuId;

    /**
     * 父菜单ID
     */
    @NotNull(message = "父菜单ID不能为空")
    private Long parentId;

    /**
     * 路由地址
     */
    @NotBlank(message = "路由地址不能为空")
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
    @NotBlank(message = "菜单名称不能为空")
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
