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
    public ResponseEntity deleteUserAuthMenu(@RequestParam HashMap<String, Object> param, Authentication auth) {
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        param.put("userId", userDetails.getUsername());
        logger.info("resetPw param : {}", param);
        int result = userService.updateUserPw(param);
        switch(result) {
            case 0:
                return new ResponseEntity("변경실패", HttpStatus.BAD_REQUEST);
            case -1:
                return new ResponseEntity("변경 대상이 아닙니다.", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }
    
}
