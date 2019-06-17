package com.service.impl;

import com.bean.CutLog;
import com.bean.HairdCard;
import com.bean.Record;
import com.bean.Wage;
import com.dao.CutLogDao;
import com.dao.HairdCardDao;
import com.dao.WageDao;
import com.service.CutLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ADMIN on 2019/6/15.
 */
@Service
public class CutLogServiceImpl implements CutLogService {
    @Autowired
    private CutLogDao cutLogDao;
    @Autowired
    private WageDao wageDao;
    @Autowired
    private HairdCardDao hairdCardDao;

    @Override
    @Transactional
    public void cut(CutLog cutLog, Record record) {
        cutLogDao.add(cutLog);

        //发型师提成
        Wage wage = new Wage();
        wage.setId(Integer.parseInt(record.getHairstye()));
        wage.setAmout(record.getHaircommi());
        wage.setDescription(cutLog.getCardId() + "号剪发卡剪发提成" + record.getHaircommi() + "元");
        wageDao.insert(wage);

        //助理提成
        Wage wage1 = new Wage();
        wage1.setId(Integer.parseInt(record.getAssistant()));
        wage1.setAmout(record.getAssicommi());
        wage1.setDescription(cutLog.getCardId() + "号剪发卡剪发提成" + record.getAssicommi() + "元");
        wageDao.insert(wage1);

        HairdCard hairdCard = hairdCardDao.getHairdCardByCardId(cutLog.getCardId()).get(0);
        if(hairdCard.getTimes() == hairdCard.getCutLogs().size()){
            hairdCard.setStatus(0);
            hairdCardDao.fail(hairdCard);
        }
    }

    @Override
    public List<CutLog> cutLogs(int id) {
        HairdCard hairdCard = hairdCardDao.getHairdCardById(id);
        return cutLogDao.getCutLogs(hairdCard.getCardId());
    }
}
