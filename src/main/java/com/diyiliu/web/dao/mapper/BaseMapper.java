package com.diyiliu.web.dao.mapper;

import com.diyiliu.web.entity.base.BaseEntity;
import org.apache.ibatis.annotations.Param;

/**
 * Description: BaseMapper
 * Author: DIYILIU
 * Update: 2016-04-05 15:51
 */
public interface BaseMapper {

    void insertEntity(BaseEntity entity);

    void deleteEntity(BaseEntity entity);

    void updateEntity(BaseEntity entity);

    void batchDelete(@Param("table") String table, @Param("key") String key, @Param("keys") String[] keys);
}
