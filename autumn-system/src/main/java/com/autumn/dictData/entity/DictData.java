package com.autumn.dictData.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.autumn.easyExcel.converter.WhetherDictConverter;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author autumn
 * @date 2023-06-13 09:00:38
 * 字典数据表
 */
@TableName(value ="sys_dict_data")
@Data
@Accessors
public class DictData implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 字典数据表ID
     */
    @ExcelProperty(value = "字典数据表ID")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    /**
     * 父节点ID
     */
    @ExcelProperty(value = "父节点ID")
    @TableField(value = "parent_id")
    private String parentId;
    /**
     * 字典类型表ID
     */
    @ExcelProperty(value = "字典类型表ID")
    @TableField(value = "dict_type_id")
    private String dictTypeId;
    /**
     * 数据标签
     */
    @ExcelProperty(value = "数据标签")
    @TableField(value = "dict_label")
    private String dictLabel;
    /**
     * 数据键值
     */
    @ExcelProperty(value = "数据键值")
    @TableField(value = "dict_value")
    private String dictValue;
    /**
     * 显示排序
     */
    @ExcelProperty(value = "显示排序")
    @TableField(value = "dict_sort")
    private Integer dictSort;
    /**
     * 数据类型
     */
    @ExcelProperty("数据类型")
    @TableField(value = "dict_type")
    private String dictType;
    /**
     * 样式属性
     */
    @ExcelProperty(value = "样式属性")
    @TableField(value = "css_class")
    private String cssClass;
    /**
     * 回显样式
     */
    @ExcelProperty(value = "回显样式")
    @TableField(value = "echo_class")
    private String echoClass;
    /**
     * 是否默认（0是 1否）
     */
    @ExcelProperty(value = "是否默认", converter = WhetherDictConverter.class)
    @TableField(value = "is_default")
    private String isDefault;
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


}
