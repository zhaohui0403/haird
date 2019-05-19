package com.service;

import com.bean.Member;
import com.model.Page;

/**
 * Created by Administrator on 2019/4/8.
 */
public interface MemberService {
    Page<Member> getMembers(Member member);

    void addMember(Member member);

    Member getMemberById(String id);

    void update(Member member);

    String getAmout(String memberId);

    Member getMemberByTel(String telephone);

    boolean checkTel(String telephone);
}
