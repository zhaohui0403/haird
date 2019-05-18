package com.service;

import com.bean.Funds;

import java.util.List;

/**
 * Created by Administrator on 2019/4/14.
 */
public interface FundsService {
    public void addFunds(Funds funds);

    public List<Funds> getInComeFunds(Funds funds);

    public List<Funds> getExpendFunds(Funds funds);

    public String getInComeAmout(Funds funds);

    public String getExpendAmout(Funds funds);
}
