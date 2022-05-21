package com.sportsmeet.sports.back.service;

import com.sportsmeet.sports.back.bean.Age;
import com.sportsmeet.sports.back.bean.Athlete;
import com.sportsmeet.sports.back.bean.MatchSchdule;
import com.sportsmeet.sports.back.bean.Project;

import java.util.List;

public interface MatchSchduleService {


    List<MatchSchdule> list();

    List<Age> queryAge();

    List<Project> queryProject();

    MatchSchdule save(MatchSchdule matchSchdule);

    void deleteById(String g_id);

    List<Athlete> listById(String g_id);

    void deleteAthlete(String a_id);

    List<Athlete> listAthlete(String age_id);

    void addAthlete(Athlete athlete);

    void addFinalMatch(MatchSchdule matchSchdule);

}
