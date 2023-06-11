<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${rootPath}.${entityName?uncap_first}.mapper.DictTypeMapper">

    <resultMap id="BaseResultMap" type="${rootPath}.${entityName?uncap_first}.entity.DictType">
    <#list columns as value>
        <result property="${dashedToCamel(value.columnName)}" column="${value.columnName}" jdbcType="${value.jdbcType}"/>
    </#list>
    </resultMap>

    <sql id="Base_Column_List">
    <#list columns as value>
	    <#if (value_index == ((columns?size) - 1))>
        ${value.columnName}
        <#else>
        ${value.columnName},
        </#if>
    </#list>
    </sql>

<#function dashedToCamel(s)>
    <#return s
    ?replace('(^_+)|(_+$)', '', 'r')
    ?replace('\\_+(\\w)?', ' $1', 'r')
    ?replace('([A-Z])', ' $1', 'r')
    ?capitalize
    ?replace(' ' , '')
    ?uncap_first>
</#function>

</mapper>
