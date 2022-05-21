package com.sportsmeet.sports.back.service;

import com.sportsmeet.sports.back.bean.Athlete;
import com.sportsmeet.sports.back.bean.FinalScore;
import com.sportsmeet.sports.back.bean.MatchSchdule;
import com.sportsmeet.sports.back.bean.Score;

import java.util.List;
import java.util.ArrayList;
public interface RefereeService {

    List<MatchSchdule> listMatchSchdule();

    List<Athlete> listAthlete(String g_id);

    List<Athlete> listAthlete2(String g_id);

    void grade(Score score);

    List<Score> listGrade(String a_id,String g_id);

    void gradeChecked(FinalScore finalScore);
}
