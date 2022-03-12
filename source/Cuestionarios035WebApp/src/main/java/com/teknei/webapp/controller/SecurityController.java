package com.teknei.webapp.controller;

import static com.teknei.common.webapp.RequestUtils.getLocalisedResource;
import static com.teknei.common.webapp.RequestUtils.getRememberMeTargetUrlFromSession;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.teknei.security.bsn.UsersManager;
import com.teknei.vo.UsuarioVO;

@Controller
public class SecurityController {
	
	private static final Logger LOGGER = Logger.getLogger(SecurityController.class);
	
	private static final String LOGIN_VIEW = "appLogin";
	
	private static final String HOME_VIEW = "perfil";
	
	private static final String UNAUTHORIZED_VIEW = "unauthorized";
	
	@Autowired
	private UsersManager usersManager;
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome(Model model, HttpServletRequest request) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");
			
			UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsername());
			
			String empresaCVE = (String)request.getSession(false).getAttribute("empresa");
			
			String locale = request.getParameter("locale");
			if(locale == null) {
				locale = getLocalisedResource(messageSource, "app.general.locale");
			}

			request.getSession(false).setAttribute("locale", locale);
			
			
			
			return HOME_VIEW;

		} else {
			
			
			return LOGIN_VIEW;
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			HttpServletRequest request, Model model) {

		if (error != null) {
			if(error.equals("sessionExpiredDuplicateLogin")) {
				model.addAttribute("error", getLocalisedResource(messageSource, "login.invalid_session.duplicated"));
			}else {
				model.addAttribute("error", getLocalisedResource(messageSource, "login.error_login"));
			}
			
			String targetUrl = getRememberMeTargetUrlFromSession(request);
			
			if(StringUtils.hasText(targetUrl)) {
				model.addAttribute("targetUrl", targetUrl);
				model.addAttribute("loginUpdate", true);
			}
		}

		if (logout != null) {
			model.addAttribute("msg", getLocalisedResource(messageSource, "login.logout_message"));
		}
		
		
		return LOGIN_VIEW;
	}

	@RequestMapping(value = "/unauthorized", method = RequestMethod.GET)
	public String accesssDenied(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			model.addAttribute("username", userDetail.getUsername());
		}
		
		model.addAttribute("pageTitle", getLocalisedResource(messageSource, "app.error.403_header"));
		
		return UNAUTHORIZED_VIEW;
	}
	
}
