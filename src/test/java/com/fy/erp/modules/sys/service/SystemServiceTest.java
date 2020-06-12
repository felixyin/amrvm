package com.fy.erp.modules.sys.service;

import org.junit.Test;

import static org.junit.Assert.*;

public class SystemServiceTest {

    @Test
    public void entryptPassword() {
        String s = SystemService.entryptPassword("123456");
        System.out.println(s);
    }
}