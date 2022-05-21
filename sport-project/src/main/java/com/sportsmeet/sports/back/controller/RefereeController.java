package com.sportsmeet.sports.back.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sportsmeet.sports.back.bean.*;
import com.sportsmeet.sports.back.service.RefereeService;
import com.sportsmeet.sports.base.bean.ResultVo;
import com.sportsmeet.sports.base.exception.SportsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import java.util.List;
import org.springframework.web.bind.annotation.RequestBody;
import java.util.ArrayList;
/**
 * @author XYX
 * @create 2021-11-24-16:05
 *裁判页面
 * 主要功能：显示赛程；裁判员打分；裁判长确认分数
 */
@Controller
public class RefereeController {
    @Autowired
    private RefereeService refereeService;

    /**
     * 显示所有赛程
     * @param page
     * @param pageSize
     * @return
     */
    @ResponseBody
    @RequestMapping("/referee/showmatch")
    public PageInfo<MatchSchdule> listMatchSchdule(int page,int pageSize){
        PageHelper.startPage(page,pageSize);
        List<MatchSchdule> matchSchdules = refereeService.listMatchSchdule();
        PageInfo<MatchSchdule> pageInfo = new PageInfo<>(matchSchdules);
        return pageInfo;
    }

    @ResponseBody
    @RequestMapping("/referee/saveathlete")
    public ResultVo login(Athlete athlete, HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            resultVo.setOk(true);
            session.setAttribute("athlete",athlete);
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    @ResponseBody
    @RequestMapping("/referee/savematch")
    public ResultVo login(MatchSchdule match, HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            resultVo.setOk(true);
            session.setAttribute("match",match);
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    /**
     * 显示这个赛程中所有的运动员
     * @param page
     * @param pageSize
     * @param g_id 赛程的主键
     * @return
     * athletes的t_id可直接显示t_name的值
     */
    @ResponseBody
    @RequestMapping("/referee/matchathlete")
    public PageInfo<Athlete> listAthlete(int page,int pageSize,String g_id){
        PageHelper.startPage(page,pageSize);
        List<Athlete> athletes = refereeService.listAthlete(g_id);
        PageInfo<Athlete> pageInfo = new PageInfo<>(athletes);
        return pageInfo;
    }

    @ResponseBody
    @RequestMapping("/referee/matchathlete2")
    public PageInfo<Athlete> listAthlete2(int page,int pageSize,String g_id){
        PageHelper.startPage(page,pageSize);
        List<Athlete> athletes = refereeService.listAthlete2(g_id);
        PageInfo<Athlete> pageInfo = new PageInfo<>(athletes);
        return pageInfo;
    }

    @ResponseBody
    @RequestMapping("/referee/saveath")
    public ResultVo ath(String a_id,String t_id ,String age_id ,HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            resultVo.setOk(true);
            session.setAttribute("a_id",a_id);
            session.setAttribute("t_id",t_id);
            session.setAttribute("age_id",age_id);
        } catch (SportsException e) {
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }



    /**
     * 裁判对某个赛程中的某个运动员打分
     * @param score 裁判输入分数degree，score包含a_id,r_id,degree,match_type,g_id,t_id,p_id存入数据库score表中
     * @return
     * 一个项目（project）必须有五个裁判，每个人都要打分
     */
    @ResponseBody
    @RequestMapping("/referee/score")
    public ResultVo grade(Score score, HttpSession session){
        ResultVo resultVo = new ResultVo();
        Referee referee =(Referee)session.getAttribute("referee");
        score.setR_id(referee.getR_id());
        refereeService.grade(score);
        resultVo.setOk(true);
        resultVo.setMess("打分成功");
        return resultVo;
    }

    /**
     * 打分完毕后，点击显示某场比赛某个运动员的5个分数
     * @param a_id
     * @param g_id
     * @return
     */
    @ResponseBody
    @RequestMapping("/referee/showscore")
    public List<Score> listGrade(String a_id,String g_id){
        List<Score> scores = refereeService.listGrade(a_id,g_id);
        return scores;
    }

    /**
     * 裁判长确认得分，自动计算最终分数finalscore
     * @param finalScore
     * @return
     * 5个裁判任选一个当裁判长，确认之后将成绩录取finalscore表中
     *
     */
    @ResponseBody
    @RequestMapping("/referee/gradecheck")
    public ResultVo gradeChecked(FinalScore finalScore){
        ResultVo resultVo = new ResultVo();
        refereeService.gradeChecked(finalScore);
        resultVo.setOk(true);
        resultVo.setMess("成绩录入成功");
        return resultVo;
    }


    


}
