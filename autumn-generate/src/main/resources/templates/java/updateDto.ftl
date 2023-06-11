package ${rootPath}.${entityName?uncap_first}.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author ${author}
 * @date ${dateTime}
 * ${title} UpdateDto
 */
@Data
@Accessors
public class ${entityName}UpdateDto implements Serializable {

    private static final long serialVersionUID = 1L;

<#list columns as value>
    <#if value.columnName != "del_flag" &&
         value.columnName != "create_by" &&
         value.columnName != "create_time" &&
         value.columnName != "update_by" &&
         value.columnName != "update_time">
    /**
     * ${value.columnComment}
     */
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
