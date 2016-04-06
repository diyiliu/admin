package com.diyiliu.web.controller;

import com.diyiliu.support.other.Pagination;
import com.diyiliu.support.other.PaginationHelper;
import com.diyiliu.support.util.CommonUtil;
import com.diyiliu.web.controller.base.BaseController;
import com.diyiliu.web.entity.Test;
import com.diyiliu.web.entity.User;
import com.diyiliu.web.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description: TestController
 * Author: DIYILIU
 * Update: 2016-03-14 11:19
 */

@Controller
@RequestMapping(value = "/test")
public class TestController extends BaseController{

    @Resource
    private UserService userService;

    @RequestMapping
    public void test(HttpServletResponse response) throws IOException {

        response.getWriter().write("hello!");
    }

    @RequestMapping(value = "/1")
    public Test test1(Test test) {

        return test;
    }

    @RequestMapping(value = "/2")
    public void test2(User user) {

        System.out.println(user.getId());
    }

    @RequestMapping(value = "/form")
    public String form(User user, HttpServletResponse response) throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user", user);
        //map.put("array", a);

        ObjectMapper objectMapper = new ObjectMapper();
        response.getWriter().write(objectMapper.writeValueAsString(map));

        return null;
    }

    @ResponseBody
    @RequestMapping(value = "/table")
    public String table( Pagination pagination, @RequestParam(required = false) String search) {
        PaginationHelper.page(pagination.getOffset(), pagination.getLimit());

        List<User> list = userService.selectUsers(CommonUtil.isEmpty(search) ? null : search.trim());
        pagination.setTotal(PaginationHelper.getCount());
        pagination.setRows(list);

        return toJson(pagination);
    }

}
