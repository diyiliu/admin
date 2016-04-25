package com.diyiliu.web.controller;

import com.diyiliu.web.controller.base.BaseController;
import com.diyiliu.web.entity.form.NewsForm;
import com.diyiliu.web.service.NewsService;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Description: NewsController
 * Author: DIYILIU
 * Update: 2016-04-25 10:11
 */

@Controller
@RequestMapping("/news")
public class NewsController extends BaseController{

    @Resource
    private NewsService newsService;

    @RequestMapping(value = "/release", method = RequestMethod.POST)
    public String release(NewsForm newsForm){

        newsService.insert(newsForm.getNews());

        return "redirect:/admin/release/release.jsp";
    }

    @Override
    public void initBinder(WebDataBinder binder){

        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), false));
    }
}
