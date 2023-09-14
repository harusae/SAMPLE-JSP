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

        //예외페이지를 제외한 모든페이지는 인증관리만 적용 + 사용자별 메뉴권한은 세션데이터로 직접처리
        http
            .httpBasic().disable()
            .csrf().disable()
            .authorizeRequests()
                .anyRequest().authenticated()

        .and()
            .formLogin()
                .loginPage("/login").permitAll()
                .loginProcessingUrl("/loginPrc")
                .defaultSuccessUrl("/")
        .and()
            .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
                .clearAuthentication(true)
                .deleteCookies("JSESSIONID")
        .and()
            .sessionManagement();

        return http.build();
    }


}

