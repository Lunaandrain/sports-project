package com.sportsmeet.sports.back.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sportsmeet.sports.back.bean.*;
import com.sportsmeet.sports.back.service.TeamService;
import com.sportsmeet.sports.base.bean.ResultVo;
import com.sportsmeet.sports.base.exception.SportsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author XYX
 * @create 2021-11-23-23:49
 * 代表队页面
 * 主要功能：显示赛程；录人运动员、领队、队医信息；查看比赛排名和成绩
 */
@Controller
public class TeamController {

    @Autowired
    private TeamService teamService;

    /**
     * 显示当前队伍的所有的运动员
     * @param page
     * @param pageSize
     * @param a_name 搜索框传入，如果不为空，则按名字搜索出运动员的信息
     * @param session 从session域中取出t_id
     * @return
     * age_id显示的值替换成了age_name的值
     */
    @ResponseBody
    @RequestMapping("/team/showathlete")
    public PageInfo<Athlete> listAthlete(int page, int pageSize, String a_name, HttpSession session){
        Team team = (Team)session.getAttribute("team");
        PageHelper.startPage(page,pageSize);
        List<Athlete> athletes = teamService.listAthlete(team.getT_id(),a_name);
        PageInfo<Athlete> pageInfo =new PageInfo<>(athletes);
        return pageInfo;
    }

    /**
     * 删除运动员
     * @param a_id
     * @return
     */
    @ResponseBody
    @RequestMapping("team/deleteathlete")
    public ResultVo deleteById(String a_id) {
        ResultVo resultVo = new ResultVo();
        try {
            teamService.deleteById(a_id);
            resultVo.setOk(true);
            resultVo.setMess("删除运动员成功");
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    /**
     * 年龄下拉框
     * @return
     */
    @ResponseBody
    @RequestMapping("team/chooseage")
    public List<Age> queryAge(){
        List<Age> ages = teamService.queryAge();
        return ages;
    }

    /**
     *
     * @param athlete 下拉框选择age（age_id)，手动输入运动员姓名a_name和age_sex封装成athlete对象
     * @param session
     * @return
     * t_name则自动赋值为当前登录队伍的t_id
     * 运动员的id自动赋值，男奇数，女偶数
     */
    @ResponseBody
    @RequestMapping("/team/addathlete")
    public ResultVo addAthlete(Athlete athlete,HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            Team team = (Team)session.getAttribute("team");
            athlete.setT_id(team.getT_id());
            teamService.addAthlete(athlete);
            resultVo.setOk(true);
            resultVo.setMess("添加运动员成功");
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }
//
    /**
     * 显示本组的领队
     * @param page
     * @param pageSize
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/team/showleader")
    public PageInfo<Leader> listLeader(int page,int pageSize,HttpSession session){
        Team team = (Team) session.getAttribute("team");
        PageHelper.startPage(page,pageSize);
        List<Leader> leaders = teamService.listLeader(team.getT_id());
        PageInfo<Leader> pageInfo = new PageInfo<>(leaders);
        return pageInfo;
    }
//
    /**
     * 增加本组领队
     * @param leader 手动输入leader的l_name,l_phone,l_identity
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/team/addleader")
    public ResultVo addLeader(Leader leader,HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            Team team = (Team) session.getAttribute("team");
            leader.setT_id(team.getT_id());
            teamService.addLeader(leader);
            resultVo.setOk(true);
            resultVo.setMess("添加领队成功");
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }
//
    /**
     * 根据选中的领队进行删除操作
     * @param l_id
     * @return
     */
    @ResponseBody
    @RequestMapping("/team/deleteleader")
    public ResultVo deleteLeader(String l_id){
        ResultVo resultVo = new ResultVo();
        try {
            teamService.deleteLeader(l_id);
            resultVo.setOk(true);
            resultVo.setMess("删除领队成功");
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }
//
    /**
     * doctor和leader的方法执行效果一样
     * @param page
     * @param pageSize
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/team/showdoctor")
    public PageInfo<Doctor> listDoctor(int page, int pageSize, HttpSession session){
        Team team = (Team) session.getAttribute("team");
        PageHelper.startPage(page,pageSize);
        List<Doctor> doctors = teamService.listDoctor(team.getT_id());
        PageInfo<Doctor> pageInfo = new PageInfo<>(doctors);
        return pageInfo;
    }

    @ResponseBody
    @RequestMapping("/team/adddoctor")
    public ResultVo addDoctor(Doctor doctor,HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            Team team = (Team) session.getAttribute("team");
            doctor.setT_id(team.getT_id());
            teamService.addDoctor(doctor);
            resultVo.setOk(true);
            resultVo.setMess("添加队医成功");
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    @ResponseBody
    @RequestMapping("team/deletedoctor")
    public ResultVo deleteDoctor(String d_id){
        ResultVo resultVo = new ResultVo();
        try {
            teamService.deleteDoctor(d_id);
            resultVo.setOk(true);
            resultVo.setMess("删除队医成功");
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }
//
    /**
     * 在Team界面显示所有的赛程
     * @param page
     * @param pageSize
     * @return
     */
    @ResponseBody
    @RequestMapping("/team/showmatch")
    public PageInfo<MatchSchdule> listMatchSchdule(int page,int pageSize){
        PageHelper.startPage(page,pageSize);
        List<MatchSchdule> matchSchdules = teamService.listMatchSchdule();
        PageInfo<MatchSchdule> pageInfo = new PageInfo<>(matchSchdules);
        return pageInfo;
    }

    @ResponseBody
    @RequestMapping("/team/savegid")
    public ResultVo login(String g_id, HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            resultVo.setOk(true);
            session.setAttribute("g_id",g_id);
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    /**
     * 查看选中的赛程里的参赛人员
     * @param page
     * @param pageSize
     * @param g_id 传入选中的赛程的g_id，返回athletes，
     * @return
     * 返回的t_id直接显示t_name的值
     */
    @ResponseBody
    @RequestMapping("/team/matchathlete")
    public PageInfo<Athlete> showMatchDetails(int page,int pageSize,String g_id){
        PageHelper.startPage(page,pageSize);
        List<Athlete> athletes = teamService.showMatchDetails(g_id);
        PageInfo<Athlete> pageInfo = new PageInfo<>(athletes);
        return pageInfo;
    }

    /**
     * 查看决赛的排名，按分数降序排序
     * @param  p_id，age_id 手动输入(没想好)
     * @return 返回的finalscores中的a_id p_id age_id都替换成了可见的name
     */
    @ResponseBody
    @RequestMapping("/team/rankfinal")
    public List<FinalScore> finalRankingSingle(String p_id,String age_id){
        List<FinalScore> finalScores = teamService.finalRankingSingle(p_id,age_id);
        return finalScores;
    }

    @ResponseBody
    @RequestMapping("/team/saveageid")
    public ResultVo login2(String age_id, HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            resultVo.setOk(true);
            session.setAttribute("age2_id",age_id);
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    @ResponseBody
    @RequestMapping("/team/savepid")
    public ResultVo login3(String p_id, HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            resultVo.setOk(true);
            session.setAttribute("p2_id",p_id);
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }





    /**
     * 根据年龄组，找到对应运动员并计算他们的全能成绩，按照成绩降序排序
     * @param age_id
     * @return
     * 只需要显示ahlete的名字和alldegree
     */
    @ResponseBody
    @RequestMapping("/team/athgrade")
    public List<Athlete> individualAllAround(String age_id){
        List<String> list = teamService.findAid(age_id);
        teamService.calculateDegree(list);
        List<Athlete> athletes = teamService.individualAllAround(age_id);
        return athletes;
    }

    /**
     * 根据年龄组，找到每个队伍的团体总成绩，按成绩高低排序
     * @param age_id
     * @return
     * 表teamdegree里的值为团体成绩
     */
    @ResponseBody
    @RequestMapping("/team/teamgrade")
    public List<TeamDegree> teamDegree(String age_id){
        List<String> list = teamService.findTid(age_id);
        teamService.calculateTeamDegree(list,age_id);
        List<TeamDegree> teamDegrees = teamService.teamDegree(age_id);
        return  teamDegrees;
    }



}
