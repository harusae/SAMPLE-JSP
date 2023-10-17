package kr.co.wisenut.controller.admin;

import kr.co.wisenut.entity.*;
import kr.co.wisenut.service.CommonService;
import kr.co.wisenut.service.KeywordService;
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
import java.util.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/manage")
public class ManageRestController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CommonService commonService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private UserService userService;
    @Autowired
    private KeywordService keywordService;


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

    @RequestMapping(method= RequestMethod.POST, value="/user/modify")
    @ResponseBody
    public ResponseEntity updateUser(@RequestParam HashMap<String, Object> param, Authentication auth){
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("modUser", userDetails.getUsername());

        logger.info("updateUser param : {}", param);

        int result = userService.updateUser(param);
        switch(result) {
            case 0:
                return new ResponseEntity("변경실패", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
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

    @RequestMapping(method= RequestMethod.POST, value="/user/ssoUsr")
    @ResponseBody
    public ResponseEntity getSsoUsrInfo(@RequestParam HashMap<String, Object> param){

        SsoUsrInfo result = userService.getSsoUsrInfo(param);
        if(result == null){
            return new ResponseEntity("등록할 수 없는 사용자입니다.", HttpStatus.BAD_REQUEST);
        }
        else if(!result.getHlfcDscd().equals("1")){
            return new ResponseEntity("재직 중인 사용자가 아닙니다.", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/user/regist")
    @ResponseBody
    public ResponseEntity registUser(@RequestParam HashMap<String, Object> param, Authentication auth){
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("creUser", userDetails.getUsername());

        logger.info("registUser param : {}", param);

        int result = userService.registUser(param);
        switch(result) {
            case 0:
                return new ResponseEntity("등록실패", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }


    @RequestMapping(method= RequestMethod.POST, value="/keyword/list")
    @ResponseBody
    public ResponseEntity getKeywordList(@RequestParam HashMap<String, Object> param){

        List<KeywordInfo> list = keywordService.getKeywordList(param);

        return new ResponseEntity(list, HttpStatus.OK);
    }


    @RequestMapping(method= RequestMethod.POST, value="/keyword/code")
    @ResponseBody
    public ResponseEntity getKeywordCodeList(@RequestParam HashMap<String, Object> param){
        logger.info("getKeywordCodeList param : {}", param);

        List<CodeInfo> list = commonService.getCodeList(param);

        return new ResponseEntity(list, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/keyword/regist")
    @ResponseBody
    public ResponseEntity insertKeyword(@RequestParam HashMap<String, Object> param, Authentication auth){
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("creUser", userDetails.getUsername());
        logger.info("insertKeyword param : {}", param);

        int result = keywordService.insertKeyword(param);

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/keyword/modify")
    @ResponseBody
    public ResponseEntity updateKeyword(@RequestParam HashMap<String, Object> param, Authentication auth){
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("modUser", userDetails.getUsername());
        //logger.info("updateKeyword param : {}", param);

        int result = keywordService.updateKeyword(param);
        switch(result) {
            case 0:
                return new ResponseEntity("변경실패", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @RequestMapping(method= RequestMethod.POST, value="/keyword/delete")
    @ResponseBody
    public ResponseEntity deleteKeyword(@RequestParam HashMap<String, Object> param, Authentication auth){
        logger.info("deleteKeyword param : {}", param);
        //다중삭제용 리스트 파라미터
        ArrayList<String> paramList = new ArrayList<>();
        String[] tmp = param.get("deleteKeywordTargetList").toString().split(",");
        paramList.addAll(Arrays.asList(tmp));

        int result = keywordService.deleteKeyword(paramList);
        switch(result) {
            case 0:
                return new ResponseEntity("삭제실패", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }
}
