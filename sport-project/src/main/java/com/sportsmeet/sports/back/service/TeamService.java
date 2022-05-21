package com.sportsmeet.sports.back.service;

import com.sportsmeet.sports.back.bean.*;

import java.util.List;

public interface TeamService {
    List<Athlete> listAthlete(String t_id, String a_name);

    void deleteById(String a_id);

    List<Age> queryAge();

    Athlete addAthlete(Athlete athlete);

    List<Leader> listLeader(String t_id);

    Leader addLeader(Leader leader);

    void deleteLeader(String l_id);

    List<Doctor> listDoctor(String t_id);

    Doctor addDoctor(Doctor doctor);

    void deleteDoctor(String d_id);

    List<MatchSchdule> listMatchSchdule();

    List<Athlete> showMatchDetails(String g_id);

    List<FinalScore> finalRankingSingle(String p_id,String age_id);

    List<String> findAid(String age_id);

    void calculateDegree(List<String> list);

    List<Athlete> individualAllAround(String age_id);

    List<String> findTid(String age_id);

    void calculateTeamDegree(List<String> list,String age_id);

    List<TeamDegree> teamDegree(String age_id);
}
