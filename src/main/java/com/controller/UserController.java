package com.controller;

import com.bean.User;
import com.google.gson.Gson;
import com.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.security.util.Password;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2019/4/3.
 */
@Controller
public class UserController {
    Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/submit")
    public String test(Model model,HttpServletRequest request, HttpServletResponse response, User user) throws Exception{
        User bean = userService.getUserByUsername(user.getUsername());
        if(bean == null){
            model.addAttribute("status","0");
            model.addAttribute("msg","不存在该用户！");
            return "login";
        }else if (!bean.getPassword().equals(user.getPassword()) ){
            model.addAttribute("status",0);
            model.addAttribute("msg","密码错误！");
            return "login";
        }
        HttpSession session = request.getSession();
        session.setAttribute("user",user);
        return "redirect:main";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response) throws Exception{
        return "login";
    }

    @RequestMapping("/checkPass")
    @ResponseBody
    public Map checkUser(HttpServletRequest request, Model model,User user){
        Map<String,Object> map = new HashMap<String, Object>();
        logger.info("校验密码："+new Gson().toJson(user));
        boolean flag = userService.check(user);
        map.put("valid",flag);
        return map;
    }

    @RequestMapping("/update")
    public String update(HttpServletRequest request, Model model, User user){
        userService.update(user);
        if("user".equals(user.getUsername())){
            return "redirect:right";
        }
        request.getSession().removeAttribute("user");
        return "redirect:right";
    }

    @RequestMapping("/loginChange")
    public String loginChange(HttpServletRequest request,Model model){
        User user = (User)request.getSession().getAttribute("user");
        model.addAttribute("username",user.getUsername());
        return "/user/changePass";
    }

    @RequestMapping("/powerChange")
    public String powerChange(HttpServletRequest request,Model model){
        model.addAttribute("username","user");
        return "/user/changePass";
    }
}
