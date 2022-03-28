package com.teknei.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.teknei.admin.bsn.CuestionariosManager;
import com.teknei.vo.CuestionarioVO;

@Controller
public class CuestionariosController {
	
	@Autowired
	private CuestionariosManager cuestionariosManager;
	
	@RequestMapping(value = "/cuestionarios", method = RequestMethod.GET)
	public String cuestionarios(Model model, HttpServletRequest request) {
		return "cuestionarios";
	}
	
	@RequestMapping(value = "/cuestionarios/cuestionario", method = RequestMethod.GET)
	public String cuestionario(Model model, HttpServletRequest request, @RequestParam(value = "param1", required = true) Integer idCuestionario) {
		
		CuestionarioVO cuestionario = cuestionariosManager.getCustonarioCompleto(idCuestionario); 
		model.addAttribute("cuestionario",cuestionario);
		
		return "cuestionario";
	}

}
