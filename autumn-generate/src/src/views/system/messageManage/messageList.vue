<template>
  <div class="table-box">
    <ProTable
      ref="proTable"
      title="消息记录表"
      row-key="id"
      highlight-current-row
      :columns="columns"
      :request-api="selectMessage"
      :pagination="true"
      :data-callback="dataCallback"
    >
      <!-- 表格 header 按钮 -->
      <template #tableHeader="scope">
        <el-button type="primary" @click="openDialog('insert', formDefaultData)" :icon="CirclePlus">新增</el-button>
        <el-button type="danger" @click="batchDelete(scope.selectedListIds)" :icon="Delete">删除</el-button>
        <el-button type="primary" @click="importClick" plain :icon="Upload">导入</el-button>
        <el-button type="primary" @click="exportClick" plain :icon="Download">导出</el-button>
      </template>
      <!-- 菜单图标 -->
      <template #icon="scope">
        <el-icon :size="18">
          <component :is="scope.row.icon"></component>
        </el-icon>
      </template>
      <!-- 菜单操作 -->
      <template #operation="scope">
        <el-button type="primary" link @click="openDialog('view', scope.row)" :icon="EditPen">查看</el-button>
        <el-button type="primary" link @click="openDialog('update', scope.row)" :icon="EditPen">编辑</el-button>
        <el-popconfirm title="确定删除?" @confirm="deleteClick(scope.row)">
          <template #reference>
            <el-button type="danger" link :icon="Delete">删除</el-button>
          </template>
        </el-popconfirm>
      </template>
    </ProTable>

    <ImportExcel ref="importRef" />
    <MessageForm ref="dialogRef" />
  </div>
</template>

<script setup lang="ts" name="messageList">
import { ref } from "vue";
import ProTable from "@/components/ProTable/index.vue";
import { ColumnProps, ProTableInstance } from "@/components/ProTable/interface";
import { Delete, EditPen, CirclePlus, Download, Upload } from "@element-plus/icons-vue";
import { useDownload } from "@/hooks/useDownload";
import ImportExcel from "@/components/ImportExcel/index.vue";
import { ElMessage, ElMessageBox } from "element-plus";
import { Message } from "@/api/interface/system/message/message";
import MessageForm from "./messageForm.vue";
import { selectMessage, insertMessage, updateMessage, deleteMessage, exportMessage, importMessage } from "@/api/modules/system/message/message";

const proTable = ref<ProTableInstance>();
const dataCallback = (data: any) => {
  return {
    list: data.list,
    total: data.total,
    pageNum: data.pageNum,
    pageSize: data.pageSize
  };
};

// 表格配置项
const columns: ColumnProps<Message.ResList>[] = [
  { type: "selection", fixed: "left", width: 60 },
  { type: "index", width: 60, label: "序号" },
  { prop: "title", label: "标题" },
  { prop: "content", label: "内容" },
  { prop: "path", label: "页面路径" },
  { prop: "type", label: "类型（1通知 2消息 3代办）" },
  { prop: "status", label: "状态（1未读 2已读）" },
  { prop: "operation", label: "操作", width: 300 }
];

//声明参数
const formDefaultData = ref<Message.ResList>({
  title: "",
  content: "",
  path: "",
  type: "",
  status: ""
});

//删除按钮
const deleteClick = async (row: Message.ResList) => {
  await deleteMessage(row.id);
  proTable.value?.getTableList();
  ElMessage({
    message: "删除成功!",
    type: "success"
  });
};

// 批量删除信息
const batchDelete = async (ids: string[]) => {
  if (ids.length === 0) {
    ElMessage.error("请先选择");
    return;
  }
  await deleteMessage(ids.toString());
  proTable.value?.clearSelection();
  proTable.value?.getTableList();
  ElMessage.success("删除成功");
};

// 导入
const importRef = ref<InstanceType<typeof ImportExcel> | null>(null);
const importClick = () => {
  const params = {
    title: "消息记录表",
    tempApi: exportMessage,
    importApi: importMessage,
    getTableList: proTable.value?.getTableList
  };
  importRef.value?.acceptParams(params);
};

// 导出
const exportClick = async () => {
  ElMessageBox.confirm("确认导出数据?", "温馨提示", { type: "warning" }).then(() =>
    useDownload(exportMessage, "消息记录表", proTable.value?.searchParam)
  );
};

// 打开 dialog(新增、查看、编辑)
const dialogRef = ref<InstanceType<typeof MessageForm> | null>(null);
const openDialog = (type: string, row: Partial<Message.ResList> = {}) => {
  const params = {
    type,
    row,
    title: type === "insert" ? "新增" : type === "delete" ? "删除" : type === "update" ? "修改" : type === "view" ? "查看" : "",
    disabled: type === "view",
    api: type === "insert" ? insertMessage : type === "update" ? updateMessage : undefined,
    getTableList: proTable.value?.getTableList
  };
  dialogRef.value?.open(params);
};
</script>

