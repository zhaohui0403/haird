package com.service.impl;

import com.bean.Member;
import com.dao.MemberDao;
import com.model.Page;
import com.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2019/4/8.
 */
@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDao memberDao;

    @Override
    public Page<Member> getMembers(Member member) {
        Page<Member> memberPage = new Page<Member>();

        memberPage.setIndex(member.getIndex());
        memberPage.setSize(member.getSize());

        List<Member> members = memberDao.getMembers(member);
        memberPage.setContext(members);

        int count = memberDao.count(member);
        memberPage.setCount(count);

        return memberPage;
    }

    @Override
    public void addMember(Member member) {
        memberDao.addMember(member);
    }

    @Override
    public Member getMemberById(String id) {
        return memberDao.getMemberById(id);
    }

    @Override
    public void update(Member member) {
        memberDao.update(member);
    }

    @Override
    public String getAmout(String memberId) {
        return memberDao.getAmout(memberId);
    }

    @Override
    public Member getMemberByTel(String telephone) {
        return memberDao.getMemberByTel(telephone);
    }

    @Override
    public boolean checkTel(String telephone) {
        Member memberByTel = memberDao.getMemberByTel(telephone);
        if(memberByTel == null){
            return true;
        }
        return false;
    }
}
