package ${rootPath}.${entityName?uncap_first}.controller;

import ${rootPath}.${entityName?uncap_first}.entity.${entityName}InsertDto;
import ${rootPath}.${entityName?uncap_first}.entity.${entityName}SelectDto;
import ${rootPath}.${entityName?uncap_first}.entity.${entityName}UpdateDto;
import ${rootPath}.${entityName?uncap_first}.service.${entityName}Service;
import ${rootPath}.result.Result;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * @author ${author}
 * @date ${dateTime}
 * ${title} Controller
 */
@RestController
@RequestMapping("/${entityName?uncap_first}")
public class ${entityName}Controller {

    @Resource
    private ${entityName}Service ${entityName?uncap_first}Service;

    /**
     * ${title}查询
     */
    @PostMapping("/select")
    public Result select${entityName}(@RequestBody ${entityName}SelectDto ${entityName?uncap_first}SelectDto) {
        return ${entityName?uncap_first}Service.select${entityName}(${entityName?uncap_first}SelectDto);
    }

    /**
     * ${title}新增
     */
    @PostMapping("/insert")
    public Result insert${entityName}(@RequestBody @Validated ${entityName}InsertDto ${entityName?uncap_first}InsertDto) {
        return ${entityName?uncap_first}Service.insert${entityName}(${entityName?uncap_first}InsertDto);
    }

    /**
     * ${title}修改
     */
    @PostMapping("/update")
    public Result update${entityName}(@RequestBody @Validated ${entityName}UpdateDto ${entityName?uncap_first}UpdateDto) {
        return ${entityName?uncap_first}Service.update${entityName}(${entityName?uncap_first}UpdateDto);
    }

    /**
     * ${title}删除
     */
    @GetMapping("/delete")
    public Result delete${entityName}(@RequestParam("ids") String ids) {
        return ${entityName?uncap_first}Service.delete${entityName}(ids);
    }

    /**
     * ${title}excel导出
     */
    @PostMapping("/export")
    public void export${entityName}(@RequestBody ${entityName}SelectDto ${entityName?uncap_first}SelectDto, HttpServletResponse response) {
        ${entityName?uncap_first}Service.export${entityName}(${entityName?uncap_first}SelectDto, response);
    }

    /**
     * ${title}excel导入
     */
    @PostMapping("/import")
    public Result import${entityName}(MultipartFile file) {
        return ${entityName?uncap_first}Service.import${entityName}(file);
    }

}
