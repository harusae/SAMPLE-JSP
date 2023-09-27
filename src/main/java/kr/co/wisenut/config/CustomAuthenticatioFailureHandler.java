package kr.co.wisenut.config;

import kr.co.wisenut.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@Component
public class CustomAuthenticatioFailureHandler implements AuthenticationFailureHandler {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {

        //이력저장 > 로그인 실패
        logger.info("login fail : {} : {} : {} : {}", request.getRequestURI(), request.getRemoteAddr(), request.getParameter("username"), exception.getClass());

        //기본 로그인 실패에러 메시지
        if(exception instanceof BadCredentialsException){
            request.setAttribute("errorMsg", "로그인이 실패했습니다.");
        }
        //그 외 메시지 전달 에러
        else{
            request.setAttribute("errorMsg", exception.getMessage());
        }

        //로그인 실패 시 실패 횟수 증가
        HashMap<String, Object> param = new HashMap<>();
        param.put("userId", request.getParameter("username"));
        userService.loginFail(param);

        
        //에러메시지 전달
        request.getRequestDispatcher("/login").forward(request, response);
    }
}
