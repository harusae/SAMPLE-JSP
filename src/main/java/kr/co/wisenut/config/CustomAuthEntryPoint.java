package kr.co.wisenut.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthEntryPoint extends LoginUrlAuthenticationEntryPoint {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    public CustomAuthEntryPoint(String loginFormUrl) {
        super(loginFormUrl);
    }
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {

        //rest 서비스에 접근 + 세션만료된 경우를 위한 예외처리
        String header = ((HttpServletRequest) request).getHeader("X-Requested-With");
        boolean isHttp = "XMLHttpRequest".equals(header);
        if (isHttp) {
            //return error (401)
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Session Expired");
        } else {
            super.commence(request, response, authException);
        }
    }
}
