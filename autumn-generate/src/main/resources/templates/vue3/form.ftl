<template>
  <el-dialog
    v-model="dialogFlag"
    :close-on-click-modal="true"
    :destroy-on-close="true"
    @close="close"
    :title="dialogProps.title"
    width="50%"
    top="7vh"
    draggable
    :modal="true"
    style="border-radius: 8px"
  >
    <el-form
      ref="formRef"
      label-width="100px"
      label-suffix=" :"
      :model="dialogProps.row"
      :rules="rules"
      label-position="right"
      :disabled="dialogProps.disabled"
    >
      <el-row>
    <#list columns as value>
      <#if value.columnName != "id" &&
           value.columnName != "del_flag" &&
           value.columnName != "create_by" &&
           value.columnName != "create_time" &&
           value.columnName != "update_by" &&
           value.columnName != "update_time">
        <el-col :span="12">
          <el-form-item label="${value.columnComment}" prop="${dashedToCamel(value.columnName)}">
            <el-input v-model="dialogProps.row!.${dashedToCamel(value.columnName)}" placeholder="${value.columnComment}" clearable />
          </el-form-item>
        </el-col>
      </#if>
    </#list>
      </el-row>
    </el-form>
    <template #footer>
      <span class="dialog-footer" v-if="!dialogProps.disabled">
        <el-button @click="reset">重置</el-button>
        <el-button type="primary" @click="submit"> 提交 </el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script setup lang="ts" name="${entityName?uncap_first}Form">
import { FormInstance, FormRules, ElMessage } from "element-plus";
import { ref, reactive } from "vue";
import { ${entityName} } from "@/api/interface/${systemCode}/${entityName?uncap_first}/${entityName?uncap_first}";

const formRef = ref<FormInstance>();
const dialogFlag = ref(false);

//表单字段规则
const rules = reactive<FormRules>({
<#list columns as value>
  <#if value.columnName != "id" &&
       value.columnName != "del_flag" &&
       value.columnName != "create_by" &&
       value.columnName != "create_time" &&
       value.columnName != "update_by" &&
       value.columnName != "update_time">
  <#if value_index == ((columns?size) - 6)>
  ${dashedToCamel(value.columnName)}: [{ required: false, message: "不能为空", trigger: "blur" }]
  <#else>
  ${dashedToCamel(value.columnName)}: [{ required: false, message: "不能为空", trigger: "blur" }],
  </#if>
  </#if>
</#list>
});

//定义表单需要的参数
interface DialogProps {
  type: string;
  title: string;
  disabled: boolean;
  row: Partial<${entityName}.ResList>;
  api?: (params: any) => Promise<any>;
  getTableList?: () => void;
}

//声明参数
const dialogProps = ref<DialogProps>({
  type: "",
  title: "",
  disabled: false,
  row: {}
});

//打开dialog并传入表单数据等参数
const open = (params: DialogProps) => {
  dialogProps.value = params;
  dialogFlag.value = true;
};

//关闭dialog
const close = () => {
  formRef.value?.resetFields();
  dialogFlag.value = false;
};

//重置
const reset = () => {
  formRef.value?.resetFields();
};

//提交
const submit = () => {
  formRef.value!.validate(async valid => {
    if (!valid) return;
    await dialogProps.value.api!(dialogProps.value.row);
    ElMessage.success({ message: dialogProps.value.title + "成功！" });
    dialogProps.value.getTableList!();
    close();
  });
};

defineExpose({
  open
});
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


