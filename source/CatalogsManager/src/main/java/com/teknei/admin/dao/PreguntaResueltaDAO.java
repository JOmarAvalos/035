package com.teknei.admin.dao;

import java.util.List;

import com.teknei.base.dao.BaseDAO;
import com.teknei.entity.PreguntaResuelta;


public interface PreguntaResueltaDAO extends BaseDAO<Integer, PreguntaResuelta> {
	
	PreguntaResuelta getByActividadPregunta(Integer idActividad, Integer idPregunta);

}

