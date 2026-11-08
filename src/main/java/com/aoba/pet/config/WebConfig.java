package com.aoba.pet.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    public void addResourceHandlers(ResourceHandlerRegistry registry){
        registry.addResourceHandler("/avatar/**")
                .addResourceLocations("file:D:/pet_upload/avatar/");

        registry.addResourceHandler("/postimg/**")
                .addResourceLocations("file:D:/pet_upload/postimg/");
    }
}
