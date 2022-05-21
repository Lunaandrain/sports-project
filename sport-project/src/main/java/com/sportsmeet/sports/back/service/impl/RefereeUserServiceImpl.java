package com.sportsmeet.sports.back.service.impl;

import com.sportsmeet.sports.back.bean.Referee;
import com.sportsmeet.sports.back.mapper.RefereeMapper;
import com.sportsmeet.sports.back.service.RefereeUserService;
import com.sportsmeet.sports.base.exception.SportsEnum;
import com.sportsmeet.sports.base.exception.SportsException;
import com.sportsmeet.sports.base.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author XYX
 * @create 2021-11-23-22:45
 */
@Service
public class RefereeUserServiceImpl implements RefereeUserService {
    @Autowired
    private RefereeMapper refereeMapper;

    @Override
    public Referee login(Referee referee) {
        //密码加密
        String password = referee.getPassword();
        password = MD5Util.getMD5(password);
        referee.setPassword(password);
        //用户名密码校验
        List<Referee> referees = refereeMapper.select(referee);
        if(referees.size() == 0){
            throw new SportsException(SportsEnum.USER_LOGIN_ACCOUNT);
        }
        return referees.get(0);
    }

    @Override
    public void verifyOldPwd(String oldPwd, Referee referee) {
        oldPwd = MD5Util.getMD5(oldPwd);
        String password = referee.getPassword();
        if(!password.equals(oldPwd)){
            throw new SportsException(SportsEnum.USER_VERIFY_PASS);
        }
    }

    @Override
    public void updateUser(Referee referee) {
        //给用户输入的新密码加密
        referee.setPassword(MD5Util.getMD5(referee.getPassword()));
        //count:影响记录数
        int count = refereeMapper.updateByPrimaryKeySelective(referee);
        if(count == 0){
            throw new SportsException(SportsEnum.USER_UPDATE);
        }
    }
}
