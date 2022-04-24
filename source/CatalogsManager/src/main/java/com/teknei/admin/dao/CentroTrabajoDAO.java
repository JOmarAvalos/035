package com.teknei.admin.dao;

import com.teknei.base.dao.BaseDAO;
import com.teknei.entity.CentroTrabajo;

public interface CentroTrabajoDAO extends BaseDAO<Integer, CentroTrabajo>{
	
	CentroTrabajo getByUsuario(Integer idUsuario);

}
