package com.diyiliu.web.dao;

import com.diyiliu.web.dao.mapper.BaseMapper;
import com.diyiliu.web.entity.User;

import java.util.List;

/**
 * Description: UserDao
 * Author: DIYILIU
 * Update: 2016-04-05 15:51
 */
public interface UserDao extends BaseMapper{

    public List<User> selectUsersByPage(String condition);
}
