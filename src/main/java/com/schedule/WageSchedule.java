package com.schedule;

import com.bean.Custom;
import com.bean.Wage;
import com.dao.CustomDao;
import com.dao.WageDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * Created by ADMIN on 2019/6/15.
 */
@Component
@Configuration //1.主要用于标记配置类，兼备Component的效果。
@EnableScheduling
public class WageSchedule {
    Logger logger = LoggerFactory.getLogger(WageSchedule.class);

    @Autowired
    private CustomDao customDao;
    @Autowired
    private WageDao wageDao;

    @Scheduled(cron = "0 0 12 1 * ?")
    private void wage(){
        List<Custom> customs = customDao.getCustoms(new Custom());
        for (Custom custom : customs) {
            logger.info("添加基本工资：" + custom.getCustomname());
            Wage wage = new Wage();
            wage.setAmout(custom.getWage());
            wage.setId(custom.getId());
            wage.setDescription("基本工资");
            wage.setTime(new Date());
            wage.setWageType(1);
            wageDao.insert(wage);
        }
    }
}
