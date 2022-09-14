package com.teknei.admin.bsn;

import java.util.List;

import com.teknei.vo.ActividadVO;

public interface ActividadManager {

	List<ActividadVO> getAll();
	
	ActividadVO getByCentroCuestionario(Integer idCentro, Integer idCuestionario); 
	
	ActividadVO save(ActividadVO actividadVO);
	
}
