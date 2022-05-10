package com.teknei.admin.bsn;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teknei.admin.dao.CuestionarioDAO;
import com.teknei.admin.dao.PreguntaDAO;
import com.teknei.admin.dao.RespuestaDAO;
import com.teknei.entity.Cuestionario;
import com.teknei.entity.Pregunta;
import com.teknei.entity.Respuesta;
import com.teknei.mapper.Mapper;
import com.teknei.vo.CuestionarioVO;
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
	

	@Override
	public CuestionarioVO getCustonarioCompleto(Integer id) {
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
			resp.add(cuestionarioVO);
		}
		
		return resp;
	}
	
	

}
