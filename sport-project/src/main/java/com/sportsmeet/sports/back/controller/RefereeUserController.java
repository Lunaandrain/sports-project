package com.sportsmeet.sports.back.controller;

import com.sportsmeet.sports.back.bean.Referee;
import com.sportsmeet.sports.back.service.RefereeUserService;
import com.sportsmeet.sports.base.bean.ResultVo;
import com.sportsmeet.sports.base.exception.SportsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author XYX
 * @create 2021-11-23-22:38
 * 裁判登录页面和信息页面
 */
@Controller
public class RefereeUserController {

    @Autowired
    private RefereeUserService refereeUserService;

    //返回json串使用此注解
    @ResponseBody
    @RequestMapping("/referee/login")
    public ResultVo login(Referee referee,  HttpSession session){

        ResultVo resultVo = new ResultVo();
        try {
            referee = refereeUserService.login(referee);//service层面来进行检查
            resultVo.setOk(true);
            session.setAttribute("referee",referee);
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    //用户登录成功后跳转到后台首页
    @RequestMapping("/referee/index")
    public String index(){
        //转发
        return "redirect:/referee/index.jsp";
    }
    //登出功能
    @RequestMapping("/referee/loginOut")
    public String loginOut(HttpSession session){
        //清除session中的用户
        session.removeAttribute("team");
        //重定向到登录页面
        return "redirect:/rlogin.jsp";
    }

    /**
     * 异步校验输入的旧密码，如果旧密码错误，鼠标移开时页面则跳出提示
     * @param oldpwd 前端输入的旧密码
     * @param session 从session域中取出已经登录的这个admin对象
     * @return 给客户端返回消息的Bean对象
     */

    //异步校验用户输入的原始密码是否正确
    @RequestMapping("/referee/verifyoldpwd")
    @ResponseBody
    public ResultVo verifyOldPwd(String oldpwd,HttpSession session){
        ResultVo resultVo = new ResultVo();
        try{
            //获取当前登录用户
            Referee referee = (Referee) session.getAttribute("referee");
            refereeUserService.verifyOldPwd(oldpwd,referee);
            resultVo.setOk(true);
        }catch (SportsException e){
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    //异步修改用户信息
    @RequestMapping("referee/updatareferee")
    @ResponseBody
    public ResultVo updateUser(Referee referee){
        ResultVo resultVo = new ResultVo();
        try{
            refereeUserService.updateUser(referee);
            resultVo.setOk(true);
            resultVo.setMess("修改用户信息成功");
        }catch (SportsException e){
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }
}
