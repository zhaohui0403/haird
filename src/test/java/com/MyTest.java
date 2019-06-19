package com;

import com.bean.HairdCard;
import org.junit.Test;

import java.util.Date;

/**
 * Created by ADMIN on 2019/6/10.
 */
public class MyTest {
    @Test
    public void test(){
        HairdCard hairdCard = new HairdCard();
        Date startTime = hairdCard.getStartTime();
        System.out.println(startTime);
    }
}
