package com.config;

import com.interceptor.LoginInterceptor;
import com.interceptor.MyInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;

/**
 * Created by Administrator on 2019/4/3.
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
    Logger logger = LoggerFactory.getLogger(WebConfig.class);

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/static/");
        registry.addResourceHandler("/img/**").addResourceLocations("/img/");
        registry.addResourceHandler("/tags/**").addResourceLocations("/WEB-INF/tags/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        logger.info("进入拦截器");
        registry.addInterceptor(new MyInterceptor()).addPathPatterns("/**");
        registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**").excludePathPatterns("/login").excludePathPatterns("/img/**")
                .excludePathPatterns("/static/**").excludePathPatterns("/submit");
    }
}
