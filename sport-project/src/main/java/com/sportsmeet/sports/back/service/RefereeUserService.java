package com.sportsmeet.sports.back.service;

import com.sportsmeet.sports.back.bean.Referee;


public interface RefereeUserService {
    Referee login(Referee referee);

    void verifyOldPwd(String oldPwd,Referee referee);

    void updateUser(Referee referee);
}
