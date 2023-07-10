<template>
  <div class="table-box">
    <ProTable
      ref="proTable"
      title="${title}"
      row-key="id"
      highlight-current-row
      :columns="columns"
      :request-api="select${entityName}"
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
    <${entityName}Form ref="dialogRef" />
  </div>
</template>

<script setup lang="ts" name="${entityName?uncap_first}List">
import { ref } from "vue";
import ProTable from "@/components/ProTable/index.vue";
import { ColumnProps, ProTableInstance } from "@/components/ProTable/interface";
import { Delete, EditPen, CirclePlus, Download, Upload } from "@element-plus/icons-vue";
import { useDownload } from "@/hooks/useDownload";
import ImportExcel from "@/components/ImportExcel/index.vue";
import { ElMessage, ElMessageBox } from "element-plus";
import { ${entityName} } from "@/api/interface/${systemCode}/${entityName?uncap_first}/${entityName?uncap_first}";
import ${entityName}Form from "./${entityName?uncap_first}Form.vue";
import { select${entityName}, insert${entityName}, update${entityName}, delete${entityName}, export${entityName}, import${entityName} } from "@/api/modules/${systemCode}/${entityName?uncap_first}/${entityName?uncap_first}";

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
const columns: ColumnProps<${entityName}.ResList>[] = [
  { type: "selection", fixed: "left", width: 60 },
  { type: "index", width: 60, label: "序号" },
<#list columns as value>
  <#if value.columnName != "id" &&
       value.columnName != "del_flag" &&
       value.columnName != "create_by" &&
       value.columnName != "create_time" &&
       value.columnName != "update_by" &&
       value.columnName != "update_time">
  { prop: "${dashedToCamel(value.columnName)}", label: "${value.columnComment}" },
  </#if>
</#list>
  { prop: "operation", label: "操作", width: 300 }
];

//声明参数
const formDefaultData = ref<${entityName}.ResList>({
<#list columns as value>
  <#if value.columnName != "id" &&
       value.columnName != "del_flag" &&
       value.columnName != "create_by" &&
       value.columnName != "create_time" &&
       value.columnName != "update_by" &&
       value.columnName != "update_time">
  <#if value_index == ((columns?size) - 6)>
  ${dashedToCamel(value.columnName)}: ""
  <#else>
  ${dashedToCamel(value.columnName)}: "",
  </#if>
  </#if>
</#list>
});

//删除按钮
const deleteClick = async (row: ${entityName}.ResList) => {
  await delete${entityName}(row.id);
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
  await delete${entityName}(ids.toString());
  proTable.value?.clearSelection();
  proTable.value?.getTableList();
  ElMessage.success("删除成功");
};

// 导入
const importRef = ref<InstanceType<typeof ImportExcel> | null>(null);
const importClick = () => {
  const params = {
    title: "${title}",
    tempApi: export${entityName},
    importApi: import${entityName},
    getTableList: proTable.value?.getTableList
  };
  importRef.value?.acceptParams(params);
};

// 导出
const exportClick = async () => {
  ElMessageBox.confirm("确认导出数据?", "温馨提示", { type: "warning" }).then(() =>
    useDownload(export${entityName}, "${title}", proTable.value?.searchParam)
  );
};

// 打开 dialog(新增、查看、编辑)
const dialogRef = ref<InstanceType<typeof ${entityName}Form> | null>(null);
const openDialog = (type: string, row: Partial<${entityName}.ResList> = {}) => {
  const params = {
    type,
    row,
    title: type === "insert" ? "新增" : type === "delete" ? "删除" : type === "update" ? "修改" : type === "view" ? "查看" : "",
    disabled: type === "view",
    api: type === "insert" ? insert${entityName} : type === "update" ? update${entityName} : undefined,
    getTableList: proTable.value?.getTableList
  };
  dialogRef.value?.open(params);
};
</script>

<#function dashedToCamel(s)>
    <#return s
    ?replace('(^_+)|(_+$)', '', 'r')
    ?replace('\\_+(\\w)?', ' $1', 'r')
    ?replace('([A-Z])', ' $1', 'r')
    ?capitalize
    ?replace(' ' , '')
    ?uncap_first>
</#function>
