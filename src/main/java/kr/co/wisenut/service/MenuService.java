package kr.co.wisenut.service;

import kr.co.wisenut.entity.MenuInfo;
import kr.co.wisenut.entity.UserAuthInfo;
import kr.co.wisenut.mapper.MenuMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MenuService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private MenuMapper menuMapper;

    public List<MenuInfo> getMenuList(HashMap<String, Object> param){
        return menuMapper.getMenuList(param);
    }

    public List<MenuInfo> getTopMenuList(Map<String, Object> param){
        return menuMapper.getTopMenuList(param);
    }

    public List<Map<String, Object>> getMenuTree(Map<String, Object> param){
        //treeview 에서 사용가능한 형태로 메뉴목록 데이터를 생성
        List<Map<String, Object>> res = new ArrayList<>();
        List<MenuInfo> upperMenuList = menuMapper.getTopMenuList(param);

        for(int i=0; i<upperMenuList.size(); i++){
            //최상위 메뉴 목록 조회
            MenuInfo upperMenu = upperMenuList.get(i);
            param.put("upperMenuId", upperMenu.getMenuId());
            List<MenuInfo> childMenuList = menuMapper.getChildMenuList(param);

            Map<String, Object> tmpParentMap = new HashMap<>();
            tmpParentMap.put("id", upperMenu.getMenuId());
            tmpParentMap.put("text", upperMenu.getMenuName());
            tmpParentMap.put("tags", Arrays.asList(childMenuList.size()));

            //각 상위메뉴의 하위메뉴 목록조회
            List<Map<String, Object>> tmpList = new ArrayList<>();
            for(int j=0; j<childMenuList.size(); j++){
                MenuInfo childMenu = childMenuList.get(j);

                Map<String, Object> tmpChildMap = new HashMap<>();
                tmpChildMap.put("id", childMenu.getMenuId());
                tmpChildMap.put("text", childMenu.getMenuName());
                //현 메뉴테이블 구성은 2depth이상도 처리가능한 구조이나 프로그램상에서는 2depth까지만 처리
                tmpChildMap.put("tags", Arrays.asList(0));

                tmpList.add(tmpChildMap);
            }
            if(tmpList.size() > 0){
                tmpParentMap.put("nodes", tmpList);
            }

            //최상위 메뉴1개의 하위메뉴 포함 정보 저장
            res.add(tmpParentMap);
        }

        return res;
    }

    public int insertMenu(HashMap<String, Object> param){
        return menuMapper.insertMenu(param);
    }
    public int updateMenu(HashMap<String, Object> param){
        return menuMapper.updateMenu(param);
    }
    public int deleteMenu(HashMap<String, Object> param){
        param.put("upperMenuId", param.get("menuId"));
        List<MenuInfo> childMenuList = menuMapper.getChildMenuList(param);
        if(childMenuList.size() > 0){
            return -1;
        }
        else if(menuMapper.getUserAuthMenuList(param)> 0){
            return -2;
        }

        return menuMapper.deleteMenu(param);
    }

    public List<UserAuthInfo> getUserAuthList(HashMap<String, Object> param){
        return menuMapper.getUserAuthList(param);
    }
    public int insertUserAuthMenu(Map<String, Object> param){
        return menuMapper.insertUserAuthMenu(param);
    }
    public int deleteUserAuthMenu(Map<String, Object> param){
        param.put("upperMenuId", param.get("userAuthMenu"));
        List<MenuInfo> childMenuList = menuMapper.getChildMenuList(param);
        if(childMenuList.size() > 0){
            return -1;
        }
        return menuMapper.deleteUserAuthMenu(param);
    }
}
