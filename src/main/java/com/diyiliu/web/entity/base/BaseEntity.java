package com.diyiliu.web.entity.base;

import javax.persistence.Column;
import javax.persistence.Table;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.HashMap;

/**
 * Description: BaseEntity
 * Author: DIYILIU
 * Update: 2016-02-19 14:02
 */
public class BaseEntity implements Serializable {

    public HashMap toHashMap() {

        HashMap map = new HashMap();
        try {
            Field[] fields = this.getClass().getDeclaredFields();

            String column;
            Object value;
            for (Field field : fields) {

                if (field.isAccessible()) {
                    column = field.getAnnotation(Column.class).name();
                    value = field.get(this);

                    map.put(column, value);
                } else {
                    field.setAccessible(true);
                    Column columnField = field.getAnnotation(Column.class);
                    if (columnField != null) {
                        column = columnField.name();
                        value = field.get(this);

                        map.put(column, value);
                    }

                    field.setAccessible(false);
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return map;
    }
}
