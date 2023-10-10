package kr.co.wisenut.controller.manage;

import kr.co.wisenut.entity.MenuInfo;
import kr.co.wisenut.entity.UserAuthInfo;
import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.service.MenuService;
import kr.co.wisenut.service.UserService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/manage")
public class ManageRestController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MenuService menuService;
    @Autowired
    private UserService userService;

    @RequestMapping(method= RequestMethod.POST, value="/menu/list")
    @ResponseBody
    public ResponseEntity getMenuList(@RequestParam HashMap<String, Object> param){

        List<MenuInfo> list = menuService.getMenuList(param);

        return new ResponseEntity(list, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/menu/topList")
    @ResponseBody
    public ResponseEntity getTopMenuList(@RequestParam HashMap<String, Object> param){

        List<MenuInfo> list = menuService.getTopMenuList(param);

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
        switch(result) {
            case 0:
                return new ResponseEntity("변경실패", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/menu/delete")
    @ResponseBody
    public ResponseEntity deleteMenu(@RequestParam HashMap<String, Object> param, Authentication auth){
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("modUser", userDetails.getUsername());

        int result = menuService.deleteMenu(param);
        switch(result) {
            case 0:
                return new ResponseEntity("삭제실패", HttpStatus.BAD_REQUEST);
            case -1:
                return new ResponseEntity("하위메뉴부터 삭제해야합니다.", HttpStatus.BAD_REQUEST);
            case -2:
                return new ResponseEntity("특정권한에서 사용중인 메뉴입니다.", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/menu/auth/userAuth")
    @ResponseBody
    public ResponseEntity getUserAuthList(@RequestParam HashMap<String, Object> param){
        logger.info("getUserAuthList param : {}", param);

        List<UserAuthInfo> list = menuService.getUserAuthList(param);

        return new ResponseEntity(list, HttpStatus.OK);
    }
    @RequestMapping(method= RequestMethod.POST, value="/menu/auth/regist")
    @ResponseBody
    public ResponseEntity insertUserAuthMenu(@RequestParam HashMap<String, Object> param, Authentication auth){
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("creUser", userDetails.getUsername());
        logger.info("insertUserAuthMenu param : {}", param);

        int result = menuService.insertUserAuthMenu(param);

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/menu/auth/delete")
    @ResponseBody
    public ResponseEntity deleteUserAuthMenu(@RequestParam HashMap<String, Object> param, Authentication auth){
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("modUser", userDetails.getUsername());
        logger.info("deleteUserAuthMenu param : {}", param);

        int result = menuService.deleteUserAuthMenu(param);
        switch(result) {
            case 0:
                return new ResponseEntity("삭제실패", HttpStatus.BAD_REQUEST);
            case -1:
                return new ResponseEntity("하위메뉴부터 삭제해야합니다.", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/user/list")
    @ResponseBody
    public ResponseEntity getUserList(@RequestParam HashMap<String, Object> param){

        List<UserInfo> list = userService.getUserList(param);

        return new ResponseEntity(list, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/user/initPw")
    @ResponseBody
    public ResponseEntity initPw(@RequestParam HashMap<String, Object> param, Authentication auth, HttpServletRequest request){
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("modUser", userDetails.getUsername());

        String errorMsg = "";
        int result = userService.initUserPw(param);
        switch(result) {
            case 0:
                errorMsg = "초기화가 실패했습니다.";
                break;
        }

        //이력저장 예외 > 패스워드 초기화 (파라미터 암호화)
        HashMap<String, Object> historyParam = new HashMap<>();
        historyParam.put("actionType", "LOGIN");
        historyParam.put("resourceId", "1001005");  //패스워드 초기화 성공
        historyParam.put("resourceType", "PASSWORD_RESET");
        historyParam.put("actionMsg", "비밀번호 초기화");
        historyParam.put("actionUser", param.get("modUser"));
        historyParam.put("params", param.toString());
        historyParam.put("userIp", request.getRemoteAddr());

        if(result < 1){ //패스워드 초기화 실패 시
            historyParam.put("resourceId", "1001006");  //패스워드 초기화 실패
            historyParam.put("resourceType", "PASSWORD_RESET_FAIL");
            historyParam.put("actionMsg", errorMsg);
        }
        userService.insertActionHistory(historyParam);

        //초기화 실패 시 실패 리턴
        if(result < 1) {
            return new ResponseEntity(errorMsg, HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }
}
