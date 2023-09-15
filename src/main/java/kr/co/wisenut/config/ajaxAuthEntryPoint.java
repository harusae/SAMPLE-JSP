package kr.co.wisenut.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ajaxAuthEntryPoint extends LoginUrlAuthenticationEntryPoint {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * @param loginFormUrl URL where the login page can be found. Should either be
     *                     relative to the web-app context path (include a leading {@code /}) or an absolute
     *                     URL.
     */
    public ajaxAuthEntryPoint(String loginFormUrl) {
        super(loginFormUrl);
    }
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {

        //rest 서비스에 ajax로 접근 + 세션만료된 경우를 위한 예외처리
        String ajaxHeader = ((HttpServletRequest) request).getHeader("X-Requested-With");
        boolean isAjax = "XMLHttpRequest".equals(ajaxHeader);
        if (isAjax) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Session Expired");
        } else {
            super.commence(request, response, authException);
        }
    }
}
