package com.autumn.fileUpload.controller;

import com.autumn.fileUpload.entity.FilesInsertDto;
import com.autumn.fileUpload.entity.FilesSelectDto;
import com.autumn.fileUpload.entity.FilesUpdateDto;
import com.autumn.fileUpload.service.FilesService;
import com.autumn.result.Result;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author autumn
 * @date 2023-06-12 09:18:53
 * 测试生成表 Controller
 */
@RestController
@RequestMapping("/files")
public class FilesController {

    @Resource
    private FilesService filesService;

    /**
     * 测试生成表查询
     */
    @PostMapping("/select")
    public Result selectFiles(@RequestBody FilesSelectDto filesSelectDto) {
        return filesService.selectFiles(filesSelectDto);
    }

    /**
     * 测试生成表新增
     */
    @PostMapping("/insert")
    public Result insertFiles(@RequestBody @Validated FilesInsertDto filesInsertDto) {
        return filesService.insertFiles(filesInsertDto);
    }

    /**
     * 测试生成表修改
     */
    @PostMapping("/update")
    public Result updateFiles(@RequestBody @Validated FilesUpdateDto filesUpdateDto) {
        return filesService.updateFiles(filesUpdateDto);
    }

    /**
     * 测试生成表删除
     */
    @GetMapping("/delete")
    public Result deleteFiles(@RequestParam("ids") String ids) {
        return filesService.deleteFiles(ids);
    }

}
