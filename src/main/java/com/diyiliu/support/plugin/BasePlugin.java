package com.diyiliu.support.plugin;

import com.diyiliu.support.other.Constant;
import com.diyiliu.support.plugin.abs.SPlugin;
import com.diyiliu.support.util.DateUtil;
import com.diyiliu.web.entity.base.BaseEntity;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;

import javax.persistence.Table;
import java.sql.Connection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

/**
 * Description: BasePlugin
 * Author: DIYILIU
 * Update: 2016-02-19 11:22
 */
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class})})
public class BasePlugin extends SPlugin {

    private String baseSqlId;
    private String dialect;

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        strip(invocation.getTarget());

        MappedStatement mappedStatement = (MappedStatement) getValue("mappedStatement");

        String sqlId = mappedStatement.getId().substring(mappedStatement.getId().lastIndexOf(".") + 1);

        if (sqlId.matches(baseSqlId)) {
            logger.info("Mybatis 通用插件...");

            BoundSql boundSql = (BoundSql) getValue("boundSql");
            Object parameterObject = boundSql.getParameterObject();

            if (parameterObject instanceof BaseEntity) {

                setValue("boundSql.sql", joinSql(sqlId, (BaseEntity) parameterObject));
            }
        }

        return invocation.proceed();
    }

    public String joinSql(String sqlId, BaseEntity entity) {


        Table tableField = entity.getClass().getAnnotation(Table.class);
        String table = tableField.name();
        String key = tableField.schema();

        HashMap map = entity.toHashMap();
        String[] fields = new String[map.size()];
        Object[] values = new Object[map.size()];

        int i = 0;
        for (Iterator iter = map.keySet().iterator(); iter.hasNext(); ) {
            String column = (String) iter.next();
            fields[i] = column;
            values[i] = map.get(column);
            i++;
        }

        StringBuilder strb;
        if (sqlId.equals(Constant.Crud.INSERT)) {

            strb = new StringBuilder("INSERT INTO ");
            strb.append(table).append("(");
            for (String field : fields) {
                strb.append(field).append(",");
            }
            strb = strb.replace(strb.length() - 1, strb.length(), ")");
            strb.append("VALUES(");
            for (Object value : values) {
                strb.append(format(value, dialect)).append(",");
            }
            strb = strb.replace(strb.length() - 1, strb.length(), ")");

            return strb.toString();
        } else if (sqlId.equals(Constant.Crud.DELETE)) {

            strb = new StringBuilder("DELETE FROM ");
            strb.append(table).append(" WHERE ").append(key).append("=").append(format(map.get(key), dialect));

            return strb.toString();
        } else if (sqlId.equals(Constant.Crud.UPDATE)) {

            strb = new StringBuilder("UPDATE ");
            strb.append(table).append(" SET ");
            for (String field : fields) {
                strb.append(field).append("=").append(format(map.get(field), dialect)).append(", ");
            }
            int index = strb.lastIndexOf(",");
            strb.replace(index, index + 1, "");
            strb.append(" WHERE ").append(key).append("=").append(format(map.get(key), dialect));

            return strb.toString();
        } else if (sqlId.equals(Constant.Crud.SELECT)) {
            strb = new StringBuilder("SELECT * FROM ");
            strb.append(table);
            return strb.toString();
        }

        return null;
    }

    private Object format(Object value, String dialect) {

        if (value instanceof String) {

            value = "'" + value + "'";
        } else if (value instanceof Date) {

            if (dialect.equals("mysql")) {

                value = "date_format('" + DateUtil.dateToString((Date) value) + "' , '%Y-%m-%d %H:%i:%s')";
            } else if (dialect.equals("oracle")) {

                value = "to_date('" + DateUtil.dateToString((Date) value) + "' , 'yyyy-mm-dd hh24:mi:ss')";
            }
        }

        return value;
    }


    @Override
    public Object plugin(Object target) {
        // 当目标类是StatementHandler类型时，才包装目标类，否者直接返回目标本身,减少目标被代理的次数
        if (target instanceof StatementHandler) {
            return Plugin.wrap(target, this);
        } else {
            return target;
        }
    }

    @Override
    public void setProperties(Properties properties) {
        this.baseSqlId = properties.getProperty(Constant.Crud.BASE_SQL_ID);
        this.dialect = properties.getProperty(Constant.Crud.DIALECT);
    }
}
