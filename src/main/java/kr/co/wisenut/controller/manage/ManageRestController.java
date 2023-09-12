package kr.co.wisenut.controller.manage;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.wisenut.entity.MenuInfo;
import kr.co.wisenut.service.MenuService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/manage")
public class ManageRestController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    ObjectMapper mapper = new ObjectMapper();

    @Autowired
    private MenuService menuService;

    @RequestMapping(method= RequestMethod.POST, value="/menu/list")
    @ResponseBody
    public ResponseEntity getMenuList(@RequestParam HashMap<String, Object> param){

        List<MenuInfo> list = menuService.getMenuList(param);

        return new ResponseEntity(list, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/menu/topList")
    @ResponseBody
    public ResponseEntity getTopMenuList(@RequestParam HashMap<String, Object> param){

        List<MenuInfo> list = menuService.getTopMenuList();

        return new ResponseEntity(list, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/menu/tree")
    @ResponseBody
    public ResponseEntity getMenuTree(@RequestParam Map<String, Object> param){
        logger.info("getMenuTree param : {}", param);

        List<Map<String, Object>> list = menuService.getMenuTree(param);

        return new ResponseEntity(list, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/menu/regist")
    @ResponseBody
    public ResponseEntity insertMenu(@RequestParam HashMap<String, Object> param, Authentication auth){
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("creUser", userDetails.getUsername());

        int result = menuService.insertMenu(param);

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/menu/modify")
    @ResponseBody
    public ResponseEntity updateMenu(@RequestParam HashMap<String, Object> param, Authentication auth){
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("modUser", userDetails.getUsername());

        int result = menuService.updateMenu(param);

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/menu/delete")
    @ResponseBody
    public ResponseEntity deleteMenu(@RequestParam HashMap<String, Object> param, Authentication auth){
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("modUser", userDetails.getUsername());

        int result = menuService.deleteMenu(param);
        if(result == 0){
            return new ResponseEntity("하위메뉴부터 삭제해야합니다.", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }
}
