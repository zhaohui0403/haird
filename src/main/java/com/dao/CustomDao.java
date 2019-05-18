package com.dao;

import com.bean.Custom;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by Administrator on 2019/4/5.
 */
@Mapper
public interface CustomDao {

    void addCustom(Custom custom);

    List<Custom> getCustoms(Custom custom);

    Custom getCustomsById(String id);

    void update(Custom custom);

    void deleteById(String id);

    List<Custom> getCustomsByType(String customtype);
}
