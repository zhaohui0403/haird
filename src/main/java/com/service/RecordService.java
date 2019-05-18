package com.service;

import com.bean.Record;
import com.model.Page;

/**
 * Created by Administrator on 2019/4/16.
 */
public interface RecordService {
    public Page<Record> getRecords(Record record);

    Record getRecordById(Integer id);

    void bill(Record record);

    void del(Integer id);
}
