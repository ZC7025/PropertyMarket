package com.ht.aop;

/**
 * Created by 7025 on 2017/8/24.
 * 用于权限验证
 */
public class MethodAdvice {

    public void before() {
        System.out.println("before...");
    }

    public void after() {
        System.out.println("after....");
    }

    public void exp() {
        System.out.println("exception...");
    }

}
