package kr.co.wisenut.config;

import kr.co.wisenut.config.sub.UserDetailsImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SessionDestroyListener implements ApplicationListener<SessionDestroyedEvent> {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void onApplicationEvent(SessionDestroyedEvent event) {

        List<SecurityContext> securityContexts = event.getSecurityContexts();

        for (SecurityContext securityContext : securityContexts) {
            UserDetailsImpl userDetails = (UserDetailsImpl) securityContext.getAuthentication().getPrincipal();
            WebAuthenticationDetails authDetails = (WebAuthenticationDetails) securityContext.getAuthentication().getDetails();
            logger.info("sessionTimeout : {} : {}", userDetails.getUsername(), authDetails.getRemoteAddress());
        }
    }
}
