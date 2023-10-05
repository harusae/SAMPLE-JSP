package kr.co.wisenut.controller;

import kr.co.wisenut.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.WebServiceContext;
import java.util.HashMap;

@Controller
public class LoginController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(Model model){
        return "login/login";
    }

    @RequestMapping("/login/reset")
    public String resetPw(Model model){
        return "login/reset";
    }

    @RequestMapping(method= RequestMethod.POST, value="/login/resetPw")
    @ResponseBody
    public ResponseEntity resetPw(@RequestParam HashMap<String, Object> param, Authentication auth, HttpServletRequest request) {
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("userId", userDetails.getUsername());
        //logger.info("resetPw param : {}", param);

        String errorMsg = "";
        int result = userService.updateUserPw(param);

        switch(result) {
            case 0:
                errorMsg = "변경실패";
            case -1:
                errorMsg = "변경 대상이 아닙니다.";
            case -2:
                errorMsg = "최근 3회 변경한 패스워드와 동일합니다.";
        }

        //이력저장 예외 > 패스워드 변경 (파라미터 암호화)
        HashMap<String, Object> historyParam = new HashMap<>();
        historyParam.put("actionType", "LOGIN");
        historyParam.put("resourceId", "1001003");  //패스워드 변경 성공
        historyParam.put("resourceType", "PASSWORD_CHANGE");
        historyParam.put("actionMsg", "비밀번호 변경");
        historyParam.put("actionUser", param.get("userId"));
        historyParam.put("params", param.toString());
        historyParam.put("userIp", request.getRemoteAddr());

        if(result < 1){ //패스워드 변경 실패 시
            historyParam.put("resourceId", "1001004");  //패스워드 변경 실패
            historyParam.put("resourceType", "PASSWORD_CHANGE_FAIL");
            historyParam.put("actionMsg", errorMsg);
        }
        userService.insertActionHistory(historyParam);

        //변경 실패 시 실패 리턴
        if(result < 1) {
            return new ResponseEntity(errorMsg, HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }
    
}
