package kr.co.wisenut.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomLoginHandler implements AuthenticationSuccessHandler {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

        logger.info("login success : {} : {}, {}", request.getRequestURI(), authentication.getName(), request.getRemoteAddr());

        response.sendRedirect("/");
    }
}