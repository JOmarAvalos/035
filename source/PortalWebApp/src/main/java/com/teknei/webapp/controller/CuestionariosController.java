package com.teknei.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teknei.admin.bsn.CuestionariosManager;
import com.teknei.vo.CuestionarioVO;

@Controller
public class CuestionariosController {
	
	@Autowired
	private CuestionariosManager cuestionariosManager;
	
	@RequestMapping(value = "/cuestionario", method = RequestMethod.GET)
	public String welcome(Model model, HttpServletRequest request) {
		return "cuestionarios";
	}
	
	@RequestMapping(value = "/cuestionarios", method = RequestMethod.GET)
	public String cuestionario(Model model, HttpServletRequest request) {
		
		CuestionarioVO cuestionario = cuestionariosManager.getCustonarioCompleto(1); 
		model.addAttribute("cuestionario",cuestionario);
		
		return "cuestionarios";
	}

}
