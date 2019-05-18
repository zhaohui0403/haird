package com.service.impl;

import com.bean.Custom;
import com.bean.Wage;
import com.dao.CustomDao;
import com.dao.WageDao;
import com.service.CustomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2019/4/7.
 */
@Service
public class CustomServiceImpl implements CustomService {
    @Autowired
    private CustomDao customDao;
    @Autowired
    private WageDao wageDao;

    @Override
    @Transactional
    public void addCustom(Custom custom) {
        customDao.addCustom(custom);
        Wage wage = new Wage();
        wage.setId(custom.getId());
        wage.setAmout(custom.getWage());
        wage.setWageType(1);
        wage.setDescription("基本工资");
        wageDao.insert(wage);
    }

    @Override
    public List<Custom> getCustom(Custom custom) {
        return customDao.getCustoms(custom);
    }

    @Override
    public Custom getCustomById(String id) {
        return customDao.getCustomsById(id);
    }

    @Override
    @Transactional
    public void update(Custom custom) {
        customDao.update(custom);
        Wage wage = new Wage();
        wage.setId(custom.getId());
        wage.setAmout(custom.getWage());
        wage.setWageType(1);
        wageDao.updateWage(wage);
    }

    @Override
    public void deleteById(String id) {
        customDao.deleteById(id);
    }

    @Override
    public List<Custom> getCustomByType(String customtype) {
        return customDao.getCustomsByType(customtype);
    }

}
