package com.service;

import com.bean.User;

/**
 * Created by Administrator on 2019/4/4.
 */
public interface UserService {
    User getUser(User user);

    User getUserByUsername(String username);

    void update(User user);

    boolean check(User user);
}
