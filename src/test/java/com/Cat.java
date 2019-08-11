package com;

/**
 * Created by ADMIN on 2019/8/7.
 */
public class Cat extends Animal {
    public String name;
    public Cat(){
        System.out.println(3);
    }
    public Cat(String name){
        new Animal(name);
        System.out.println(4);
    }
}
