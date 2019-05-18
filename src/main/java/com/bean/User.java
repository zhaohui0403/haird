package com.bean;

import java.io.Serializable;

/**
 * Created by Administrator on 2019/4/4.
 */
public class User implements Serializable{

    private static final long serialVersionUID = 7626058954331462265L;
    private String username;
    private String password;

    public User() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
