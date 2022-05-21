package com.sportsmeet.sports.back.service.impl;

import com.sportsmeet.sports.back.bean.Team;
import com.sportsmeet.sports.back.mapper.TeamMapper;
import com.sportsmeet.sports.back.service.TeamUserService;
import com.sportsmeet.sports.base.exception.SportsEnum;
import com.sportsmeet.sports.base.exception.SportsException;
import com.sportsmeet.sports.base.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author XYX
 * @create 2021-11-23-22:23
 */
@Service
public class TeamUserServiceImpl implements TeamUserService {

    @Autowired
    private TeamMapper teamMapper;


    @Override
    public Team login(Team team) {
        //密码加密
        String password = team.getPassword();
        password = MD5Util.getMD5(password);
        team.setPassword(password);
        //用户名密码校验
        List<Team> teams = teamMapper.select(team);
        if(teams.size() == 0){
            throw new SportsException(SportsEnum.USER_LOGIN_ACCOUNT);
        }
        return teams.get(0);
    }

    @Override
    public void verifyOldPwd(String oldPwd, Team team) {
        oldPwd = MD5Util.getMD5(oldPwd);
        String password = team.getPassword();
        if(!password.equals(oldPwd)){
            throw new SportsException(SportsEnum.USER_VERIFY_PASS);
        }
    }

    @Override
    public void updateUser(Team team) {
        //给用户输入的新密码加密
        team.setPassword(MD5Util.getMD5(team.getPassword()));
        //count:影响记录数
        int count = teamMapper.updateByPrimaryKeySelective(team);
        if(count == 0){
            throw new SportsException(SportsEnum.USER_UPDATE);
        }
    }
}
