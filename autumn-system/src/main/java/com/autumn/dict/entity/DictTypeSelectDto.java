package com.autumn.dict.entity;

import com.autumn.page.Page;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 字典类型表
 */
@Data
public class DictTypeSelectDto extends Page implements Serializable {

    /**
     * 字典名称
     */
    private String dictName;

    /**
     * 字典类型
     */
    private String dictType;

    /**
     * 是否停用（0是 1否）
     */
    private String status;

    /**
     * 备注
     */
    private String remark;


    private static final long serialVersionUID = 1L;
}
