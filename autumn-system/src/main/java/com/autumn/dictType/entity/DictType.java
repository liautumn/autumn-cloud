package com.autumn.dictType.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.autumn.easyExcel.converter.WhetherDictConverter;
import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

/**
 * 字典类型表
 * @TableName sys_dict_type
 */
@TableName(value ="sys_dict_type")
@Data
public class DictType implements Serializable {
    /**
     * 字典类型表ID
     */
    @ExcelProperty(value = "字典类型表ID")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 字典名称
     */
    @ExcelProperty(value = "字典名称")
    @TableField(value = "dict_name")
    private String dictName;

    /**
     * 字典类型
     */
    @ExcelProperty(value = "字典类型")
    @TableField(value = "dict_type")
    private String dictType;

    /**
     * 是否停用（0是 1否）
     */
    @ExcelProperty(value = "是否停用", converter = WhetherDictConverter.class)
    @TableField(value = "status")
    private String status;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
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
