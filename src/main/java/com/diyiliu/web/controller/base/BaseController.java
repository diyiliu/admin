package com.diyiliu.web.controller.base;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Description: BaseController
 * Author: DIYILIU
 * Update: 2016-04-06 14:49
 */
public class BaseController {

    private final static ObjectMapper OBJECT_MAPPER = new ObjectMapper();

    protected String toJson(Object obj){

        try {
            return OBJECT_MAPPER.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return null;
    }
}
