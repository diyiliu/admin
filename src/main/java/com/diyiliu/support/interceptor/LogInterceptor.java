package com.diyiliu.support.interceptor;

import com.diyiliu.support.util.JsonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Description: LogInterceptor
 * Author: DIYILIU
 * Update: 2016-03-16 11:24
 */

public class LogInterceptor extends HandlerInterceptorAdapter{

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        logger.info("请求参数：[{}]", JsonUtil.toJson(request.getParameterMap()));

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        //logger.info("LogInterceptor[{}]...", "postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

        //logger.info("LogInterceptor[{}]...", "afterCompletion");
    }
}
