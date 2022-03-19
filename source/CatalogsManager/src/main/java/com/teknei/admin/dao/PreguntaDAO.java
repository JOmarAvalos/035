package com.teknei.admin.dao;

import java.util.List;

import com.teknei.base.dao.BaseDAO;
import com.teknei.entity.Pregunta;

public interface PreguntaDAO extends BaseDAO<Integer, Pregunta>{
	
	List<Pregunta> getActivasByCuestionario(Integer idCuestionario);

}
