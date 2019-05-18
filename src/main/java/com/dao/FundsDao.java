package com.dao;

import com.bean.Funds;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2019/4/14.
 */
@Mapper
public interface FundsDao {
    void add(Funds funds);

    void del(Integer id);

    List<Funds> getFunds(@Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("status") List<Integer> status);

    String getAmout(@Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("status") List<Integer> status);

    void update(Funds funds);
}
