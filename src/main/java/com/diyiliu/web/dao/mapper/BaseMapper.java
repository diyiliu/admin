package com.diyiliu.web.dao.mapper;

import com.diyiliu.web.entity.base.BaseEntity;

/**
 * Description: BaseMapper
 * Author: DIYILIU
 * Update: 2016-04-05 15:51
 */
public interface BaseMapper {

    void insertEntity(BaseEntity entity);

    void deleteEntity(BaseEntity entity);

    void updateEntity(BaseEntity entity);
}
