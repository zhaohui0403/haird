package com.dao;

import com.bean.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * Created by Administrator on 2019/4/4.
 */
@Mapper
public interface UserDao {
    User getUser(User user);

    User getUserByUsername(String username);

    void update(User user);
}
