package com.hoolitels.server.config;

import com.hoolitels.server.service.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class MyWebSecurityConfigAdapter extends WebSecurityConfigurerAdapter {
    @Autowired
    private MyUserDetailsService myUserDetailService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .httpBasic()
            .and()
            .authorizeRequests()
            .antMatchers("/rest/**").authenticated()
            .antMatchers("/rest/city").permitAll()
            .antMatchers(HttpMethod.POST,"/rest/user").permitAll()
            .antMatchers("/").permitAll();
//            .and()// Ta bort när vi har eget formulär
//            .formLogin(); // Ta bort när vi har eget formulär
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
            .userDetailsService(myUserDetailService)
            .passwordEncoder(myUserDetailService.getEncoder());
    }
}
