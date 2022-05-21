package com.sportsmeet.sports.back.service.impl;

import com.sportsmeet.sports.back.bean.*;
import com.sportsmeet.sports.back.mapper.*;
import com.sportsmeet.sports.back.service.MatchSchduleService;
import com.sportsmeet.sports.base.exception.SportsEnum;
import com.sportsmeet.sports.base.exception.SportsException;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import org.apache.log4j.Category;
import java.util.List;

/**
 * @author XYX
 * @create 2021-11-23-14:01
 */
@Service
public class MatchSchduleServiceImpl implements MatchSchduleService {

    @Autowired
    private MatchSchduleMapper matchSchduleMapper;
    @Autowired
    private AgeMapper ageMapper;
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private AthleteMapper athleteMapper;
    @Autowired
    private TeamMapper teamMapper;
    @Autowired
    private FinalScoreMapper finalScoreMapper;

    @Override

    public List<MatchSchdule> list() {
        List<MatchSchdule> matchSchdules = matchSchduleMapper.selectAll();

        return matchSchdules;


    }



    @Override
    public List<Age> queryAge() {
        List<Age> ages = ageMapper.selectAll();
        return ages;
    }

    @Override
    public List<Project> queryProject() {
        return projectMapper.selectAll();
    }

    @Override
    public MatchSchdule save(MatchSchdule matchSchdule) {
        Age age = ageMapper.selectByPrimaryKey(matchSchdule.getAge_id());
        matchSchdule.setAge_name(age.getAge_name());

        Project project = projectMapper.selectByPrimaryKey(matchSchdule.getP_id());
        matchSchdule.setP_name(project.getP_name());
        int count = matchSchduleMapper.insertSelective(matchSchdule);
        if(count == 0){
            throw new SportsException(SportsEnum.MATCHSCHDULE_SAVE);
        }

        return matchSchdule;

    }

    @Override
    public void deleteById(String g_id) {
        int count = matchSchduleMapper.deleteByPrimaryKey(g_id);
        if(count == 0){
            throw new SportsException(SportsEnum.MATCHSCHDULE_DELETE);
        }
    }

    @Override
    public List<Athlete> listById(String g_id) {
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
    public void deleteAthlete(String a_id) {
        Athlete athlete = new Athlete();
        athlete.setA_id(a_id);
        athlete.setG_id("0");
        athleteMapper.updateByPrimaryKeySelective(athlete);
    }

    @Override
    public List<Athlete> listAthlete(String age_id) {
        Example example = new Example(Athlete.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("age_id",age_id);
        List<Athlete> athletes = athleteMapper.selectByExample(example);

        for(Athlete athlete:athletes){
            String t_id = athlete.getT_id();
            Team team = teamMapper.selectByPrimaryKey(t_id);
            athlete.setT_id(team.getT_name());
        }
        return athletes;
    }

    @Override
    public void addAthlete(Athlete athlete) {
        int count = athleteMapper.updateByPrimaryKeySelective(athlete);
        if (count == 0){
            throw new SportsException(SportsEnum.MATCHSCHDULE_ADD);
        }
    }

    @Override
    public void addFinalMatch(MatchSchdule matchSchdule) {

        Age age = ageMapper.selectByPrimaryKey(matchSchdule.getAge_id());
        matchSchdule.setAge_name(age.getAge_name());
        Project project = projectMapper.selectByPrimaryKey(matchSchdule.getP_id());
        matchSchdule.setP_name(project.getP_name());
        matchSchduleMapper.insertSelective(matchSchdule);
        String g_id = matchSchdule.getG_id();

        Example example = new Example(FinalScore.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("p_id", matchSchdule.getP_id())
                .andEqualTo("age_id", matchSchdule.getAge_id());
        example.setOrderByClause("finaldegree desc");

        RowBounds rb=new RowBounds(0,8);

        List<FinalScore> finalScores = finalScoreMapper.selectByExampleAndRowBounds(example,rb);

        for (int i = 0;i< finalScores.size();i++){
            Athlete athlete = new Athlete();
            athlete.setA_id(finalScores.get(i).getA_id());
            athlete.setG_id(g_id);
            athleteMapper.updateByPrimaryKeySelective(athlete);
        }
    }

}
