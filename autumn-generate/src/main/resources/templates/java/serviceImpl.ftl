package ${rootPath}.${entityName?uncap_first}.service.impl;

import com.alibaba.excel.EasyExcel;
import ${rootPath}.easyExcel.CustomRowHeightColWidthHandler;
import ${rootPath}.easyExcel.RowHeightColWidthModel;
import ${rootPath}.easyExcel.listener.ImportExcelListener;
import ${rootPath}.page.ResData;
import ${rootPath}.${entityName?uncap_first}.entity.${entityName};
import ${rootPath}.${entityName?uncap_first}.entity.${entityName}InsertDto;
import ${rootPath}.${entityName?uncap_first}.entity.${entityName}SelectDto;
import ${rootPath}.${entityName?uncap_first}.entity.${entityName}UpdateDto;
import ${rootPath}.${entityName?uncap_first}.mapper.${entityName}Mapper;
import ${rootPath}.${entityName?uncap_first}.service.${entityName}Service;
import ${rootPath}.result.Result;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ArrayList;
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
    @Resource
    private ${entityName}Service ${entityName?uncap_first}Service;

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

    /**
     * ${title}excel导出
     */
    @Override
    public void export${entityName}(${entityName}SelectDto ${entityName?uncap_first}SelectDto, HttpServletResponse response) {
        List<${entityName}> list = new ArrayList<>();
        if (!${entityName?uncap_first}SelectDto.getTempFlag()) {
            LambdaQueryWrapper<${entityName}> queryWrapper = new LambdaQueryWrapper<${entityName}>()
                    .orderByAsc(${entityName}::get${entityName}Sort);
            list = ${entityName?uncap_first}Mapper.selectList(queryWrapper);
        }
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("utf-8");
        try {
            String sheetName = "${title}";
            // 这里URLEncoder.encode可以防止中文乱码
            String fileName = URLEncoder.encode(sheetName + "列表", "UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
            List<RowHeightColWidthModel> rowHeightColWidthList = new ArrayList<>();
            //隐藏列
            rowHeightColWidthList.add(RowHeightColWidthModel.createHideColModel(sheetName, 0));
            EasyExcel.write(response.getOutputStream(), ${entityName}.class)
                    .sheet(sheetName)
                    .registerWriteHandler(new CustomRowHeightColWidthHandler(rowHeightColWidthList))
                    .doWrite(list);
        } catch (Exception e) {
            e.getMessage();
        }
    }

    /**
     * ${title}excel导入
     */
    @Override
    public Result import${entityName}(MultipartFile file) {
        try {
            EasyExcel.read(file.getInputStream(), ${entityName}.class, new ImportExcelListener<${entityName}>(${entityName?uncap_first}Service)).sheet("岗位信息").doRead();
        } catch (Exception e) {
            e.getMessage();
        }
        return Result.success();
    }

}
