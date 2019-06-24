package com.service;

import com.bean.CutLog;
import com.bean.Record;
import com.bean.Wage;

import java.util.List;

/**
 * Created by ADMIN on 2019/6/15.
 */
public interface CutLogService {
    void cut(CutLog cutLog, Record record);

    List<CutLog> cutLogs(int id);

    List<CutLog> del(String id);
}
