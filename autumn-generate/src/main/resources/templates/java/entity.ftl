package ${rootPath}.${entityName?uncap_first}.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author ${author}
 * @date ${dateTime}
 * ${tableComment}
 */
@TableName(value ="${tableName}")
@Data
@Accessors
public class ${entityName} implements Serializable {

    private static final long serialVersionUID = 1L;

<#list columns as value>
    <#if value.columnName == "id">
    /**
     * ${value.columnComment}
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    <#elseif value.columnName == "del_flag">
    /**
     * 删除标志（0代表删除 1代表存在）
     */
    @TableField(value = "del_flag")
    private String delFlag;
    <#elseif value.columnName == "create_by">
    /**
     * 创建者
     */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private String createBy;
    <#elseif value.columnName == "create_time">
    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    <#elseif value.columnName == "update_by">
    /**
     * 更新者
     */
    @TableField(value = "update_by", fill = FieldFill.UPDATE)
    private String updateBy;
    <#elseif value.columnName == "update_time">
    /**
     * 更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;
    <#else>
    /**
     * ${value.columnComment}
     */
    @TableField(value = "${value.columnName}")
    private ${value.dataType} ${dashedToCamel(value.columnName)};
    </#if>
</#list>

<#function dashedToCamel(s)>
    <#return s
    ?replace('(^_+)|(_+$)', '', 'r')
    ?replace('\\_+(\\w)?', ' $1', 'r')
    ?replace('([A-Z])', ' $1', 'r')
    ?capitalize
    ?replace(' ' , '')
    ?uncap_first>
</#function>

}
