package com.controller;

import com.bean.Member;
import com.model.Page;
import com.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2019/4/8.
 */
@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @RequestMapping("/member")
    public String member(Model model, Member member){
        Page<Member> members = memberService.getMembers(member);
        model.addAttribute("memberList",members);
        model.addAttribute("member",member);
        return "member/member";
    }
    
    @RequestMapping("/memberSign")
    public String sign(){
        return "member/memberSign";
    }
    
    @RequestMapping("/addMember")
    @ResponseBody
    public String addMember(Model model,Member member){
        memberService.addMember(member);
        return member.getId() + "";
    }
    
    @RequestMapping("/editMember")
    public String editMember(Model model,String id){
        Member member = memberService.getMemberById(id);
        model.addAttribute("member",member);
        return "member/memberSign";
    }
    
    @RequestMapping("/updateMember")
    public String updateMember(Model model,Member member){
        memberService.update(member);
        return "redirect:member";
    }

    @RequestMapping("/getAmout")
    @ResponseBody
    public String getAmout(String memberId){
        return memberService.getAmout(memberId);
    }


    @RequestMapping("/getMember")
    @ResponseBody
    public Member getMember(Model model,String telephone){
        Member member = memberService.getMemberByTel(telephone);
        return member;
    }
}
