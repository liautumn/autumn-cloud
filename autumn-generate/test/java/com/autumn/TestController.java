package com.autumn;

import com.autumn.generate.entity.GenDto;
import com.autumn.generate.service.GenerateService;
import com.autumn.result.Result;
import com.autumn.utils.GenerateUtil;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * @author liqiuzhuang
 * @date 2023-06-11 18:13
 */
@SpringBootTest
public class TestController {

    @Resource
    private GenerateService generateService;

    @Test
    public void getTest() {
        GenDto genDto = new GenDto();
        genDto.setAuthor("lqz");
        genDto.setTitle("岗位信息");
        genDto.setDatabaseName("autumn_cloud");
        genDto.setTableName("sys_post");
        Result generate = generateService.generate(genDto);
        System.out.printf("===========================================>", generate);
    }

}
