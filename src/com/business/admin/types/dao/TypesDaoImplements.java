package com.business.admin.types.dao;

import com.entity.Types;
import com.util.BaseDao;
import com.util.JdbcUtil;
import com.util.WebUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

public class TypesDaoImplements extends BaseDao<Types> implements TypesDao{
    @Override
    public void saveTypes(Types type) {
        try{
            QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
            qr.update("insert into types(id,name.description) values(?,?,?)",
                        new Object[]{
                                WebUtil.uuid(),
                                type.getName(),
                                type.getDescription()
                        });
        }catch (SQLException e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Test
    public void test(){
        TypesDaoImplements dao = new TypesDaoImplements();
        List<Types> list = dao.findAll();
        for(Types types : list){
            System.out.println(types);
        }
    }

    public void test2(){

    }
}
