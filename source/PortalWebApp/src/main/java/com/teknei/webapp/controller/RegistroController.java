package com.teknei.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RegistroController {
	
	private static final Logger LOGGER = Logger.getLogger(RegistroController.class);
	
	@RequestMapping(value = "'/registro/registro", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> updateFuncionario(Model model, HttpServletRequest request) {

		List<Object> resp = new ArrayList<Object>();
		
		try {
			String emailStr = request.getParameter("funcionario");
			String pwdStr = request.getParameter("funcionario");
			
			
			
		} catch (Exception e) {
			LOGGER.error("Ourrio un error en el registro				error:	",e);
		}
		
		return resp;

	}

}
