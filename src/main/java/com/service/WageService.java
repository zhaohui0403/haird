package com.service;

import com.bean.Wage;

import java.util.List;

/**
 * Created by Administrator on 2019/4/20.
 */
public interface WageService {
    List<Wage> getWages(Wage wage);

    List<Wage> detail(Wage wage);
}
