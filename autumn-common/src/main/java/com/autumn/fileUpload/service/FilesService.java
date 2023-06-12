package com.autumn.fileUpload.service;

import com.autumn.fileUpload.entity.Files;
import com.autumn.fileUpload.entity.FilesInsertDto;
import com.autumn.fileUpload.entity.FilesSelectDto;
import com.autumn.fileUpload.entity.FilesUpdateDto;
import com.autumn.result.Result;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Component;

/**
 * @author autumn
 * @date 2023-06-12 09:18:53
 * 测试生成表 Service
 */
public interface FilesService extends IService<Files> {

    /**
     * 测试生成表查询
     */
    Result selectFiles(FilesSelectDto filesSelectDto);

    /**
     * 测试生成表新增
     */
    Result insertFiles(FilesInsertDto filesInsertDto);

    /**
     * 测试生成表修改
     */
    Result updateFiles(FilesUpdateDto filesUpdateDto);

    /**
     * 测试生成表删除
     */
    Result deleteFiles(String ids);

}
