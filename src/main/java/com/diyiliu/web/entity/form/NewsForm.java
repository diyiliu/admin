package com.diyiliu.web.entity.form;

import com.diyiliu.web.entity.News;

import java.util.Map;

/**
 * Description: NewsForm
 * Author: DIYILIU
 * Update: 2016-04-25 10:10
 */
public class NewsForm {

    private Map<String, Object> newsMap;

    private News news;

    public Map<String, Object> getNewsMap() {
        return newsMap;
    }

    public void setNewsMap(Map<String, Object> newsMap) {
        this.newsMap = newsMap;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }
}
