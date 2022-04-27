package com.teknei.admin.dao;

import java.util.List;

import com.teknei.base.dao.BaseDAO;
import com.teknei.entity.Cuestionario;

public interface CuestionarioDAO extends BaseDAO<Integer, Cuestionario>{
	
	List<Cuestionario> getByCentro(Integer idCentro);

}
