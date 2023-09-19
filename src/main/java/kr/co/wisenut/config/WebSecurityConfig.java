package kr.co.wisenut.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig{

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        // 정적 리소스들이 보안필터를 통과하도록 처리
        return (web) -> web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/font/**");
    }

    //기본암호화 BCrypt로 password 처리
    @Bean
    public BCryptPasswordEncoder encodePwd() {
        return new BCryptPasswordEncoder();
    }

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
                .defaultSuccessUrl("/")
                .failureHandler(new CustomAuthenticatioFailureHandler())    //로그인 에러메시지 처리
        .and()
            .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
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


}

