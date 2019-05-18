package com.service.impl;

import com.bean.Funds;
import com.bean.Recharge;
import com.bean.Wage;
import com.dao.FundsDao;
import com.dao.MemberDao;
import com.dao.RechargeDao;
import com.dao.WageDao;
import com.service.RechargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2019/4/15.
 */
@Service
public class RechargeServiceImpl implements RechargeService {
    @Autowired
    private MemberDao memberDao;
    @Autowired
    private WageDao wageDao;
    @Autowired
    private FundsDao fundsDao;
    @Autowired
    private RechargeDao rechargeDao;

    @Override
    @Transactional
    public String charge(Recharge recharge) {
        //充值
        memberDao.charge(recharge);
        //提成
       /* double chargeAmout = Double.parseDouble(recharge.getAmout());
        double amout = chargeAmout * 0.9 * 0.1;
        Wage wage = new Wage();
        wage.setId(Integer.parseInt(recharge.getHandlerman()));
        wage.setAmout(amout + "");
        wage.setDescription("会员卡"+recharge.getMemberid() + "充值"+recharge.getAmout() + "元,提成：" + amout);
        wageDao.insert(wage);*/
        //账单记录
        Funds funds = new Funds();
        funds.setAmout(recharge.getAmout());
        funds.setConsumetype(0);
        funds.setDes("会员卡"+recharge.getMemberid()+"充值"+recharge.getAmout()+"元");
        funds.setPaytype(Integer.parseInt(recharge.getPaytype()));
        fundsDao.add(funds);
        //会员卡消费记录
        String balance = memberDao.getAmout(recharge.getMemberid() + "");
        recharge.setBalance(balance);
        recharge.setDescription("充值"+recharge.getAmout()+"元");
        rechargeDao.insert(recharge);
        return balance;
    }

    @Override
    public List<Recharge> getLogs(Integer memberId) {
        List<Recharge> logs = rechargeDao.getLogs(memberId);
        return logs;
    }
}
