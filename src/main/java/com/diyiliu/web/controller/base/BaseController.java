package com.diyiliu.web.controller.base;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Description: BaseController
 * Author: DIYILIU
 * Update: 2016-04-06 14:49
 */
public class BaseController {

    private final static ObjectMapper OBJECT_MAPPER = new ObjectMapper();
    private final static DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    protected String toJson(Object obj){

        try {
            return OBJECT_MAPPER.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return null;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder){

        binder.registerCustomEditor(Date.class, new CustomDateEditor(DATE_FORMAT, false));
    }
}
