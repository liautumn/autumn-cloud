import { SYSTEM } from "@/api/config/servicePort";
import http from "@/api";
import { ResPage } from "@/api/interface";
import { ${entityName} } from "@/api/interface/${entityName?uncap_first}";

// 列表
export const select${entityName} = (params: ${entityName}.ReqParams) => {
  return http.${entityName?uncap_first}<ResPage<${entityName}.ResList>>(SYSTEM + `/${entityName?uncap_first}/select`, params, { noLoading: true });
};

// 添加
export const insert${entityName} = (params: FormData) => {
  return http.${entityName?uncap_first}(SYSTEM + `/${entityName?uncap_first}/insert`, params, { noLoading: true });
};

// 修改
export const update${entityName} = (params: FormData) => {
  return http.${entityName?uncap_first}(SYSTEM + `/${entityName?uncap_first}/update`, params, { noLoading: true });
};

// 删除
export const delete${entityName} = (params: string) => {
  return http.get(SYSTEM + `/${entityName?uncap_first}/delete?ids=${params}`);
};

// 导入
export const import${entityName} = (params: FormData) => {
  return http.${entityName?uncap_first}(SYSTEM + `/${entityName?uncap_first}/import`, params);
};

// 导出
export const export${entityName} = (params: ${entityName}.ReqParams) => {
  return http.download(SYSTEM + `/${entityName?uncap_first}/export`, params);
};
