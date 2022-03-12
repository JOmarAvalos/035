package com.teknei.common.webapp.interceptor;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.teknei.security.bsn.UsersManager;
import com.teknei.vo.UsuarioVO;

/**
 * Interceptor for managing needed information in session
 */
public class SessionHandlerInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger LOGGER = Logger.getLogger(SessionHandlerInterceptor.class);
	private static final String ATTR_MODULO_CURSO = "authorityCurso";
	private static final String ATTR_MODULO_CATALOGOS = "authorityCatalogos";
	private static final String ATTR_MODULO_USUARIOS = "authorityUsuarios";
	private static final String ATTR_MODULO_LMS = "authorityLMS";
	private static final String ATTR_MODULO_CALENDARIO = "authorityCalendario";
	private static final String ATTR_MODULO_FUNCIONARIOS = "authorityFuncionarios";
	private static final String ATTR_MODULO_REPORTES = "authorityReportes";
	private static final String ATTR_MODULO_CONTACTO = "authorityContacto";
	
	@Autowired
	private UsersManager usersManager;

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			setUserInformation(request, userDetail.getUsername(),auth);
			String requestUrl = request.getRequestURL().toString();
			
		}
		
		return true;
	}
	
	protected void setUserInformation(HttpServletRequest request, String userName, Authentication auth) {
		try {
			if(request.getSession(false).getAttribute("currentUser") == null) {
				LOGGER.info("User information not found in session");
				UsuarioVO currentUser = usersManager.getUser(userName);
				
				if(currentUser.getLstAutoridades() == null) {
					currentUser.setLstAutoridades(new ArrayList<String>());
					for(GrantedAuthority ga : auth.getAuthorities())
						currentUser.getLstAutoridades().add(ga.getAuthority());
//					request.getSession(false).setAttribute("currentUser", currentUser2);
				}
				
				request.getSession(false).setAttribute("currentUser", currentUser);
				LOGGER.info("User information in session updated");
			}else {
				UsuarioVO currentUser2 = (UsuarioVO) request.getSession(false).getAttribute("currentUser");
				
				if(currentUser2.getId()==null)
				{
					UsuarioVO currentUser = usersManager.getUser(userName);
					currentUser2.setId(currentUser.getId());
				}
				
				
				if(currentUser2.getLstAutoridades() == null) {
					currentUser2.setLstAutoridades(new ArrayList<String>());
					for(GrantedAuthority ga : auth.getAuthorities())
						currentUser2.getLstAutoridades().add(ga.getAuthority());
					request.getSession(false).setAttribute("currentUser", currentUser2);
				}

				request.getSession(false).setAttribute("currentUser", currentUser2);
				LOGGER.info("User information in session updated");
			}
		}catch(Exception e) {
			LOGGER.warn("Error getting user information: " + e.getMessage(), e);
		}
			
	}
	
	
}
