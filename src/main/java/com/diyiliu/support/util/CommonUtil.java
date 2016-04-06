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
}
