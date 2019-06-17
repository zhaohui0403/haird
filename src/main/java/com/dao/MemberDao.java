package com.dao;

import com.bean.Member;
import com.bean.Recharge;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by Administrator on 2019/4/5.
 */
@Mapper
public interface MemberDao {
    List<Member> getMembers(Member member);
    int count(Member member);

    void addMember(Member member);

    Member getMemberById(String id);

    void update(Member member);

    void charge(Recharge recharge);

    String getAmout(String id);

    Member getMemberByTel(String telephone);

    String getUsernameById(int id);
}
