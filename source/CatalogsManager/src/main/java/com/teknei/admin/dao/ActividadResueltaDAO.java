package com.teknei.admin.dao;

import java.util.List;

import com.teknei.base.dao.BaseDAO;
import com.teknei.entity.ActividadResuelta;


public interface ActividadResueltaDAO extends BaseDAO<Integer, ActividadResuelta> {

	int actividadesConcluidas(Integer idActividad);
	
}

