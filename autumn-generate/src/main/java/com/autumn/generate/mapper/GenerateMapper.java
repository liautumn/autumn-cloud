package com.autumn.generate.mapper;

import com.autumn.generate.entity.Columns;
import com.autumn.generate.entity.GenDto;
import com.autumn.generate.entity.Tables;

import java.util.List;

public interface GenerateMapper {

    List<Columns> selectColumnsByTableName(GenDto genDto);

    Tables selectTablesByTableName(GenDto genDto);

}




