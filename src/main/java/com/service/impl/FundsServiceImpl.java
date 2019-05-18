package com.service.impl;

import com.bean.Funds;
import com.dao.FundsDao;
import com.service.FundsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2019/4/14.
 */
@Service
public class FundsServiceImpl implements FundsService {
    @Autowired
    private FundsDao fundsDao;
    @Override
    public void addFunds(Funds funds) {
        if(funds.getId() == null || funds.getId() == 0){
            funds.setConsumetype(-1);
            fundsDao.add(funds);
        }else {
            fundsDao.update(funds);
        }
    }

    @Override
    public List<Funds> getInComeFunds(Funds funds) {
        List<Integer> status = new ArrayList<Integer>();
        status.add(0);
        status.add(1);
        List<Funds> funds1 = fundsDao.getFunds(funds.getStartTime(),funds.getEndTime(),status);
        return funds1;
    }

    @Override
    public List<Funds> getExpendFunds(Funds funds) {
        List<Integer> status = new ArrayList<Integer>();
        status.add(-1);
        List<Funds> funds1 = fundsDao.getFunds(funds.getStartTime(),funds.getEndTime(),status);
        return funds1;
    }

    @Override
    public String getInComeAmout(Funds funds) {
        List<Integer> status = new ArrayList<Integer>();
        status.add(0);
        status.add(1);
        String amout = fundsDao.getAmout(funds.getStartTime(), funds.getEndTime(), status);
        return amout;
    }

    @Override
    public String getExpendAmout(Funds funds) {
        List<Integer> status = new ArrayList<Integer>();
        status.add(-1);
        String amout = fundsDao.getAmout(funds.getStartTime(), funds.getEndTime(), status);
        return amout;
    }
}
