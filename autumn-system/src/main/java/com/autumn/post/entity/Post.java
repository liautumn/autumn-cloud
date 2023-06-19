package com.autumn.post.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.autumn.easyExcel.converter.WhetherDictConverter;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author lqz
 * @date 2023-06-19 09:56:30
 * 岗位信息表
 */
@TableName(value ="sys_post")
@Data
@Accessors
public class Post implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 岗位ID
     */
    @ExcelProperty(value = "岗位ID")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    /**
     * 岗位编码
     */
    @ExcelProperty(value = "岗位编码")
    @TableField(value = "post_code")
    private String postCode;
    /**
     * 岗位名称
     */
    @ExcelProperty(value = "岗位名称")
    @TableField(value = "post_name")
    private String postName;
    /**
     * 显示顺序
     */
    @ExcelProperty(value = "显示顺序")
    @TableField(value = "post_sort")
    private Integer postSort;
    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    @TableField(value = "remark")
    private String remark;
    /**
     * 是否停用（0是 1否）
     */
    @ExcelProperty(value = "是否停用", converter = WhetherDictConverter.class)
    @TableField(value = "status")
    private String status;
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
