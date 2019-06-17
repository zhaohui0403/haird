package com.dao;

import com.bean.CutLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by ADMIN on 2019/6/15.
 */
@Mapper
public interface CutLogDao {
    void add(CutLog cutLog);

    List<CutLog> getCutLogs(String cardId);
}
