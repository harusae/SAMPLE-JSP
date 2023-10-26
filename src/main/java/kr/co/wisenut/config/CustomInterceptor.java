package kr.co.wisenut.config;

import kr.co.wisenut.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.HashMap;

@Component
public class CustomInterceptor implements HandlerInterceptor {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
        if(     request.getRequestURI().startsWith("/js") ||
                request.getRequestURI().startsWith("/css") ||
                request.getRequestURI().startsWith("/img") ||
                request.getRequestURI().startsWith("/font")
        ){return true;} //라이브러리 파일은 생략

        //이력저장 시 예외처리가 필요한 케이스는 공통처리에서 제외
        if(checkPassInterceptor(request.getRequestURI())){return true;}

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
        HashMap<String, Object> param = new HashMap<>();
        param.put("actionType", "INQUERY");
        param.put("resourceId", "2001001");
        param.put("resourceType", "USER_ACTION");
        param.put("actionMsg", request.getRequestURI());
        param.put("actionUser", userId);
        param.put("params", params.toString());
        param.put("userIp", userIp);
        userService.insertActionHistory(param);

        return true;
    }

    private boolean checkPassInterceptor(String uri){
        switch(uri){
            case "/myPage/changeInfo" : return true;    //패스워드 변경 포함 > 예외처리
            case "/login/resetPw" : return true;        //패스워드 변경 > 예외처리
            case "/sessionChk" : return true;           //세션체크 호출 > 예외처리
        };

        return false;
    }
/*
    //현재 일반적인 사용케이스에서는 request.getRemoteAddr() 로 처리가능
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
*/
}
