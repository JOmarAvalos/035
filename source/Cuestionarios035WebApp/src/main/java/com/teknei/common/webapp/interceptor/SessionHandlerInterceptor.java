package com.teknei.common.webapp.interceptor;

import static com.teknei.common.webapp.RequestUtils.getLocalisedResource;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//import com.teknei.admin.bsn.CatalogosManager;
import com.teknei.security.bsn.UsersManager;
//import com.teknei.vo.EmpresaVO;
import com.teknei.vo.UsuarioVO;

/**
 * Interceptor for managing needed information in session
 */
public class SessionHandlerInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger LOGGER = Logger.getLogger(SessionHandlerInterceptor.class);
	
	@Autowired
	private UsersManager usersManager;
//	@Autowired
//	private CatalogosManager catalogosManager;
	@Autowired
	private MessageSource messageSource;


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
				UsuarioVO currentUser = usersManager.getUserComplete(userName);
//				UsuarioVO currentUser = usersManager.getUser(userName);
//				if(currentUser.getLstAutoridades() == null) {
//					currentUser.setLstAutoridades(new ArrayList<String>());
//					for(GrantedAuthority ga : auth.getAuthorities())
//						currentUser.getLstAutoridades().add(ga.getAuthority());
////					request.getSession(false).setAttribute("currentUser", currentUser2);
//				}
//				request.getSession(false).setAttribute("currentUser", currentUser);
//				EmpresaVO empresa = catalogosManager.getEmpresa(currentUser.getIdEmpresa());

//				request.getSession(false).setAttribute("colorPrimario", empresa.getColorPrimario());
//				request.getSession(false).setAttribute("colorSecundario", empresa.getColorSecundario());
//				request.getSession(false).setAttribute("colorContraste",empresa.getColorSecundarioAlt());
//				request.getSession(false).setAttribute("colorTexto",empresa.getColorTexto());
//				request.getSession(false).setAttribute("empresa", empresa.getClave());
//				request.getSession(false).setAttribute("contacto", empresa.getContacto());
//				LOGGER.info("User information in session updated");
//				
				
				
				String locale = request.getParameter("locale");
				if(locale == null) {
					locale = getLocalisedResource(messageSource, "app.general.locale");
				}

				request.getSession(false).setAttribute("locale", locale);
				
				
			}else {
				UsuarioVO currentUser2 = (UsuarioVO) request.getSession(false).getAttribute("currentUser");
				currentUser2 = usersManager.getUserComplete(userName);
//				if(currentUser2.getLstAutoridades() == null) {
//					currentUser2.setLstAutoridades(new ArrayList<String>());
//					for(GrantedAuthority ga : auth.getAuthorities())
//						currentUser2.getLstAutoridades().add(ga.getAuthority());
//					request.getSession(false).setAttribute("currentUser", currentUser2);
//				}
//				
//				EmpresaVO empresa = catalogosManager.getEmpresa(currentUser2.getIdEmpresa());
//
//				request.getSession(false).setAttribute("colorPrimario", empresa.getColorPrimario());
//				request.getSession(false).setAttribute("colorSecundario", empresa.getColorSecundario());
//				request.getSession(false).setAttribute("colorContraste",empresa.getColorSecundarioAlt());
//				request.getSession(false).setAttribute("colorTexto",empresa.getColorTexto());
//				request.getSession(false).setAttribute("empresa", empresa.getClave());
				LOGGER.info("User information in session updated");

				String locale = request.getParameter("locale");
				if(locale == null) {
					locale = getLocalisedResource(messageSource, "app.general.locale");
				}

				request.getSession(false).setAttribute("locale", locale);
				
			}
		}catch(Exception e) {
			LOGGER.warn("Error getting user information: " + e.getMessage(), e);
		}
			
	}
	
	
}
