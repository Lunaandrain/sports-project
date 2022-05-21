package com.sportsmeet.sports.back.service;

import com.sportsmeet.sports.back.bean.Team;

public interface TeamUserService {

    Team login(Team team);

    void verifyOldPwd(String oldPwd,Team team);

    void updateUser(Team team);
}
