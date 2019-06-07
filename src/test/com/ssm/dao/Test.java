package com.ssm.dao;

public class Test {

    public static void main(String args[]) throws Exception {
       Father father = new Father();
        new Test().test(father);
    }

    public  <Son> void test(Son c) throws Exception {

        System.out.println(c);
    }
}
