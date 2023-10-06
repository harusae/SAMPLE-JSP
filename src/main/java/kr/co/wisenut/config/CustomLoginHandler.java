package kr.co.wisenut.config;

import kr.co.wisenut.config.sub.UserDetailsImpl;
import kr.co.wisenut.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

    @Value("${value.pw.change.check:60}")
    private int pwChangeCheck;  //패스워드 변경 기준일 (property 미설정 시 60)

    @Autowired
    private UserService userService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        //로그인 사용자 정보
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

        //이력저장 > 로그인 성공
        //logger.info("login success : {} : {}, {}", request.getRequestURI(), authentication.getName(), request.getRemoteAddr());
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

        //패스워드 변경 후 누적일 체크
        logger.info("pwChgDay : {}", userDetails.getPwChgDay());
        logger.info("pwChangeCheck : {}", pwChangeCheck);
        logger.info("pw change target : {}", pwChangeCheck < userDetails.getPwChgDay());
        if(pwChangeCheck < userDetails.getPwChgDay()){
            //변경 대상인 경우 > 패스워드초기화 없이 변경대상으로 설정
            userService.updateResetYn(param);
            userDetails.setResetYn("Y");
            request.setAttribute("resetMsg", "비밀번호 재등록 대상입니다.");
            request.getRequestDispatcher("/login/reset").forward(request, response);
        }
        else if("Y".equals(userDetails.getResetYn())){
            //패스워드 초기화 대상자면 화면이동
            //response.sendRedirect("/login/reset");
            request.getRequestDispatcher("/login/reset").forward(request, response);
        }
        else{
            response.sendRedirect("/");
        }

    }
}
