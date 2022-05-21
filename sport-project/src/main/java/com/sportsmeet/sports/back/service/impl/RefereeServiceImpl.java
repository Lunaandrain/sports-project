package com.sportsmeet.sports.back.service.impl;

import com.sportsmeet.sports.back.bean.*;
import com.sportsmeet.sports.back.mapper.*;
import com.sportsmeet.sports.back.service.RefereeService;
import com.sportsmeet.sports.base.exception.SportsEnum;
import com.sportsmeet.sports.base.exception.SportsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.ArrayList;
/**
 * @author XYX
 * @create 2021-11-24-16:43
 */
@Service
public class RefereeServiceImpl implements RefereeService {

    @Autowired
    private TeamMapper teamMapper;
    @Autowired
    private AthleteMapper athleteMapper;
    @Autowired
    private AgeMapper ageMapper;
    @Autowired
    private MatchSchduleMapper matchSchduleMapper;
    @Autowired
    private ScoreMapper scoreMapper;
    @Autowired
    private FinalScoreMapper finalScoreMapper;


    @Override
    public List<MatchSchdule> listMatchSchdule() {

        List<MatchSchdule> matchSchdules = matchSchduleMapper.selectAll();
        return matchSchdules;
    }

    @Override
    public List<Athlete> listAthlete(String g_id) {
        Example example = new Example(Athlete.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("g_id",g_id);

        List<Athlete> athletes = athleteMapper.selectByExample(example);

        for(Athlete athlete:athletes){
            String t_id = athlete.getT_id();
            Team team = teamMapper.selectByPrimaryKey(t_id);
            athlete.setT_id(team.getT_name());
        }

        return athletes;
    }

    @Override
    public List<Athlete> listAthlete2(String g_id) {
        Example example = new Example(Athlete.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("g_id",g_id);

        List<Athlete> athletes = athleteMapper.selectByExample(example);

        for(Athlete athlete:athletes){
        }

        return athletes;
    }

    @Override
    public void grade(Score score) {
        scoreMapper.insertSelective(score);
    }

    @Override
    public List<Score> listGrade(String a_id, String g_id) {
        Example example = new Example(Score.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("a_id",a_id)
                .andEqualTo("g_id",g_id);
        List<Score> scores = scoreMapper.selectByExample(example);
        return scores;
    }

    @Override
    public void gradeChecked(FinalScore finalScore) {
        int count = finalScoreMapper.insertSelective(finalScore);
        if(count == 0){
            throw new SportsException(SportsEnum.REFEREE_GRADE);
        }
    }
}
