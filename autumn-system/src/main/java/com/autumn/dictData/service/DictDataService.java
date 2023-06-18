package com.autumn.dictData.service;

import com.autumn.dictData.entity.DictData;
import com.autumn.dictData.entity.DictDataInsertDto;
import com.autumn.dictData.entity.DictDataSelectDto;
import com.autumn.dictData.entity.DictDataUpdateDto;
import com.autumn.result.Result;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * @author autumn
 * @date 2023-06-13 09:00:38
 * 测试生成表 Service
 */
public interface DictDataService extends IService<DictData> {

    /**
     * 测试生成表查询
     */
    Result selectDictData(DictDataSelectDto dictDataSelectDto);

    /**
     * 测试生成表新增
     */
    Result insertDictData(DictDataInsertDto dictDataInsertDto);

    /**
     * 测试生成表修改
     */
    Result updateDictData(DictDataUpdateDto dictDataUpdateDto);

    /**
     * 测试生成表删除
     */
    Result deleteDictData(String ids);

    void exportDictData(DictDataSelectDto dictDataSelectDto, HttpServletResponse response);

    Result importDictData(MultipartFile file);
}
