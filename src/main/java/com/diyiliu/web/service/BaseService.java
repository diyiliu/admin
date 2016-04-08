package com.diyiliu.web.service;

import com.diyiliu.web.entity.base.BaseEntity;

/**
 * Description: BaseService
 * Author: DIYILIU
 * Update: 2016-04-07 9:56
 */

public interface BaseService {

    void insert(BaseEntity entity);

    void delete(BaseEntity entity);

    void update(BaseEntity entity);

    void batchDelete(String table, String key, String[] keys);
}
