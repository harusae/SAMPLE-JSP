package kr.co.wisenut.config;

import kr.co.wisenut.config.sub.SHA256;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebMvcConfigurerAdapter {

    @Autowired
    private CustomLoginHandler customLoginHandler;
    @Autowired
    private CustomAuthenticatioFailureHandler customAuthenticatioFailureHandler;
    @Autowired
    private CustomInterceptor customInterceptor;
    @Autowired
    private CustomLogoutHandler customLogoutHandler;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{

        http
                .httpBasic().disable()
                .csrf().disable()
                .authorizeRequests()
                //.anyRequest().authenticated()                                                         //전체페이지 로그인인증만 체크
                .anyRequest().access("@authrorizationChecker.check(request, authentication)")   //전체페이지 권한메뉴+하위api 체크
            .and()
                .formLogin()
                .loginPage("/login").permitAll()
                .loginProcessingUrl("/loginPrc")
                .successHandler(customLoginHandler)      //로그인 성공 처리
                .failureHandler(customAuthenticatioFailureHandler)    //로그인 실패 + 에러메시지 처리
            .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .addLogoutHandler(customLogoutHandler)
                .invalidateHttpSession(true)
                .clearAuthentication(true)
                .deleteCookies("JSESSIONID")
            .and()
                .sessionManagement()
            .and()
                .exceptionHandling()
                .authenticationEntryPoint(new CustomAuthEntryPoint("/login"))

        ;


        return http.build();
    }


    //세션만료 체크 (SessionDestroyListener) SessionDestroyedEvent 캐치를 위한 설정
    @Bean
    public ServletListenerRegistrationBean<HttpSessionEventPublisher> httpSessionEventPublisher() {
        return new ServletListenerRegistrationBean<HttpSessionEventPublisher>(new HttpSessionEventPublisher());
    }

    //URL 이력저장을 위한 CustomInterceptor 설정
    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(customInterceptor)
                .excludePathPatterns("/login");
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        // 정적 리소스들이 보안필터를 통과하도록 처리
        return (web) -> web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/font/**");
    }
/*
    //기본암호화 BCrypt로 password 처리
    @Bean
    public BCryptPasswordEncoder encodePwd() {
        return new BCryptPasswordEncoder();
    }
*/
    //SHA256으로 password 처리
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new SHA256();
    }


}

