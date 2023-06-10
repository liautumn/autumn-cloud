package com.autumn.dict.controller;

import com.autumn.dict.entity.DictTypeInsertDto;
import com.autumn.dict.entity.DictTypeSelectDto;
import com.autumn.dict.entity.DictTypeUpdateDto;
import com.autumn.dict.service.DictTypeService;
import com.autumn.result.Result;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/dict")
public class DictController {

    @Resource
    private DictTypeService dictTypeService;

    /**
     * 菜单查询
     */
    @PostMapping("/select")
    public Result selectDict(@RequestBody DictTypeSelectDto dictTypeSelectDto) {
        return dictTypeService.selectDict(dictTypeSelectDto);
    }

    /**
     * 菜单新增
     */
    @PostMapping("/insert")
    public Result insertDict(@RequestBody @Validated DictTypeInsertDto dictTypeInsertDto) {
        return dictTypeService.insertDict(dictTypeInsertDto);
    }

    /**
     * 菜单修改
     */
    @PostMapping("/update")
    public Result updateDict(@RequestBody @Validated DictTypeUpdateDto dictTypeUpdateDto) {
        return dictTypeService.updateDict(dictTypeUpdateDto);
    }

    /**
     * 菜单删除
     */
    @GetMapping("/delete")
    public Result deleteDict(@RequestParam("ids") String ids) {
        return dictTypeService.deleteDict(ids);
    }

}
