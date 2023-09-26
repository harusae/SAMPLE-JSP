package kr.co.wisenut.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticatioFailureHandler implements AuthenticationFailureHandler {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        logger.info("login fail : {} : {}", request.getRequestURI(), request.getRemoteAddr());

        //기본 로그인 실패에러 메시지
        if(exception instanceof BadCredentialsException){
            request.setAttribute("errorMsg", "로그인이 실패했습니다.");
        }
        //그 외 메시지 전달 에러
        else{
            request.setAttribute("errorMsg", exception.getMessage());
        }
        
        //에러메시지 전달
        request.getRequestDispatcher("/login").forward(request, response);
    }
}
