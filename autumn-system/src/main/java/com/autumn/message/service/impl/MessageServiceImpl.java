package com.autumn.message.service.impl;

import com.alibaba.excel.EasyExcel;
import com.autumn.easyExcel.CustomRowHeightColWidthHandler;
import com.autumn.easyExcel.RowHeightColWidthModel;
import com.autumn.easyExcel.listener.ImportExcelListener;
import com.autumn.message.entity.Message;
import com.autumn.message.entity.MessageInsertDto;
import com.autumn.message.entity.MessageSelectDto;
import com.autumn.message.entity.MessageUpdateDto;
import com.autumn.message.mapper.MessageMapper;
import com.autumn.message.service.MessageService;
import com.autumn.result.Result;
import com.autumn.saToken.LoginInfoData;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.*;

/**
 * @author lqz
 * @date 2023-07-31 20:57:25
 * 消息记录表 ServiceImpl
 */
@Service
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements MessageService {

    @Resource
    private MessageMapper messageMapper;
    @Resource
    private MessageService messageService;

    /**
     * 消息记录表查询
     */
    @Override
    public Result selectMessage() {
        String userId = LoginInfoData.getUserInfo().getId();
        LambdaQueryWrapper<Message> queryWrapper = new LambdaQueryWrapper<Message>()
                .eq(Message::getUserId, userId)
                .orderByDesc(Message::getCreateTime);
        List<Message> messageList = messageMapper.selectList(queryWrapper);
        queryWrapper = new LambdaQueryWrapper<Message>()
                .eq(Message::getUserId, userId)
                .eq(Message::getStatus, "1");
        int size = messageMapper.selectList(queryWrapper).size();
        Map res = new HashMap();
        res.put("list", messageList);
        res.put("num", size);
        return Result.successData(res);
    }

    /**
     * 消息记录表新增
     */
    @Override
    public Result insertMessage(MessageInsertDto messageInsertDto) {
        Message message = new Message();
        BeanUtils.copyProperties(messageInsertDto, message);
        int i = messageMapper.insert(message);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 消息记录表修改
     */
    @Override
    public Result updateMessage(MessageUpdateDto messageUpdateDto) {
        Message message = new Message();
        BeanUtils.copyProperties(messageUpdateDto, message);
        int i = messageMapper.updateById(message);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 消息记录表删除
     */
    @Override
    public Result deleteMessage(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        int i = messageMapper.deleteBatchIds(idList);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 消息记录表excel导出
     */
    @Override
    public void exportMessage(MessageSelectDto messageSelectDto, HttpServletResponse response) {
        List<Message> list = new ArrayList<>();
        if (!messageSelectDto.getTempFlag()) {
            LambdaQueryWrapper<Message> queryWrapper = new LambdaQueryWrapper<Message>()
                    .orderByAsc(Message::getCreateTime);
            list = messageMapper.selectList(queryWrapper);
        }
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("utf-8");
        try {
            String sheetName = "消息记录表";
            // 这里URLEncoder.encode可以防止中文乱码
            String fileName = URLEncoder.encode(sheetName + "列表", "UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
            List<RowHeightColWidthModel> rowHeightColWidthList = new ArrayList<>();
            //隐藏列
            rowHeightColWidthList.add(RowHeightColWidthModel.createHideColModel(sheetName, 0));
            EasyExcel.write(response.getOutputStream(), Message.class)
                    .sheet(sheetName)
                    .registerWriteHandler(new CustomRowHeightColWidthHandler(rowHeightColWidthList))
                    .doWrite(list);
        } catch (Exception e) {
            e.getMessage();
        }
    }

    /**
     * 消息记录表excel导入
     */
    @Override
    public Result importMessage(MultipartFile file) {
        try {
            EasyExcel.read(file.getInputStream(), Message.class, new ImportExcelListener<Message>(messageService)).sheet("岗位信息").doRead();
        } catch (Exception e) {
            e.getMessage();
        }
        return Result.success();
    }

}
