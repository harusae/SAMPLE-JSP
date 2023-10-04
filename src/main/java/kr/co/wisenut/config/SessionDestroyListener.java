package kr.co.wisenut.config;

import kr.co.wisenut.config.sub.UserDetailsImpl;
import kr.co.wisenut.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

@Component
public class SessionDestroyListener implements ApplicationListener<SessionDestroyedEvent> {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    @Override
    public void onApplicationEvent(SessionDestroyedEvent event) {

        List<SecurityContext> securityContexts = event.getSecurityContexts();

        UserDetailsImpl userDetails = null;
        WebAuthenticationDetails authDetails = null;
        for (SecurityContext securityContext : securityContexts) {
            userDetails = (UserDetailsImpl) securityContext.getAuthentication().getPrincipal();
            authDetails = (WebAuthenticationDetails) securityContext.getAuthentication().getDetails();
            logger.info("session expired: {} : {}", userDetails.getUsername(), authDetails.getRemoteAddress());

            if(userDetails != null && authDetails != null){
                HashMap<String, Object> param = new HashMap<>();
                param.put("actionType", "LOGOUT");
                param.put("resourceId", "1002001");
                param.put("resourceType", "LOGOUT");
                param.put("actionMsg", "로그아웃(세션만료)");
                param.put("actionUser", userDetails.getUsername());
                param.put("params", "");
                param.put("userIp", authDetails.getRemoteAddress());
                userService.insertActionHistory(param);

                userDetails = null;
                authDetails = null;
            }
        }
    }
}
