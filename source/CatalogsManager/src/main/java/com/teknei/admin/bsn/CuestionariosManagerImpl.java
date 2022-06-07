package com.teknei.admin.bsn;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teknei.admin.dao.ActividadDAO;
import com.teknei.admin.dao.ActividadResueltaDAO;
import com.teknei.admin.dao.CuestionarioDAO;
import com.teknei.admin.dao.PreguntaDAO;
import com.teknei.admin.dao.PreguntaResueltaDAO;
import com.teknei.admin.dao.RespuestaDAO;
import com.teknei.entity.ActividadResuelta;
import com.teknei.entity.Cuestionario;
import com.teknei.entity.Pregunta;
import com.teknei.entity.PreguntaResuelta;
import com.teknei.entity.Respuesta;
import com.teknei.mapper.Mapper;
import com.teknei.vo.ActividadResueltaVO;
import com.teknei.vo.ActividadVO;
import com.teknei.vo.CuestionarioVO;
import com.teknei.vo.PreguntaResueltaVO;
import com.teknei.vo.PreguntaVO;
import com.teknei.vo.RespuestaVO;

@Service
@Transactional
public class CuestionariosManagerImpl implements CuestionariosManager{
	
	private static final Logger LOGGER = Logger.getLogger(CuestionariosManagerImpl.class);
	
	@Autowired
	private CuestionarioDAO cuestionarioDAO;
	@Autowired
	private PreguntaDAO preguntaDAO;
	@Autowired
	private RespuestaDAO respuestaDAO;
	@Autowired
	private ActividadDAO actividadDAO;
	@Autowired
	private ActividadResueltaDAO actividadResueltaDAO;
	@Autowired
	private PreguntaResueltaDAO preguntaResueltaDAO;
	

	@Override
	public CuestionarioVO getCustonarioCompleto(Integer id, Integer idActividad) {
		CuestionarioVO resp = null;
		try {
			resp = Mapper.toVO(cuestionarioDAO.find(id));
			List<Pregunta> preguntas = preguntaDAO.getActivasByCuestionario(resp.getId());
			List<PreguntaVO> preguntasVO = new ArrayList<PreguntaVO>();
			if(preguntas != null && !preguntas.isEmpty()) {
				for(Pregunta pregunta: preguntas) {
					PreguntaVO preguntaVO = Mapper.toVO(pregunta);
					List<Respuesta> respuestas = respuestaDAO.getActivasByPregunta(pregunta.getId());
					List<RespuestaVO> respuestasVO = new ArrayList<RespuestaVO>();
					if(respuestas != null && !respuestas.isEmpty()) {
						for(Respuesta respuesta: respuestas) {
							respuestasVO.add(Mapper.toVO(respuesta));
						}
					}
					preguntaVO.setRespuestas(respuestasVO);
					preguntasVO.add(preguntaVO);
				}
			}
			resp.setPreguntas(preguntasVO);
			ActividadVO actividad =  Mapper.toVO(actividadDAO.find(idActividad));
			resp.setActividad(actividad);
		} catch (Exception e) {
			LOGGER.error("Ocurrio un error en CuestionariosManagerImpl.getCustonarioCompleto			error:	",e);
		}
		return resp;
	}


	@Override
	public List<CuestionarioVO> getCuestionariosByCentro(Integer idCentro) {
		List<CuestionarioVO> resp = new ArrayList<CuestionarioVO>();
		List<Cuestionario> cuestionarios = cuestionarioDAO.getByCentro(idCentro);
		for(Cuestionario cuestionario: cuestionarios){
			
			CuestionarioVO cuestionarioVO = Mapper.toVO(cuestionario);
			ActividadVO actividadVO = Mapper.toVO(actividadDAO.getByCentroCuestionario(idCentro, cuestionario.getId()));
			cuestionarioVO.setActividad(actividadVO);
			
			int resueltos = actividadResueltaDAO.actividadesConcluidas(actividadVO.getId());
			cuestionarioVO.setResueltos(resueltos);
			
			resp.add(cuestionarioVO);
		}
		
		return resp;
	}


	@Override
	public ActividadResueltaVO saveActividadResuelta(ActividadResueltaVO actividadResueltaVO) {
		try {
			ActividadResuelta actividadResuelta = Mapper.toEntity(actividadResueltaVO);
			actividadResueltaVO = Mapper.toVO(actividadResueltaDAO.save(actividadResuelta));
		} catch (Exception e) {
			LOGGER.error("Error ",e);
		}
		return actividadResueltaVO;
	}
	
	@Override
	public PreguntaResueltaVO savePregunta(PreguntaResueltaVO preguntaResueltaVO) {
		
		try {
			PreguntaResuelta preguntaResuelta = Mapper.toEntity(preguntaResueltaVO);
			PreguntaResuelta preguntaResueltaOld = preguntaResueltaDAO.getByActividadPregunta(preguntaResuelta.getIdActividadResuelta(), preguntaResuelta.getIdPregunta());
			
			if(preguntaResueltaOld != null) {
				preguntaResuelta.setId(preguntaResueltaOld.getId());
				preguntaResueltaVO = Mapper.toVO(preguntaResueltaDAO.update(preguntaResuelta));
			}else {
				preguntaResueltaVO = Mapper.toVO(preguntaResueltaDAO.save(preguntaResuelta));
			}
			
		} catch (Exception e) {
			LOGGER.error("Error al guardar la respuesta",e);
		}
		return preguntaResueltaVO;
	}


	@Override
	public ActividadResueltaVO endActividadResuelta(Integer id) {
		
		ActividadResueltaVO resp = null;
		ActividadResuelta actividadTmp = actividadResueltaDAO.find(id);
		actividadTmp.setEstatus(2);
		
		resp = Mapper.toVO(actividadResueltaDAO.update(actividadTmp));
		
		return resp;
	}


	@Override
	public int cuestionariosResueltos() {
		return actividadResueltaDAO.actividadesConcluidasGeneral();
	}


}
