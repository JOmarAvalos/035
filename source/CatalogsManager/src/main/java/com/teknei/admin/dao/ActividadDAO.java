package com.teknei.admin.dao;

import java.util.List;

import com.teknei.base.dao.BaseDAO;
import com.teknei.entity.Actividad;


public interface ActividadDAO extends BaseDAO<Integer, Actividad> {

	List<Actividad> getAll();
}

