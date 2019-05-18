package com.service.impl;

import com.bean.*;
import com.dao.*;
import com.model.Page;
import com.service.RecordService;
import com.utils.CommonUtils;
import com.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2019/4/16.
 */
@Service
public class RecordServiceImpl implements RecordService {
    @Autowired
    private RecordDao recordDao;
    @Autowired
    private WageDao wageDao;
    @Autowired
    private RechargeDao rechargeDao;
    @Autowired
    private MemberDao memberDao;
    @Autowired
    private FundsDao fundsDao;

    @Override
    public Page<Record> getRecords(Record record) {

        Page<Record> page = new Page<Record>();
        page.setIndex(record.getIndex());
        page.setSize(record.getSize());

        List<Record> records = recordDao.getRecords(record);
        page.setContext(records);

        int count = recordDao.count(record);
        page.setCount(count);
        return page;
    }

    @Override
    public Record getRecordById(Integer id) {
        return recordDao.getRecordById(id);
    }

    @Override
    @Transactional
    public void bill(Record record) {
        recordDao.insertRecord(record);

        //发型师提成
        Wage wage = new Wage();
        wage.setId(Integer.parseInt(record.getHairstye()));
        wage.setAmout(record.getHaircommi());
        wage.setRecordId(record.getId());
        wage.setDescription(record.getId() + "号单消费" + record.getAmout() +"元，提成" + record.getHaircommi() + "元");
        wageDao.insert(wage);

        //助理提成
        Wage wage1 = new Wage();
        wage1.setId(Integer.parseInt(record.getAssistant()));
        wage1.setRecordId(record.getId());
        wage1.setAmout(record.getAssicommi());
        wage1.setDescription(record.getId() + "号单消费" + record.getAmout() +"元，提成" + record.getAssicommi() + "元");
        wageDao.insert(wage1);

        if("3".equals(record.getPaytype())){
            //扣款
            Recharge recharge = new Recharge();
            recharge.setMemberid(record.getMemberId());
            recharge.setAmout((0 - Double.parseDouble(record.getAmout())) + "");
            memberDao.charge(recharge);
            //消费记录
            recharge.setAmout(record.getAmout());
            recharge.setPaytype("-1");
            recharge.setDescription(DateUtils.getDate() + "消费" + CommonUtils.getMap(record.getContype()) + ",消费金额：" + record.getAmout() + "元");
            recharge.setRecordId(record.getId());
            recharge.setBalance(memberDao.getAmout(record.getMemberId() + ""));
            rechargeDao.insert(recharge);

        }else {
            //账单
            Funds funds = new Funds();
            funds.setPaytype(Integer.parseInt(record.getPaytype()));
            funds.setAmout(record.getAmout());
            funds.setRecordId(record.getId());
            funds.setConsumetype(1);
            funds.setDes("收入" + record.getId() + "号单" + CommonUtils.getMap(record.getContype()) + "消费金额：" + record.getAmout() + "元");
            fundsDao.add(funds);
        }
    }

    @Override
    @Transactional
    public void del(Integer id) {
        Record record = recordDao.getRecordById(id);
        recordDao.del(id);
        wageDao.del(id);
        if("3".equals(record.getPaytype())){
            rechargeDao.del(id);
            Recharge recharge = new Recharge();
            recharge.setAmout(record.getAmout());
            recharge.setMemberid(record.getMemberId());
            memberDao.charge(recharge);
        }else {
            fundsDao.del(id);
        }
    }
}
