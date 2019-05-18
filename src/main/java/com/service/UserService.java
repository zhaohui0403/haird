package com.service;

import com.bean.User;

/**
 * Created by Administrator on 2019/4/4.
 */
public interface UserService {
    public User getUser(User user);

    public User getUserByUsername(String username);
}
