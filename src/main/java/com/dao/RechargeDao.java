package com.dao;

import com.bean.Recharge;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by Administrator on 2019/4/5.
 */
@Mapper
public interface RechargeDao {
    void insert(Recharge recharge);

    List<Recharge> getLogs(Integer memberId);

    void del(Integer id);
}
