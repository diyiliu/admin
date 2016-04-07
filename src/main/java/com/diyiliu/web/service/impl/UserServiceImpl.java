package com.diyiliu.web.service.impl;

import com.diyiliu.web.dao.UserDao;
import com.diyiliu.web.entity.User;
import com.diyiliu.web.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Description: UserServiceImpl
 * Author: DIYILIU
 * Update: 2016-04-05 15:59
 */

@Service
public class UserServiceImpl extends  BaseServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public List<User> selectUsers(String condition) {

        return userDao.selectUsersByPage(condition);
    }

    @Override
    public User selectUserById(int id) {

        return userDao.selectUserById(id);
    }
}
