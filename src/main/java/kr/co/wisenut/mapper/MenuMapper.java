package kr.co.wisenut.mapper;

import kr.co.wisenut.entity.MenuInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MenuMapper {
    public List<MenuInfo> getMenuList(Map<String, Object> param);
    public List<MenuInfo> getTopMenuList();
    public List<MenuInfo> getChildMenuList(Map<String, Object> param);

    public int insertMenu(Map<String, Object> param);
    public int updateMenu(Map<String, Object> param);
    public int deleteMenu(Map<String, Object> param);
}
