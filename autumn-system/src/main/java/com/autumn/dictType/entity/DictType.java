package com.autumn.dictType.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.autumn.easyExcel.converter.WhetherDictConverter;
import com.autumn.public_entity.PublicEntity;
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
public class DictType extends PublicEntity implements Serializable {

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

    private static final long serialVersionUID = 1L;
}
