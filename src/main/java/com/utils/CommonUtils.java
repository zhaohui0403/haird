package com.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2019/4/19.
 */
public class CommonUtils {
    public static Map<String,String> map = new HashMap<String,String>();

    static {
        map.put("0","洗吹造型");
        map.put("1","洗剪吹造型");
        map.put("2","烫发");
        map.put("3","染发");
        map.put("4","烫染");
        map.put("5","外卖");
    }
    public static String getMap(String key){
        return map.get(key);
    }
}
