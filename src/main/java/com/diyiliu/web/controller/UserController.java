package com.diyiliu.web.controller;

import com.diyiliu.support.other.Pagination;
import com.diyiliu.support.other.PaginationHelper;
import com.diyiliu.web.controller.base.BaseController;
import com.diyiliu.web.entity.User;
import com.diyiliu.web.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Description: UserController
 * Author: DIYILIU
 * Update: 2016-04-06 14:48
 */

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Resource
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String userList(Pagination pagination, @RequestParam(required = false) String search) {
        PaginationHelper.page(pagination.getOffset(), pagination.getLimit());
        List<User> userList = userService.selectUsers(search);

        pagination.setRows(userList);
        pagination.setTotal(PaginationHelper.getCount());

        return toJson(pagination);
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String userUpdate(@RequestParam int id, Model model) {

        User user = userService.selectUserById(id);
        model.addAttribute(user);
        model.addAttribute("op", "修改");

        return "user/edit";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(User user) {
        userService.update(user);

        return "redirect:/admin/user/list.jsp";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String userCreate(Model model) {
        model.addAttribute("op", "新增");

        return "user/edit";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(User user) {
        userService.insert(user);

        return "redirect:/admin/user/list.jsp";
    }


    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam String id) {
        String[] ids = id.split(",");

        userService.batchDelete("USER", "id", ids);

        return "redirect:/admin/user/list.jsp";
    }

}
