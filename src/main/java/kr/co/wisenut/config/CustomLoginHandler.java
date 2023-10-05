package kr.co.wisenut.config;

import kr.co.wisenut.config.sub.UserDetailsImpl;
import kr.co.wisenut.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@Component
public class CustomLoginHandler implements AuthenticationSuccessHandler {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

        //이력저장 > 로그인 성공
        logger.info("login success : {} : {}, {}", request.getRequestURI(), authentication.getName(), request.getRemoteAddr());
        HashMap<String, Object> param = new HashMap<>();
        param.put("actionType", "LOGIN");
        param.put("resourceId", "1001001");
        param.put("resourceType", "LOGIN_SUCCESS");
        param.put("actionMsg", "로그인 성공");
        param.put("actionUser", authentication.getName());
        param.put("params", "");
        param.put("userIp", request.getRemoteAddr());
        userService.insertActionHistory(param);

        //로그인 성공 후 로그인실패횟수 리셋처리
        param = new HashMap<>();
        param.put("userId", authentication.getName());
        userService.loginSuccess(param);

        //패스워드 초기화 대상자면 화면이동
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        logger.info("resetPw : {}", userDetails.getResetYn());
        if("Y".equals(userDetails.getResetYn())){
            response.sendRedirect("/login/reset");
        }
        else{
            response.sendRedirect("/");
        }

    }
}
