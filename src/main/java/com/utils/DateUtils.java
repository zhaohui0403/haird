package com.utils;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Administrator on 2019/4/11.
 */
public class DateUtils {
    public static Date getTheDayStartDate(){
        LocalDate localDate = LocalDate.now();
        Date date = Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
        return date;
    }
    public static Date getTomoStartDate(){
        LocalDate localDate = LocalDate.now().plusDays(1);
        Date date = Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
        return date;
    }

    public static Date getStartDate(){
        LocalDate localDate = LocalDate.parse("2019-01-01");
        Date date = Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
        return date;
    }
    public static String getDate(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String format = simpleDateFormat.format(new Date());
        return format;
    }

    public static Date getYearStartDate(){
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.MONTH,0);
        calendar.set(Calendar.DAY_OF_MONTH,1);
        Date time = calendar.getTime();
        return time;
    }
}
