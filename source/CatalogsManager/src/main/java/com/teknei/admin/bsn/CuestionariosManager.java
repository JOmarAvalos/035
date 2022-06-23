package com.teknei.admin.bsn;

import java.util.List;

import com.teknei.vo.ActividadResueltaVO;
import com.teknei.vo.CuestionarioVO;
import com.teknei.vo.PreguntaResueltaVO;

public interface CuestionariosManager {
	
	CuestionarioVO getCustonarioCompleto(Integer id, Integer idActividad);
	List<CuestionarioVO> getCuestionariosByCentro(Integer idCentro);
	
	ActividadResueltaVO saveActividadResuelta(ActividadResueltaVO actividadResueltaVO);
	PreguntaResueltaVO savePregunta(PreguntaResueltaVO preguntaResueltaVO);
	
	ActividadResueltaVO endActividadResuelta(Integer id);
	
	int cuestionariosResueltos();
	
	List<String[]> getCuestionarioTipo1Descarga(Integer id);
	List<String[]> getCuestionarioTipo2Descarga(Integer id);
	List<String[]> getCuestionarioTipo3Descarga(Integer id);

}
