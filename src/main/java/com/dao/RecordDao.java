package com.dao;

import com.bean.Record;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by Administrator on 2019/4/5.
 */
@Mapper
public interface RecordDao {
    List<Record> getRecords(Record record);

    int count(Record record);

    Record getRecordById(Integer id);

    void insertRecord(Record record);

    void del(Integer id);
}
