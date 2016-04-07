package com.diyiliu.web.service;

import com.diyiliu.web.entity.User;

import java.util.List;

/**
 * Description: UserService
 * Author: DIYILIU
 * Update: 2016-04-05 15:48
 */
public interface UserService extends BaseService{

    List<User> selectUsers(String condition);

    User selectUserById(int id);
}
