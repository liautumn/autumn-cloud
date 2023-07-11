package com.autumn.menu.entity;

import com.autumn.tree.TreePublic;
import lombok.Data;

import java.io.Serializable;

@Data
public class MenuVo extends TreePublic implements Serializable {
    /**
     * 菜单ID
     */
    private String id;

    /**
     * 父菜单ID
     */
    private String parentId;

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
     * meta
     */
    private Meta meta;


    private static final long serialVersionUID = 1L;
}
