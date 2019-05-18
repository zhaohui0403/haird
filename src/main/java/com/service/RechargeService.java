package com.service;

import com.bean.Recharge;

import java.util.List;

/**
 * Created by Administrator on 2019/4/15.
 */
public interface RechargeService {
    public String charge(Recharge recharge);

    List<Recharge> getLogs(Integer memberId);
}
