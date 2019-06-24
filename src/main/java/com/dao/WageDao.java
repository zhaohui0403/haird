package com.dao;

import com.bean.Wage;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by Administrator on 2019/4/5.
 */
@Mapper
public interface WageDao {
    void insert(Wage wage);

    void del(Integer id);

    List<Wage> getWage(Wage wage);

    List<Wage> wageDetail(Wage wage);

    void updateWage(Wage wage);

    void delCutLog(String id);
}
