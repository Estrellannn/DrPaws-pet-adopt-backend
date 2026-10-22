package com.aoba.pet;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
class PetApplicationTests {

    @Test
    void contextLoads() {
    }

    // 密码加密测试方法
    @Test
    void testPasswordEncode() {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String pwd1 = encoder.encode("111");
        String pwd2 = encoder.encode("222");
        System.out.println("111 加密后：" + pwd1);
        System.out.println("222 加密后：" + pwd2);
    }

}
