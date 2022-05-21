package com.sportsmeet.sports.back.service.impl;

import com.sportsmeet.sports.back.bean.*;
import com.sportsmeet.sports.back.mapper.*;
import com.sportsmeet.sports.back.service.TeamService;
import com.sportsmeet.sports.base.exception.SportsEnum;
import com.sportsmeet.sports.base.exception.SportsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

/**
 * @author XYX
 * @create 2021-11-23-23:54
 */
@Service
public class TeamServiceImpl implements TeamService {

    @Autowired
    private TeamMapper teamMapper;
    @Autowired
    private AthleteMapper athleteMapper;
    @Autowired
    private AgeMapper ageMapper;
    @Autowired
    private LeaderMapper leaderMapper;
    @Autowired
    private DoctorMapper doctorMapper;
    @Autowired
    private MatchSchduleMapper matchSchduleMapper;
    @Autowired
    private FinalScoreMapper finalScoreMapper;
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private TeamDegreeMapper teamDegreeMapper;

    @Override
    public List<Athlete> listAthlete(String t_id, String a_name) {
        Example example = new Example(Athlete.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("t_id", t_id);
        if (a_name != null && !a_name.equals("")) {
            criteria.andLike("a_name", "%" + a_name + "%");
        }

        List<Athlete> athletes = athleteMapper.selectByExample(example);

        for (Athlete athlete : athletes) {
            String age_id = athlete.getAge_id();
            Age age = ageMapper.selectByPrimaryKey(age_id);
            athlete.setAge_id(age.getAge_name());
        }
        return athletes;
    }

    @Override
    public void deleteById(String a_id) {
        int count = athleteMapper.deleteByPrimaryKey(a_id);
        if (count == 0) {
            throw new SportsException(SportsEnum.TEAM_DELETE);
        }
    }

    public boolean isPrimeNum(String id) {
        int num = Integer.parseInt("id");
        if (num % 2 == 0) {
            return false;
        } else
            return true;
    }

    @Override
    public List<Age> queryAge() {
        return ageMapper.selectAll();
    }

    @Override
    public Athlete addAthlete(Athlete athlete) {

        int count = athleteMapper.insert(athlete);
        if (count == 0) {
            throw new SportsException(SportsEnum.MATCHSCHDULE_ADD);
        }

        String a_id = athlete.getA_id();

        if (athlete.getAge_sex() == "女" && isPrimeNum(a_id)) {
            int num = Integer.parseInt(a_id) + 1;
            String new_id = String.valueOf(num);
            athlete.setA_id(new_id);
        } else if (athlete.getAge_sex() == "男" && !isPrimeNum(a_id)) {
            int num = Integer.parseInt(a_id) + 1;
            String new_id = String.valueOf(num);
            athlete.setA_id(new_id);
        }

        return athlete;
    }

    @Override
    public List<Leader> listLeader(String t_id) {
        Example example = new Example(Leader.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("t_id", t_id);
        List<Leader> leaders = leaderMapper.selectByExample(example);

        for (Leader leader : leaders) {
            Team team = teamMapper.selectByPrimaryKey(t_id);
            leader.setT_id(team.getT_name());
        }
        return leaders;
    }


    @Override
    public Leader addLeader(Leader leader) {
        int count = leaderMapper.insertSelective(leader);
        if(count == 0){
            throw new SportsException(SportsEnum.LEADER_ADD);
        }
        return leader;
    }

    @Override
    public void deleteLeader(String l_id) {
        int count = leaderMapper.deleteByPrimaryKey(l_id);
        if (count == 0){
            throw new SportsException(SportsEnum.LEADER_DELETE);
        }
    }

    @Override
    public List<Doctor> listDoctor(String t_id) {
        Example example = new Example(Doctor.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("t_id", t_id);
        List<Doctor> doctors = doctorMapper.selectByExample(example);

        for (Doctor doctor:doctors) {
            Team team = teamMapper.selectByPrimaryKey(t_id);
            doctor.setT_id(team.getT_name());
        }
        return doctors;
    }

    @Override
    public Doctor addDoctor(Doctor doctor) {
        int count = doctorMapper.insertSelective(doctor);
        if(count == 0){
            throw new SportsException(SportsEnum.DOCTOR_ADD);
        }
        return doctor;
    }


    @Override
    public void deleteDoctor(String d_id) {
        int count = doctorMapper.deleteByPrimaryKey(d_id);
        if (count == 0){
            throw new SportsException(SportsEnum.DOCTOR_DELETE);
        }
    }

    @Override
    public List<MatchSchdule> listMatchSchdule() {
        List<MatchSchdule> matchSchdules = matchSchduleMapper.selectAll();
        return matchSchdules;
    }



    @Override
    public List<Athlete> showMatchDetails(String g_id) {
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
    public List<FinalScore> finalRankingSingle(String p_id,String age_id) {
        Example example = new Example(FinalScore.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("p_id", p_id)
                .andEqualTo("age_id",age_id)
                .andEqualTo("match_type","决赛");
        example.setOrderByClause("finaldegree desc");

        List<FinalScore> finalScores = finalScoreMapper.selectByExample(example);

        for(FinalScore finalScore:finalScores){
            String a_id = finalScore.getA_id();
            Athlete athlete = athleteMapper.selectByPrimaryKey(a_id);
            finalScore.setA_id(athlete.getA_name());
        }

        for(FinalScore finalScore:finalScores){
            Age age = ageMapper.selectByPrimaryKey(age_id);
            finalScore.setAge_id(age.getAge_name());
        }

        for(FinalScore finalScore:finalScores){
            Project project = projectMapper.selectByPrimaryKey(p_id);
            finalScore.setP_id(project.getP_name());
        }

        return finalScores;
    }
    @Override
    public List<String> findAid(String age_id){
        Example example = new Example(FinalScore.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("age_id",age_id)
                .andEqualTo("match_type","初赛");

        List<FinalScore> finalScores = finalScoreMapper.selectByExample(example);

        List<String> list = new ArrayList<>();
        for(int i = 0;i < finalScores.size();i++){
            if(!list.contains(finalScores.get(i).getA_id())){
                list.add(finalScores.get(i).getA_id());
            }
        }
        return list;
    }

    @Override
    public void calculateDegree(List<String> list){
        for(int i = 0;i < list.size();i++){
            Example example = new Example(FinalScore.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("a_id",list.get(i));
            List<FinalScore> finalScores = finalScoreMapper.selectByExample(example);
            int num = 0;
            for(int a = 1;a < finalScores.size();a++){
                num  =num + Integer.parseInt(finalScores.get(a).getFinaldegree());
            }
            Athlete athlete = new Athlete();
            athlete.setA_id(list.get(i));
            athlete.setAllDegree(String.valueOf(num));
            athleteMapper.updateByPrimaryKeySelective(athlete);
        }
    }

    @Override
    public List<Athlete> individualAllAround(String age_id){
        Example example = new Example(Athlete.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("age_id",age_id);
        example.setOrderByClause("allDegree desc");
        List<Athlete> athletes = athleteMapper.selectByExample(example);
        return athletes;
    }
    @Override
    public List<String> findTid(String age_id){
        Example example = new Example(FinalScore.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("age_id",age_id)
                .andEqualTo("match_type","初赛");
        List<FinalScore> finalScores = finalScoreMapper.selectByExample(example);

        List<String> list = new ArrayList<>();
        for(int i = 0;i < finalScores.size();i++){
            if (!list.contains(finalScores.get(i).getT_id())){
                list.add(finalScores.get(i).getT_id());
            }
        }
        return list;
    }
    @Override
    public void calculateTeamDegree(List<String> list,String age_id) {
        for (int i = 0; i < list.size(); i++) {
            Example example = new Example(FinalScore.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("age_id", age_id)
                    .andEqualTo("t_id", list.get(i))
                    .andEqualTo("match_type", "初赛");
            example.setOrderByClause("finaldegree desc");

            List<FinalScore> finalScores = finalScoreMapper.selectByExample(example);

            int num = 0;
            if (finalScores.size() >= 4) {
                for (int a = 0; a < 4; a++) {
                    num = num + Integer.parseInt(finalScores.get(a).getFinaldegree());
                }
            }
            TeamDegree teamDegree = new TeamDegree();
            teamDegree.setTeamdegree(String.valueOf(num));
            teamDegree.setT_id(finalScores.get(i).getT_id());
            teamDegree.setAge_id(age_id);
            teamDegreeMapper.insertSelective(teamDegree);
        }
    }
    @Override
    public List<TeamDegree> teamDegree(String age_id){

        Example example = new Example(TeamDegree.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("age_id",age_id);
        example.setOrderByClause("teamdegree desc");
        List<TeamDegree> teamDegrees = teamDegreeMapper.selectByExample(example);
        return teamDegrees;
    }
}


