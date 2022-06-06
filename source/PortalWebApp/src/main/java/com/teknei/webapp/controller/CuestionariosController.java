package com.teknei.webapp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teknei.admin.bsn.CuestionariosManager;
import com.teknei.util.Constants;
import com.teknei.util.StringEncrypt;
import com.teknei.vo.ActividadResueltaVO;
import com.teknei.vo.CuestionarioVO;
import com.teknei.vo.PreguntaResueltaVO;
import com.teknei.vo.UsuarioVO;

@Controller
public class CuestionariosController {
	
	private static final Logger LOGGER = Logger.getLogger(CuestionariosController.class);
	
	@Autowired
	private CuestionariosManager cuestionariosManager;
	
	@RequestMapping(value = "/cuestionariosOld", method = RequestMethod.GET)
	public String cuestionarios(Model model, HttpServletRequest request, 
			@RequestParam(value = "param", required = false) String param, 
			@RequestParam(value = "param2", required = false) Integer param2) {
		
		try {
			Integer id = Integer.valueOf(StringEncrypt.decrypt(StringEncrypt.KEY, StringEncrypt.IV, param));
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "cuestionarios";
	}
	
	@RequestMapping(value = "/cuestionarios", method = RequestMethod.GET)
	public String cuestionariosCentro(Model model, HttpServletRequest request, 
			@RequestParam(value = "param", required = true) String param) {
		
		try {
			Integer id = Integer.valueOf(StringEncrypt.decrypt(StringEncrypt.KEY, StringEncrypt.IV, param));
			
			List<CuestionarioVO> cuestonanrios =  cuestionariosManager.getCuestionariosByCentro(id);
			
			model.addAttribute("cuestionarios", cuestonanrios);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "cuestionarios";
	}
	
	@RequestMapping(value = "/cuestionarios/cuestionario", method = RequestMethod.GET)
	public String cuestionario(Model model, HttpServletRequest request, @RequestParam(value = "param1", required = true) String param, 
			@RequestParam(value = "param2", required = true) String param2) {
		
		try {
			Integer idCuestionario = Integer.valueOf(StringEncrypt.decrypt(StringEncrypt.KEY, StringEncrypt.IV, param));
			Integer idActividad = Integer.valueOf(StringEncrypt.decrypt(StringEncrypt.KEY, StringEncrypt.IV, param2));
			
			CuestionarioVO cuestionario = cuestionariosManager.getCustonarioCompleto(idCuestionario, idActividad); 
			model.addAttribute("cuestionario",cuestionario);
		} catch (Exception e) {
			model.addAttribute("errorCuest","Error");
		}
		
		return "cuestionario";
	}
	
	@RequestMapping(value = "/cuestionarios/saveActividad", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> registroActividad(Model model, HttpServletRequest request, @RequestBody ActividadResueltaVO actividadResueltaVO) {

		List<Object> resp = new ArrayList<Object>();
		
		try {
			
			actividadResueltaVO.setCreacion(new Date());
			actividadResueltaVO.setEstatus(1);
			actividadResueltaVO = cuestionariosManager.saveActividadResuelta(actividadResueltaVO);
			
			
			resp.add(true);
			resp.add(actividadResueltaVO.getId());
			
			
			
		} catch (Exception e) {
			LOGGER.error("Ourrio un error en el registro				error:	",e);
			resp = new ArrayList<Object>();
			resp.add(false);
		}
		
		return resp;

	}
	
	@RequestMapping(value = "/cuestionarios/saveRepuesta", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> saveRepuesta(Model model, HttpServletRequest request, @RequestBody PreguntaResueltaVO preguntaResueltaVO) {

		List<Object> resp = new ArrayList<Object>();
		
		try {
			
			preguntaResueltaVO.setCreacion(new Date());
			cuestionariosManager.savePregunta(preguntaResueltaVO);
			
			resp.add(true);
			
		} catch (Exception e) {
			LOGGER.error("Ourrio un error en el registro				error:	",e);
			resp = new ArrayList<Object>();
			resp.add(false);
		}
		
		return resp;

	}

	@RequestMapping(value = "/cuestionarios/terminaCuestionario", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> terminaCuestionario(Model model, HttpServletRequest request, @RequestParam(value = "param", required = true) Integer param) {

		List<Object> resp = new ArrayList<Object>();
		
		try {
			
			ActividadResueltaVO actividadResueltaVO =cuestionariosManager.endActividadResuelta(param);
			
			resp.add(true);
			
		} catch (Exception e) {
			LOGGER.error("Ourrio un error en terminaCuestionario				error:	",e);
			resp = new ArrayList<Object>();
			resp.add(false);
		}
		
		return resp;

	}
}
