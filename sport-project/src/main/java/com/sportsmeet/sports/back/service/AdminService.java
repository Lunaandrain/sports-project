package com.sportsmeet.sports.back.service;

import com.sportsmeet.sports.back.bean.Admin;

public interface AdminService {
    Admin login(Admin admin);

    void verifyOldPwd(String oldPwd,Admin admin);

    void updateAdmin(Admin admin);

}
