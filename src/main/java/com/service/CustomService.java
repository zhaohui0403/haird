package com.service;

import com.bean.Custom;

import java.util.List;

/**
 * Created by Administrator on 2019/4/7.
 */
public interface CustomService {
    public void addCustom(Custom custom);

    public List<Custom> getCustom(Custom custom);

    Custom getCustomById(String id);

    void update(Custom custom);

    void deleteById(String id);

    List<Custom> getCustomByType(String s);
}
