package com.sportsmeet.sports.back.service.impl;

import com.sportsmeet.sports.back.bean.Admin;
import com.sportsmeet.sports.back.mapper.AdminMapper;
import com.sportsmeet.sports.back.service.AdminService;
import com.sportsmeet.sports.base.exception.SportsEnum;
import com.sportsmeet.sports.base.exception.SportsException;
import com.sportsmeet.sports.base.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author XYX
 * @create 2021-11-23-0:23
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(Admin admin) {


        //密码加密
        String password = admin.getPassword();
        password = MD5Util.getMD5(password);
        admin.setPassword(password);

        List<Admin> admins = adminMapper.select(admin);
        if(admins.size() == 0){
            throw new SportsException(SportsEnum.USER_LOGIN_ACCOUNT);
        }

        return admins.get(0);
    }

    @Override
    public void verifyOldPwd(String oldPwd, Admin admin) {
        System.out.println(oldPwd);
        oldPwd = MD5Util.getMD5(oldPwd);
        System.out.println(oldPwd);
        String password = admin.getPassword();
        if(!password.equalsIgnoreCase(oldPwd)){
            throw new SportsException(SportsEnum.USER_VERIFY_PASS);
        }
    }

    @Override
    public void updateAdmin(Admin admin) {
        admin.setPassword(MD5Util.getMD5(admin.getPassword()));
        int count = adminMapper.updateByPrimaryKeySelective(admin);
        if(count == 0){
            throw new SportsException(SportsEnum.USER_UPDATE);
        }
    }
}
