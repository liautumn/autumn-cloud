package ${rootPath}.${entityName?uncap_first}.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.HeadRowHeight;
import ${rootPath}.easyExcel.converter.DictConverter;
import ${rootPath}.public_entity.PublicEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author ${author}
 * @date ${dateTime}
 * ${tableComment}
 */
@TableName(value ="${tableName}")
@Data
@Accessors
@ColumnWidth(30)
@HeadRowHeight(20)
public class ${entityName} extends PublicEntity implements Serializable {

    private static final long serialVersionUID = 1L;

<#list columns as value>
    <#if value.columnName != "id" &&
         value.columnName != "del_flag" &&
         value.columnName != "create_by" &&
         value.columnName != "create_time" &&
         value.columnName != "update_by" &&
         value.columnName != "update_time">
    /**
     * ${value.columnComment}
     */
    @ExcelProperty(value = "${value.columnComment}")
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
