package com.util;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.List;

/**
 * 数据库访问层泛型 DAO
 * 约定：具体泛型类型的类名,和表名一致
 * 1. 得到具体的业务dao运行中的泛型具体类型(Student/Teacher),可以封装ResultSet
 * 2. 得到的泛型具有类型名称,即表名
 * 3. this : 当前运行的dao对象
 * 4. this.getClass() : 当前运行的dao对象的Class对象
 * 5. clazz.getGenericSuperclass() 得到当前dao对象的父类(参数化类型)
 * 6. 相关包
 *      a.c3p0-0.9.1.2
 *      b.commons-dbutils-1.4
 *      c.mysql-connector-java-5.1.7-bin
 */
public class BaseDao<T> {
    private Class targetClass;
    private String tableName;

    public BaseDao(){
        Class clazz = this.getClass();
        Type type = clazz.getGenericSuperclass();
        ParameterizedType param = (ParameterizedType)type;
        Type[] types = param.getActualTypeArguments();
        Type target = types[0];
        targetClass = (Class)target;
        tableName = targetClass.getSimpleName().toLowerCase();
    }

    public List<T> findAll(){
        try{
            QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
            String sql = "select * from "+tableName+"";
            return (List<T>)qr.query(sql, new BeanListHandler<>(targetClass));
        }catch(SQLException e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public T findByID(String id){
        try{
            QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
            return (T)qr.query("select * from "+tableName+" where id=?",new BeanHandler(targetClass),new Object[]{id});
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    //todo 需要实现通用的   save(T t)    update(T t)  delete(String id)
}
