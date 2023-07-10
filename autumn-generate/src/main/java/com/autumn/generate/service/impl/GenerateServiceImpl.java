package com.autumn.generate.service.impl;

import cn.hutool.core.date.DateUtil;
import com.autumn.generate.controller.Templates;
import com.autumn.generate.entity.Columns;
import com.autumn.generate.entity.GenDto;
import com.autumn.generate.entity.GenPublic;
import com.autumn.generate.entity.Tables;
import com.autumn.generate.mapper.GenerateMapper;
import com.autumn.generate.service.GenerateService;
import com.autumn.result.Result;
import com.autumn.utils.GenerateUtil;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;


@Service
public class GenerateServiceImpl implements GenerateService {

    @Resource
    private GenerateMapper generateMapper;

    @Override
    public Result generate(GenDto genDto) {
        String[] prefix = {"sys_"};//去掉字符串前缀为sys_、log_
        String entity = GenerateUtil.getNoUnderlineStr(GenerateUtil.captureName(GenerateUtil.removePrefix(genDto.getTableName(), prefix)));
        String entityName = GenerateUtil.getNoUnderlineStr(entity);
        //查询表信息
        Tables table = generateMapper.selectTablesByTableName(genDto);
        //查出字段循环遍历
        List<Columns> columns = generateMapper.selectColumnsByTableName(genDto);
        GenPublic genPublic = new GenPublic();
        genPublic.setSystemCode(genDto.getSystemCode());
        genPublic.setEntityName(entityName);
        genPublic.setRootPath(genDto.getRootPath());
        genPublic.setColumns(columns);
        genPublic.setTitle(genDto.getTitle());
        genPublic.setDateTime(DateUtil.now());
        genPublic.setAuthor(genDto.getAuthor());
        genPublic.setTableName(table.getTableName());
        genPublic.setTableComment(StringUtils.isEmpty(table.getTableComment()) ? genPublic.getTitle() : table.getTableComment());

        //生成
        Templates.genController(genPublic);
        Templates.genService(genPublic);
        Templates.genServiceImpl(genPublic);
        Templates.genMapper(genPublic);
        Templates.genMapperXml(genPublic);
        Templates.genEntity(genPublic);
        Templates.genInsertDto(genPublic);
        Templates.genUpdateDto(genPublic);
        Templates.genSelectDto(genPublic);
        Templates.genList(genPublic);
        Templates.genForm(genPublic);
        Templates.genInterface(genPublic);
        Templates.genApi(genPublic);
        return Result.success();
    }
}




