package com.aoba.pet.filter;

import com.aoba.pet.util.JwtUtil;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Collections;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {
    private final JwtUtil jwtUtil;
    public JwtAuthenticationFilter(JwtUtil jwtUtil){
        this.jwtUtil=jwtUtil;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        String authHeader=request.getHeader("Authorization");
        String token=null;
        boolean hasAuthHeader = StringUtils.hasText(authHeader) && authHeader.startsWith("Bearer ");
        if (StringUtils.hasText(authHeader)&&authHeader.startsWith("Bearer ")) {
            token = authHeader.substring(7);
        }
            if (StringUtils.hasText(token)&&jwtUtil.validateToken(token)){
                String username = jwtUtil.getUsername(token);
                System.out.println("=====token校验通过，username："+username);
                UsernamePasswordAuthenticationToken authToken
                        = new UsernamePasswordAuthenticationToken(username, null, Collections.emptyList());
                SecurityContextHolder.getContext().setAuthentication(authToken);
                filterChain.doFilter(request, response);
            }else {
                if (hasAuthHeader){
                    response.setContentType("application/json;charset=utf-8");
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    response.getWriter().write("{\"code\":401,\"msg\":\"token无效或者已过期\"}");
                    return;
                }
                filterChain.doFilter(request,response);
            }
            //filterChain.doFilter(request, response);

    }}
