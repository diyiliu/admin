package com.diyiliu.web.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Description: BaseController
 * Author: DIYILIU
 * Update: 2016-04-05 14:56
 */
public class BaseController {

    private static ObjectMapper objectMapper = new ObjectMapper();

    public String toJson(Object obj) {

        try {
            return objectMapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return "";
    }

    public void write(String result, HttpServletResponse response) {

        try {
            response.getWriter().write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    final class BootPage<T> {

        protected Long total;

        protected List<T> rows;

        protected int limit = 0;

        protected int offset = 0;

        protected String order = "asc";

        public BootPage() {
        }

        public BootPage(int limit, int offset, String order) {
            this.limit = limit;
            this.offset = offset;
            this.order = order;
        }

        public Long getTotal() {
            return total;
        }

        public void setTotal(Long total) {
            this.total = total;
        }

        public List<T> getRows() {
            return rows;
        }

        public void setRows(List<T> rows) {
            this.rows = rows;
        }

        public int getLimit() {
            return limit;
        }

        public void setLimit(int limit) {
            this.limit = limit;
        }

        public int getOffset() {
            return offset;
        }

        public void setOffset(int offset) {
            this.offset = offset;
        }

        public String getOrder() {
            return order;
        }

        public void setOrder(String order) {
            this.order = order;
        }
    }
}
