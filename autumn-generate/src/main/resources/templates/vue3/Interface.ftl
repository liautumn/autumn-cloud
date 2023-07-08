import { ReqPage } from "./index";

// ${title}实体类
export namespace ${entityName} {
  export interface ReqParams extends ReqPage {
<#list columns as value>
  <#if value.columnName != "id" &&
       value.columnName != "del_flag" &&
       value.columnName != "create_by" &&
       value.columnName != "create_time" &&
       value.columnName != "update_by" &&
       value.columnName != "update_time">
    ${dashedToCamel(value.columnName)}: string;
  </#if>
</#list>
  }

  export interface ResList {
<#list columns as value>
  <#if value.columnName != "del_flag">
    ${dashedToCamel(value.columnName)}: string;
  </#if>
</#list>
  }
}
