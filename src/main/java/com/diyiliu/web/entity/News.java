package com.diyiliu.web.entity;

import com.diyiliu.support.util.DateUtil;
import com.diyiliu.web.entity.base.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Table;
import java.util.Date;

/**
 * Description: News
 * Author: DIYILIU
 * Update: 2016-04-25 10:05
 */
@Table(name = "NEWS", schema = "NID")
public class News extends BaseEntity {

    @Column(name = "NID")
    private int id;
    @Column(name = "TITLE")
    private String title;
    @Column(name = "SUMMARY")
    private String summary;
    @Column(name = "CONTENT")
    private String content;
    @Column(name = "CREATETIME")
    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
