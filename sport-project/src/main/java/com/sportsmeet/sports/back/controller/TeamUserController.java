package com.sportsmeet.sports.back.controller;

import com.sportsmeet.sports.back.bean.Team;
import com.sportsmeet.sports.back.service.TeamUserService;
import com.sportsmeet.sports.base.bean.ResultVo;
import com.sportsmeet.sports.base.exception.SportsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author XYX
 * @create 2021-11-23-22:18
 * 代表队登录界面和用户信息界面
 */
@Controller
public class TeamUserController {
    @Autowired
    private TeamUserService teamUserService;

    //返回json串使用此注解
    @ResponseBody
    @RequestMapping("team/login")
    public ResultVo login(Team team, HttpSession session){

        ResultVo resultVo = new ResultVo();
        try {
            team = teamUserService.login(team);//service层面来进行检查
            resultVo.setOk(true);
            session.setAttribute("team",team);
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    //用户登录成功后跳转到后台首页
    @RequestMapping("/team/index")
    public String index(){
        //转发
        return "redirect:/team/index.jsp";
    }



    //登出功能
    @RequestMapping("/team/loginOut")
    public String loginOut(HttpSession session){
        //清除session中的用户
        session.removeAttribute("team");
        //重定向到登录页面
        return "redirect:/tlogin.jsp";
    }

    //异步校验用户输入的原始密码是否正确
    @RequestMapping("/team/verifyoldpwd")
    @ResponseBody
    public ResultVo verifyOldPwd(String oldpwd,HttpSession session){
        ResultVo resultVo = new ResultVo();
        try{
            //获取当前登录用户
            Team team = (Team) session.getAttribute("team");
            teamUserService.verifyOldPwd(oldpwd,team);
            resultVo.setOk(true);
        }catch (SportsException e){
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    //异步修改用户信息
    @RequestMapping("team/updatateam")
    @ResponseBody
    public ResultVo updateUser(Team team){
        ResultVo resultVo = new ResultVo();
        try{
            teamUserService.updateUser(team);
            resultVo.setOk(true);
            resultVo.setMess("修改用户信息成功");
        }catch (SportsException e){
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }


}
