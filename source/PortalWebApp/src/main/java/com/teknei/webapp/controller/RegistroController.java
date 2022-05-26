package com.teknei.webapp.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.RememberMeServices;
import org.springframework.security.web.authentication.session.CompositeSessionAuthenticationStrategy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teknei.admin.bsn.CentroTrabajoManager;
import com.teknei.security.bsn.UsersManager;
import com.teknei.util.Constants;
import com.teknei.vo.CentroTrabajoVO;
import com.teknei.vo.UsuarioVO;
import com.teknei.webapp.utils.EMailService;
import com.teknei.webapp.utils.ReadFileForEmail;

@Controller
public class RegistroController {
	
	private static final Logger LOGGER = Logger.getLogger(RegistroController.class);
	
	@Autowired
	private UsersManager usersManager;
	@Autowired
	private CentroTrabajoManager centroTrabajoManager;
	
	@Autowired
	CompositeSessionAuthenticationStrategy strategy;
	@Autowired
	RememberMeServices rememberMeServices;
	@Autowired
	UserDetailsService userDetailsService;

	
	@Value("${app.035.mail.user}")
	private String mailUser;
	@Value("${app.035.mail.pass}")
	private String pass;
	@Value("${app.035.mail.smtp}")
	private String smtp;
	@Value("${app.035.mail.tsl}")
	private String tsl;
	@Value("${app.035.mail.port}")
	private String port;
	@Value("${app.035.mail.login}")
	private String login;
	@Value("${app.035.mail.template}")
	private String rutaHtml;

	
	@RequestMapping(value = "/registro/registro", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> registro(Model model, HttpServletRequest request, @RequestBody UsuarioVO usuario) {

		List<Object> resp = new ArrayList<Object>();
		
		try {
			
			
			 BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			 String pwd = passwordEncoder.encode(usuario.getContrasena());
			 
			 usuario.setContrasena(pwd);
			 usuario.setCreacion(new Date());
			 usuario.setUsuario(usuario.getEmail());
			 usuario.setIdPerfil(Constants.ID_PERFIL_CLIENTE);
			 usuario.setIdUsuarioCrea(0);
			 usuario.setBanActivo(Constants.BAN_INACTIVO);
			 usuario.setEstatus(Constants.BAN_INACTIVO);
			 
			 usuario = usersManager.addUser(usuario);
			 
			 envioCorreoConfirmacion(usuario);

			resp.add(true);
			
			
			
		} catch (Exception e) {
			LOGGER.error("Ourrio un error en el registro				error:	",e);
			resp = new ArrayList<Object>();
			resp.add(false);
		}
		
		return resp;

	}
	
	@RequestMapping(value = "/registro/updateUsuario", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> actualizaUsuario(Model model, HttpServletRequest request, @RequestBody UsuarioVO usuario) {

		List<Object> resp = new ArrayList<Object>();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			try {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

				UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsuario());
				
				usuarioVO.setNombre(usuario.getNombre());
				usuarioVO.setIdUsuarioModifica(usuarioVO.getId());
				usuarioVO.setModificacion(new Date());
				
				usersManager.updateUser(usuarioVO);

				resp.add(true);
				
				
				
			} catch (Exception e) {
				LOGGER.error("Ourrio un error al actualizar el perfil				error:	",e);
				resp = new ArrayList<Object>();
				resp.add(false);
			}
		}
		
		return resp;

	}
	
	@RequestMapping(value = "/registro/updateCentro", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> actualizaCentro(Model model, HttpServletRequest request, @RequestBody CentroTrabajoVO centro) {

		List<Object> resp = new ArrayList<Object>();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			try {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

				UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsuario());
				
				if(centro.getId() != null) {
					centro.setIdUsuarioModifica(usuarioVO.getId());
					centro.setModificacion(new Date());
					centroTrabajoManager.save(centro);
				}else{
					centro.setIdUsuarioCrea(usuarioVO.getId());
					centro.setCreacion(new Date());
					centro.setIdUsuario(usuarioVO.getId());
					centro.setBanActivo(Constants.BAN_ACTIVO);
					centro = centroTrabajoManager.save(centro);
					
					
					
					StringBuilder sb = new StringBuilder();
					sb.append("http://localhost:8080/Admin035/cuestionarios?param=");
					sb.append(centro.getIdCrypt());
					
					String url = URLEncoder.encode(sb.toString(), StandardCharsets.UTF_8.toString());
					envioCorreoPasos(usuarioVO);
					envioCorreoUrl(usuarioVO, url);
					
				}
				
				

				resp.add(true);
				
				
				
			} catch (Exception e) {
				LOGGER.error("Ourrio un error al actualizar el centro				error:	",e);
				resp = new ArrayList<Object>();
				resp.add(false);
			}
		}
		
		return resp;

	}

	private String generaLink(UsuarioVO usuario){
		StringBuilder sbResp = new StringBuilder();
		sbResp.append("https://app.035.com.mx/Admin035/");
		sbResp.append("registro/confimaCorreo?param1=");
		sbResp.append(usuario.getEmail());
		sbResp.append("&param2=");
		sbResp.append(usuario.getContrasena());
		return sbResp.toString();
	}
	
	private void envioCorreoConfirmacion(UsuarioVO user) {

		try {
			String emailFile = ReadFileForEmail.EMAIL;
			String urlBG = "";
			String color = "";
			String notificacionFrom = "noreply@035.com.mx";
			List<String> lstEmail = new ArrayList<String>();
			lstEmail.add(user.getEmail());
			EMailService email = new EMailService(mailUser, pass, smtp, tsl, port, login);
			String asunto = "Bienvenido a 035 ";
			String shtml = "";

			shtml = ReadFileForEmail.getFile(rutaHtml + emailFile)
					.replaceAll(Pattern.quote("{url}"), Matcher.quoteReplacement(generaLink(user)));

			email.sendEmail(notificacionFrom, lstEmail, asunto, shtml);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}


	private void envioCorreoPasos(UsuarioVO user) {

		try {
			String emailFile = ReadFileForEmail.EMAIL_INSTRUCCIONES;
			String urlBG = "";
			String color = "";
			String notificacionFrom = "noreply@035.com.mx";
			List<String> lstEmail = new ArrayList<String>();
			lstEmail.add(user.getEmail());
			EMailService email = new EMailService(mailUser, pass, smtp, tsl, port, login);
			String asunto = "Bienvenido a 035 ";
			String shtml = "";

			shtml = ReadFileForEmail.getFile(rutaHtml + emailFile);

			email.sendEmail(notificacionFrom, lstEmail, asunto, shtml);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	private void envioCorreoUrl(UsuarioVO user, String url) {

		try {
			String emailFile = ReadFileForEmail.EMAIL_CUESTIONARIOS;
			String urlBG = "";
			String color = "";
			String notificacionFrom = "noreply@035.com.mx";
			List<String> lstEmail = new ArrayList<String>();
			lstEmail.add(user.getEmail());
			EMailService email = new EMailService(mailUser, pass, smtp, tsl, port, login);
			String asunto = "Bienvenido a 035 ";
			String shtml = "";

			shtml = ReadFileForEmail.getFile(rutaHtml + emailFile)
					.replaceAll(Pattern.quote("{url}"), Matcher.quoteReplacement(url));

			email.sendEmail(notificacionFrom, lstEmail, asunto, shtml);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/registro/validaMail", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> validaMail(Model model, HttpServletRequest request,
			@RequestParam(value = "mail", required = true) String mail) {

		List<Object> resp = new ArrayList<Object>();
		try {
			
			boolean valido = true;
			UsuarioVO usuario =  usersManager.getUserByMail(mail.toUpperCase());
			if(usuario != null) {
				valido = false; 
			}
			resp.add(valido);
			
		} catch (Exception e) {
			resp = new ArrayList<Object>();
			resp.add(false);
			LOGGER.error("Ocurrio un error al obtener las coincidencias de RFC ", e);
		}
		return resp;
	}
	
	@RequestMapping(value = "/registro/confimaCorreo", method = RequestMethod.GET)
	public String welcome(Model model, HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(value = "param1", required = true) String usuario, 
			@RequestParam(value = "param2", required = true) String contrasena) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
//			UserDetails userDetail = (UserDetails) auth.getPrincipal();
//			UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

//			UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsuario());
			
			return "redirect:/";
		} else {
			UsuarioVO usuarioCorpVO = usersManager.getByUsrPwd(usuario, contrasena);
			
			if(usuarioCorpVO != null) {
				
				if(usuarioCorpVO.getEstatus() == Constants.BAN_INACTIVO) {
					usuarioCorpVO.setBanActivo(Constants.BAN_ACTIVO);
					usuarioCorpVO.setEstatus(Constants.BAN_ACTIVO);
					usuarioCorpVO = usersManager.updateUser(usuarioCorpVO);
				}
				UserDetails userDetails = userDetailsService.loadUserByUsername(usuarioCorpVO.getUsuario());
				RememberMeAuthenticationToken rememberMeAuthenticationToken = new RememberMeAuthenticationToken("remember_me", userDetails, userDetails.getAuthorities());
				
				rememberMeServices.loginSuccess(request, response, rememberMeAuthenticationToken);
				
				Authentication authenticatedUser = rememberMeAuthenticationToken;
				
				strategy.onAuthentication(authenticatedUser, request, response);
				
				SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
				
				return "redirect:/";
			}else {
				return "redirect:/";
			}
		}
	}
	
}
