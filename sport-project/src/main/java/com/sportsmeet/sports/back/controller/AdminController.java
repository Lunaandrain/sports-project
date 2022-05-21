package com.sportsmeet.sports.back.controller;

import com.sportsmeet.sports.back.bean.Admin;
import com.sportsmeet.sports.back.service.AdminService;
import com.sportsmeet.sports.base.bean.ResultVo;
import com.sportsmeet.sports.base.exception.SportsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author XYX
 * @create 2021-11-23-0:13
 * 管理员页面
 * 主要功能：管理员登录、登出；异步修改用户信息
 */
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;
    /**
     * 登录校验
     * @param admin 前端输入的账号username密码password封装成admin对象
     * @param session 登录成功则讲管理员信息存在session域中
     * @return resultVo 返回给客户端返回消息的Bean对象
     */
    @ResponseBody
    @RequestMapping("/admin/login")
    public ResultVo login(Admin admin, HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            admin = adminService.login(admin);
            resultVo.setOk(true);
            session.setAttribute("admin",admin);
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    //用户登录成功后跳转到后台首页

    @RequestMapping("/admin/index")
    public String index(){
        //转发
        return "redirect:/admin/index.jsp";
    }


    //登出功能
    @RequestMapping("/admin/loginOut")
    public String loginOut(HttpSession session){
        //清除session中的用户
        session.removeAttribute("admin");
        //重定向到登录页面
        return "redirect:/login.jsp";
    }

    /**
     * 异步校验输入的旧密码，如果旧密码错误，鼠标移开时页面则跳出提示
     * @param oldpwd 前端输入的旧密码
     * @param session 从session域中取出已经登录的这个admin对象
     * @return 给客户端返回消息的Bean对象
     */

    @ResponseBody
    @RequestMapping("/admin/verifyoldpwd")
    public ResultVo verifyOldPwd(String oldpwd,HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            Admin admin = (Admin) session.getAttribute("admin");
            adminService.verifyOldPwd(oldpwd,admin);
            resultVo.setOk(true);
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    /**
     * 异步更新admin对象的信息
     * @param admin 前端传入的除id以外所有的用户信息
     * @return 给客户端返回消息的Bean对象
     */
    @ResponseBody
    @RequestMapping("admin/updataadmin")
    public ResultVo updateAdmin(Admin admin){

        ResultVo resultVo = new ResultVo();
        try {
            adminService.updateAdmin(admin);
            resultVo.setOk(true);
            resultVo.setMess("修改用户信息成功");
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }



}
