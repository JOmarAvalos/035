package com.teknei.admin.dao;

import java.util.List;

import com.teknei.base.dao.BaseDAO;
import com.teknei.entity.Respuesta;

public interface RespuestaDAO extends BaseDAO<Integer, Respuesta>{
	
	List<Respuesta> getActivasByPregunta(Integer idPregunta);

}
