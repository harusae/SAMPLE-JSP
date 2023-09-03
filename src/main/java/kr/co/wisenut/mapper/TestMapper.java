package kr.co.wisenut.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestMapper {

    public int getTest01Count();
}
