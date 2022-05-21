package com.sportsmeet.sports.back.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sportsmeet.sports.back.bean.Age;
import com.sportsmeet.sports.back.bean.Athlete;
import com.sportsmeet.sports.back.bean.MatchSchdule;
import com.sportsmeet.sports.back.bean.Project;
import com.sportsmeet.sports.back.service.MatchSchduleService;
import com.sportsmeet.sports.base.bean.ResultVo;
import com.sportsmeet.sports.base.exception.SportsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author XYX
 * @create 2021-11-23-14:00
 * 管理员管理的赛程页面
 * 主要功能：赛程管理；运动员管理
 */
@Controller
public class MatchSchduleController {
    @Autowired
    private MatchSchduleService matchSchduleService;

    /**
     * 分页显示和按赛程名字查询matchschdule数据库中所有赛程(包括初赛和决赛)
     * @param page 前端传入的页码初始化信息
     * @param pageSize 前端传入的页面记录初始化信息
     * @return 返回
     * 前端页面显示g_id,age_name,p_name,match_type
     */


//
    @ResponseBody
    @RequestMapping("/match/list")
    public PageInfo<MatchSchdule> list(int page,int pageSize){


        //参数1:当前页码 参数2:每页记录数 pageSize 该方法等同于 limit a,b
        PageHelper.startPage(page,pageSize);
        List<MatchSchdule> matchSchdules = matchSchduleService.list();
        PageInfo<MatchSchdule> pageInfo = new PageInfo<>(matchSchdules);
        return pageInfo;

    }

    /**
     * 下拉框显示所有的年龄信息，选择其中一个传给save方法
     * @return
     */
    @ResponseBody
    @RequestMapping("/match/age")
    public List<Age> queryAge(){
        List<Age> ages = matchSchduleService.queryAge();
        return ages;
    }

    /**
     * 下拉框选择所有的项目信息，选择一个传给save方法
     * @return
     */
    @ResponseBody
    @RequestMapping("/match/project")
    public List<Project> queryProject(){
        List<Project> projects = matchSchduleService.queryProject();
        return projects;
    }

    /**
     *添加初赛
     * @param matchSchdule 传入下拉框中的age_id,p_id,match_type自动定义为初赛，g_id数据库自增
     *                     p_name,age_name在service层自动赋值
     * @return
     *一组比赛最好是8个人
     */
    @ResponseBody
    @RequestMapping("/match/addchusai")
    public ResultVo save(MatchSchdule matchSchdule){
        ResultVo resultVo = new ResultVo();
        try {
            matchSchdule.setMatch_type("初赛");
            matchSchduleService.save(matchSchdule);
            resultVo.setOk(true);
            resultVo.setMess("添加初赛成功");
        } catch (SportsException e) {
           resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    /**
     * 删除比赛
     * @param g_id 当前选中的赛程的g-id
     * @return
     */
    @ResponseBody
    @RequestMapping("/match/deletematch")
    public ResultVo deleteById(String g_id){
        ResultVo resultVo = new ResultVo();
        try {
            matchSchduleService.deleteById(g_id);
            resultVo.setOk(true);
            resultVo.setMess("删除赛程成功");
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    @ResponseBody
    @RequestMapping("/match/savegidageid")
    public ResultVo login(String g_id, String age_id,HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            resultVo.setOk(true);
            session.setAttribute("g1_id",g_id);
            session.setAttribute("age1_id",age_id);
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }
    /**
     * 点击赛程，根据g_id显示在本场比赛的运动员
     * 一个运动员只有一个g_id，会被覆盖，因此一个运动员比试完一场之后才可以录入其他比赛
     * @param page
     * @param pageSize
     * @param g_id 当前点击的赛程的g_id
     * @return
     * 前端显示的t_id直接显示t_name的值
     */
    @ResponseBody
    @RequestMapping("/match/showath")
    public PageInfo<Athlete> listById(int page,int pageSize,String g_id){
        PageHelper.startPage(page,pageSize);
        List<Athlete> athletes = matchSchduleService.listById(g_id);
        PageInfo<Athlete> pageInfo = new PageInfo<>(athletes);
        return pageInfo;
    }
    /**
     * 删除本场比赛的运动员
     * @param a_id 当前选择的运动员的a_id
     * @return
     * 在athlete中这个运动员还存在，只是g_id被设置成了0
     */
    @ResponseBody
    @RequestMapping("/match/deleteath")
    public ResultVo deleteAthlete(String a_id){
        ResultVo resultVo = new ResultVo();
        matchSchduleService.deleteAthlete(a_id);
        resultVo.setOk(true);
        resultVo.setMess("删除运动员成功");
        return resultVo;
    }
    /**
     * 在本次赛程的“添加运动员”中，显示有资格参与这次比赛的运动员
     * @param page
     * @param pageSize
     * @param age_id matchschdule的age_id
     * @return
     * 运动员的t_id直接显示t_name的值
     */
    @ResponseBody
    @RequestMapping("/match/listath")
    public PageInfo<Athlete> listAthlete(int page,int pageSize,String age_id){
        PageHelper.startPage(page,pageSize);
        List<Athlete> athletes = matchSchduleService.listAthlete(age_id);
        PageInfo<Athlete> pageInfo = new PageInfo<>(athletes);
        return pageInfo;
    }
    /**
     * 对本场比赛添加运动员，点击listAthlete中列出的运动员后的“添加”完成操作
     * @param athlete 传入athlete的a_id,matchschdule的g_id封装成athlete对象，
     * @return
     * athlete表中运动员数量没有增加，但是g_id更改了
     */
    @ResponseBody
    @RequestMapping("/match/addath")
    public ResultVo addAthlete(Athlete athlete){
        ResultVo resultVo = new ResultVo();
        try {
            matchSchduleService.addAthlete(athlete);
            resultVo.setOk(true);
            resultVo.setMess("添加运动员成功");
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }
    /**
     * 添加决赛
     * @param matchSchdule 下拉选择出age_id,p_id,service层自动完成matchschdule的创建以及决赛人员的添加
     * @return
     * 决赛人员由初赛finalscore的前8名组成，athlete数据库更新g_id
     */
    @ResponseBody
    @RequestMapping("/match/addfinal")
    public ResultVo addFinalMatch(MatchSchdule matchSchdule){
        ResultVo resultVo = new ResultVo();
        matchSchdule.setMatch_type("决赛");
        matchSchduleService.addFinalMatch(matchSchdule);
        resultVo.setOk(true);
        resultVo.setMess("添加决赛成功");
        return resultVo;
    }
}
