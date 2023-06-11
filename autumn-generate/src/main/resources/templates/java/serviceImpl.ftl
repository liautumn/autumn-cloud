package ${rootPath}.${entityName?uncap_first}.service.impl;

import ${rootPath}.${entityName?uncap_first}.entity.${entityName};
import ${rootPath}.${entityName?uncap_first}.entity.${entityName}InsertDto;
import ${rootPath}.${entityName?uncap_first}.entity.${entityName}SelectDto;
import ${rootPath}.${entityName?uncap_first}.entity.${entityName}UpdateDto;
import ${rootPath}.${entityName?uncap_first}.mapper.${entityName}Mapper;
import ${rootPath}.${entityName?uncap_first}.service.${entityName}Service;
import ${rootPath}.page.ResData;
import ${rootPath}.result.Result;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * @author ${author}
 * @date ${dateTime}
 * ${title} ServiceImpl
 */
@Service
public class ${entityName}ServiceImpl extends ServiceImpl<${entityName}Mapper, ${entityName}> implements ${entityName}Service {

    @Resource
    private ${entityName}Mapper ${entityName?uncap_first}TypeMapper;

    /**
     * ${title}查询
     */
    @Override
    public Result select${entityName}(${entityName}SelectDto ${entityName?uncap_first}TypeSelectDto) {
        Page<${entityName}> page = PageHelper.startPage(${entityName?uncap_first}TypeSelectDto.getPageNum(), ${entityName?uncap_first}TypeSelectDto.getPageSize());
        LambdaQueryWrapper<${entityName}> queryWrapper = new LambdaQueryWrapper<${entityName}>()
                .orderByDesc(${entityName}::getCreateTime);
        List<${entityName}> ${entityName?uncap_first}TypeList = ${entityName?uncap_first}TypeMapper.selectList(queryWrapper);
        return ResData.setDataTotal(page, ${entityName?uncap_first}TypeList);
    }

    /**
     * ${title}新增
     */
    @Override
    public Result insert${entityName}(${entityName}InsertDto ${entityName?uncap_first}TypeInsertDto) {
        ${entityName} ${entityName?uncap_first}Type = new ${entityName}();
        BeanUtils.copyProperties(${entityName?uncap_first}TypeInsertDto, ${entityName?uncap_first}Type);
        int i = ${entityName?uncap_first}TypeMapper.insert(${entityName?uncap_first}Type);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * ${title}修改
     */
    @Override
    public Result update${entityName}(${entityName}UpdateDto ${entityName?uncap_first}TypeUpdateDto) {
        ${entityName} ${entityName?uncap_first}Type = new ${entityName}();
        BeanUtils.copyProperties(${entityName?uncap_first}TypeUpdateDto, ${entityName?uncap_first}Type);
        int i = ${entityName?uncap_first}TypeMapper.updateById(${entityName?uncap_first}Type);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * ${title}删除
     */
    @Override
    public Result delete${entityName}(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        int i = ${entityName?uncap_first}TypeMapper.deleteBatchIds(idList);
        return i > 0 ? Result.success() : Result.fail();
    }
}
