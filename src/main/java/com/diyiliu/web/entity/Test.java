package com.diyiliu.web.entity;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Description: Test
 * Author: DIYILIU
 * Update: 2016-03-14 13:39
 */
@XmlRootElement
public class Test {

    private String a;
    private String b;

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a;
    }

    public String getB() {
        return b;
    }

    public void setB(String b) {
        this.b = b;
    }
}
