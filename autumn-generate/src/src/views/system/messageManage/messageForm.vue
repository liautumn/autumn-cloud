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
            <el-col :span="12">
          <el-form-item label="标题" prop="title">
            <el-input v-model="dialogProps.row!.title" placeholder="标题" clearable />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="内容" prop="content">
            <el-input v-model="dialogProps.row!.content" placeholder="内容" clearable />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="页面路径" prop="path">
            <el-input v-model="dialogProps.row!.path" placeholder="页面路径" clearable />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="类型（1通知 2消息 3代办）" prop="type">
            <el-input v-model="dialogProps.row!.type" placeholder="类型（1通知 2消息 3代办）" clearable />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="状态（1未读 2已读）" prop="status">
            <el-input v-model="dialogProps.row!.status" placeholder="状态（1未读 2已读）" clearable />
          </el-form-item>
        </el-col>
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

<script setup lang="ts" name="messageForm">
import { FormInstance, FormRules, ElMessage } from "element-plus";
import { ref, reactive } from "vue";
import { Message } from "@/api/interface/system/message/message";

const formRef = ref<FormInstance>();
const dialogFlag = ref(false);

//表单字段规则
const rules = reactive<FormRules>({
  title: [{ required: false, message: "不能为空", trigger: "blur" }],
  content: [{ required: false, message: "不能为空", trigger: "blur" }],
  path: [{ required: false, message: "不能为空", trigger: "blur" }],
  type: [{ required: false, message: "不能为空", trigger: "blur" }],
  status: [{ required: false, message: "不能为空", trigger: "blur" }]
});

//定义表单需要的参数
interface DialogProps {
  type: string;
  title: string;
  disabled: boolean;
  row: Partial<Message.ResList>;
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

