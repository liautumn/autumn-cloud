import { SYSTEM } from "@/api/config/servicePort";
import http from "@/api";
import { ResPage } from "@/api/interface";
import { Message } from "@/api/interface/system/message/message";

// 列表
export const selectMessage = (params: Message.ReqParams) => {
  return http.post<ResPage<Message.ResList>>(SYSTEM + `/message/select`, params, { noLoading: true });
};

// 添加
export const insertMessage = (params: FormData) => {
  return http.post(SYSTEM + `/message/insert`, params, { noLoading: true });
};

// 修改
export const updateMessage = (params: FormData) => {
  return http.post(SYSTEM + `/message/update`, params, { noLoading: true });
};

// 删除
export const deleteMessage = (params: string) => {
  return http.get(SYSTEM + "/message/delete?ids=" + params, {}, { noLoading: true });
};

// 导入
export const importMessage = (params: FormData) => {
  return http.post(SYSTEM + `/message/import`, params, { noLoading: true });
};

// 导出
export const exportMessage = (params: Message.ReqParams) => {
  return http.download(SYSTEM + `/message/export`, params, { noLoading: true });
};
