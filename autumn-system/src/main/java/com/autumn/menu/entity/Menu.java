package com.autumn.menu.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 菜单权限表
 *
 * @TableName sys_menu
 */
@Data
@TableName(value = "sys_menu")
public class Menu implements Serializable {
    /**
     * 菜单ID
     */
    @ExcelProperty("菜单ID")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 父菜单ID
     */
    @ExcelProperty("父菜单ID")
    @TableField(value = "parent_id")
    private String parentId;

    /**
     * 路由地址
     */
    @ExcelProperty("路由地址")
    @TableField(value = "path")
    private String path;

    /**
     * 路由 name (对应页面组件 name, 可用作 KeepAlive 缓存标识 && 按钮权限筛选)
     */
    @ExcelProperty("路由 name")
    @TableField(value = "name")
    private String name;

    /**
     * 重定向地址
     */
    @ExcelProperty("重定向地址")
    @TableField(value = "redirect")
    private String redirect;

    /**
     * 组件路径
     */
    @ExcelProperty("组件路径")
    @TableField(value = "component")
    private String component;

    /**
     * 菜单图标
     */
    @ExcelProperty("菜单图标")
    @TableField(value = "icon")
    private String icon;

    /**
     * 菜单名称
     */
    @ExcelProperty("菜单名称")
    @TableField(value = "title")
    private String title;

    /**
     * 当前路由为详情页时，需要高亮的菜单
     */
    @ExcelProperty("高亮菜单")
    @TableField(value = "active_menu")
    private String activeMenu;

    /**
     * 是否为外链（0是 1否）
     */
    @ExcelProperty("是否为外链")
    @TableField(value = "is_link")
    private String isLink;

    /**
     * 是否隐藏（0是 1否）
     */
    @ExcelProperty("是否隐藏")
    @TableField(value = "is_hide")
    private String isHide;

    /**
     * 是否全屏显示（0是 1否）
     */
    @ExcelProperty("是否全屏显示")
    @TableField(value = "is_full")
    private String isFull;

    /**
     * 是否固定页（0是 1否）
     */
    @ExcelProperty("是否固定页")
    @TableField(value = "is_affix")
    private String isAffix;

    /**
     * 是否缓存（0是 1否）
     */
    @ExcelProperty("是否缓存")
    @TableField(value = "is_keep_alive")
    private String isKeepAlive;

    /**
     * 显示顺序
     */
    @ExcelProperty("显示顺序")
    @TableField(value = "order_num")
    private Integer orderNum;

    /**
     * 菜单类型（0目录 1菜单 2按钮）
     */
    @ExcelProperty("菜单类型")
    @TableField(value = "menu_type")
    private String menuType;

    /**
     * 是否停用（0是 1否）
     */
    @ExcelProperty("是否停用")
    @TableField(value = "status")
    private String status;

    /**
     * 权限标识
     */
    @ExcelProperty("权限标识")
    @TableField(value = "perms")
    private String perms;

    /**
     * 路由参数
     */
    @ExcelProperty("路由参数")
    @TableField(value = "query")
    private String query;

    /**
     * 备注
     */
    @ExcelProperty("备注")
    @TableField(value = "remark")
    private String remark;

    /**
     * 删除标志（0代表删除 1代表存在）
     */
    @ExcelIgnore
    @TableField(value = "del_flag")
    private String delFlag;

    /**
     * 创建者
     */
    @ExcelIgnore
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 创建时间
     */
    @ExcelIgnore
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新者
     */
    @ExcelIgnore
    @TableField(value = "update_by", fill = FieldFill.UPDATE)
    private String updateBy;

    /**
     * 更新时间
     */
    @ExcelIgnore
    @TableField(value = "update_time", fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;

    private static final long serialVersionUID = 1L;
}
