package com.autumn.menu.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class MenuSelectDto implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 菜单名称
     */
    private String title;
    /**
     * 是否停用（0是 1否）
     */
    private String status;
    /**
     * 语言 zh en
     */
    private String language = "zh";
    /**
     * 模板标记
     */
    private Boolean tempFlag = false;
}
