package com.autumn;

import com.autumn.generate.entity.GenDto;
import com.autumn.generate.service.GenerateService;
import com.autumn.result.Result;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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
        genDto.setTitle("消息记录表");
        genDto.setDatabaseName("autumn_cloud");
        genDto.setTableName("sys_message");
        genDto.setRootPath("com.autumn");
        genDto.setSystemCode("system");
        Result generate = generateService.generate(genDto);
        System.out.printf("===========================================>", generate);
    }

}
