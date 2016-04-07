package com.diyiliu.support.util;

/**
 * Description: CommonUtil
 * Author: DIYILIU
 * Update: 2016-04-05 16:53
 */
public class CommonUtil {

    public static  boolean isEmpty(String str) {

        if (str == null || str.trim().length() < 1){

            return true;
        }

        return false;
    }


    public static String fromJdbcUrl(String jdbcUrl) {
        String[] dialects = new String[]{"mysql", "oracle"};

        for (String dialect : dialects) {
            if (jdbcUrl.indexOf(":" + dialect + ":") != -1 ||
                    jdbcUrl.indexOf(":" + dialect.toUpperCase() + ":") != -1) {

                return dialect;
            }
        }

        return null;
    }
}
