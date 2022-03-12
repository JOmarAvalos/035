package com.teknei.webapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/logout")
public class LogoutController {
	
    @RequestMapping(value = {"", "/"})
    public String logout(HttpServletRequest request) {
    	
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		String empresaCVE = "";
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			
			empresaCVE = (String)request.getSession(false).getAttribute("empresa");
		}    	
    	
        SecurityContextHolder.clearContext();
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        
        if(!empresaCVE.isEmpty())
        	return "redirect:" + "/?param=" + empresaCVE;
        
        return "redirect:" + "/";
    }

}