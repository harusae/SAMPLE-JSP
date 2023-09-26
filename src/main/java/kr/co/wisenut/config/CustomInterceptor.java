package kr.co.wisenut.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.HashMap;

public class CustomInterceptor implements HandlerInterceptor {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
        if(     request.getRequestURI().startsWith("/js") ||
                request.getRequestURI().startsWith("/css") ||
                request.getRequestURI().startsWith("/fonts")
        ){return true;} //라이브러리 파일은 생략

        String userId = (request.getUserPrincipal() == null) ? "noSession" : request.getUserPrincipal().getName();
        String userIp = request.getRemoteAddr();
        HashMap<String, Object> params = new HashMap<>();

        Enumeration requestParameterNames = request.getParameterNames();
        while (requestParameterNames.hasMoreElements()){
            String name = String.valueOf(requestParameterNames.nextElement());
            params.put(name, request.getParameter(name));
        }

        //이력저장 > 에외를 제외한 URL
        logger.info("preHandle : {} : {} : {} : {}", request.getRequestURI(), userId, userIp, params);

        return true;
    }

    public String getClientIP(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        logger.info("X-FORWARDED-FOR : " + ip);

        if (ip == null) {
            ip = request.getHeader("Proxy-Client-IP");
            //logger.info("Proxy-Client-IP : " + ip);
        }
        if (ip == null) {
            ip = request.getHeader("WL-Proxy-Client-IP");
            //logger.info("WL-Proxy-Client-IP : " + ip);
        }
        if (ip == null) {
            ip = request.getHeader("HTTP_CLIENT_IP");
            //logger.info("HTTP_CLIENT_IP : " + ip);
        }
        if (ip == null) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
            //logger.info("HTTP_X_FORWARDED_FOR : " + ip);
        }
        if (ip == null) {
            ip = request.getRemoteAddr();
            //logger.info("getRemoteAddr : "+ip);
        }
        //logger.info("Result : IP Address : "+ip);

        return ip;
    }
}
