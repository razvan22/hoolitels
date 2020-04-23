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
            .cors().and()
            .csrf().disable()
            .authorizeRequests()
            .antMatchers(HttpMethod.GET, "/rest/city/**").permitAll()
            .antMatchers(HttpMethod.GET,"/rest/amenity/**").permitAll()
            .antMatchers(HttpMethod.GET,"/rest/country/**").permitAll()
            .antMatchers("/rest/**").authenticated()
            .antMatchers("/api/**").authenticated()
            .antMatchers("/rest/city").permitAll()
            .antMatchers(HttpMethod.POST,"/rest/user").permitAll()
            .antMatchers(HttpMethod.POST,"/login").permitAll()
            .antMatchers("/").permitAll()
            .and()
            .formLogin();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
            .userDetailsService(myUserDetailService)
            .passwordEncoder(myUserDetailService.getEncoder());
    }
}
