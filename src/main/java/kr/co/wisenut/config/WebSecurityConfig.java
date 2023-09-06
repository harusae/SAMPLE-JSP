package kr.co.wisenut.config;

import kr.co.wisenut.config.sub.SecurityDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig{

    @Autowired
    private DataSource dataSource;
    @Autowired
    private SecurityDAO sd;


    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        // 정적 리소스들이 보안필터를 통과하도록 처리
        return (web) -> web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/font/**");
    }

    @Bean
    public BCryptPasswordEncoder encodePwd() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{

        //List<Map<String, Object>> list = sd.getAuthReq();
        //System.out.println("list : "+ list.toString());

        http
            .csrf().disable()
            .authorizeRequests()
                //.antMatchers("/manage/**").hasAnyRole("ROLE_MANAGER")
                .anyRequest().authenticated()
                //.anyRequest().permitAll()
        .and()
            .formLogin()
                .loginPage("/login").permitAll()
                .loginProcessingUrl("/loginPrc").permitAll()
                .defaultSuccessUrl("/")
        .and()
            .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/");

        return http.build();
    }


}

