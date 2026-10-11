package com.aoba.pet.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;

@Component
public class JwtUtil {
    private static final String KEY_STR="abcdefghijklmnopqabcdefghijklmnopq88880914";
    private static final SecretKey KEY= Keys.hmacShaKeyFor(KEY_STR.getBytes(StandardCharsets.UTF_8));
    private static final long EXPIRE_TIME=2*60*60*1000;

    public static String generateToken(Long userId){
        Date now =new Date();
        Date expireDate=new Date(now.getTime()+EXPIRE_TIME);
        return Jwts.builder().setSubject(userId.toString()).setIssuedAt(now).setExpiration(expireDate).signWith(KEY).compact();
    }
    // 校验token是否合法、没过期
    public static boolean validateToken(String token) {
        try {
            Jws<Claims> jws = Jwts.parserBuilder()
                    .setSigningKey(KEY)
                    .build()
                    .parseClaimsJws(token);
            // 没有抛出异常就代表token有效
            return true;
        } catch (Exception e) {
            // 签名错误、过期、篡改都会进这里，返回false
            return false;
        }
    }
    // 从token获取userId（你之前叫getUserId，保持名字一致）
    public static Long getUserId(String token) {
        Claims claims = Jwts.parserBuilder()
                .setSigningKey(KEY)
                .build()
                .parseClaimsJws(token)
                .getBody();
        return Long.parseLong(claims.getSubject());
    }

    public static String generateToken(String username) {
        Date now = new Date();
        Date expireDate = new Date(now.getTime() + EXPIRE_TIME);
        return Jwts.builder()
                .setSubject(username)
                .setIssuedAt(now)
                .setExpiration(expireDate)
                .signWith(KEY)
                .compact();
    }

    //从token读取username字符串
    public static String getUsername(String token) {
        Claims claims = Jwts.parserBuilder()
                .setSigningKey(KEY)
                .build()
                .parseClaimsJws(token)
                .getBody();
        return claims.getSubject();
    }

}
