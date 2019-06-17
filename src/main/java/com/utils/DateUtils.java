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
    //获取当前时间
    public static Date getTheDayStartDate(){
        LocalDate localDate = LocalDate.now();
        Date date = Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
        return date;
    }
    //获取明天时间
    public static Date getTomoStartDate(){
        LocalDate localDate = LocalDate.now().plusDays(1);
        Date date = Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
        return date;
    }
    //当前时间
    public static String getDate(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String format = simpleDateFormat.format(new Date());
        return format;
    }
    //获取当年开始时间
    public static Date getYearStartDate(){
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.MONTH,0);
        calendar.set(Calendar.DAY_OF_MONTH,1);
        Date time = calendar.getTime();
        return time;
    }
    //获取当月开始时间
    public static Date getMonthDate(){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.MONTH,calendar.get(Calendar.MONTH));
        calendar.set(Calendar.DAY_OF_MONTH,1);
        Date time = calendar.getTime();
        return time;
    }

}
