package com.service.impl;

import com.bean.Wage;
import com.dao.WageDao;
import com.service.WageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2019/4/20.
 */
@Service
public class WageServiceImpl implements WageService {
    @Autowired
    private WageDao wageDao;

    @Override
    public List<Wage> getWages(Wage wage) {
        List<Wage> content = wageDao.getWage(wage);
        return content;

    }

    @Override
    public List<Wage> detail(Wage wage) {
        List<Wage> content = wageDao.wageDetail(wage);
        return content;
    }
}
