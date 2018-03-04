package com.business.admin.types.dao;

import com.entity.Types;

import java.util.List;

public interface TypesDao {
    public List<Types> findAll();

    public void saveTypes(Types type);
}
