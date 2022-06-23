package com.teknei.webapp.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import org.apache.commons.io.IOUtils;

import com.teknei.admin.bsn.CentroTrabajoManager;
import com.teknei.admin.bsn.CuestionariosManager;
import com.teknei.security.bsn.UsersManager;
import com.teknei.util.Constants;
import com.teknei.util.Util;
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
	private CuestionariosManager cuestionariosManager;
	
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
			
			int lastUser =  usersManager.lastUser();
			lastUser = lastUser+1;
			CentroTrabajoVO centro = usuario.getCentroTrabajoVO();

			StringBuilder contratoSB = new StringBuilder();
			
			Date fechaRegistro = new Date();
			
			DateFormat df = new SimpleDateFormat("ddMMyy");
			
			contratoSB.append(df.format(fechaRegistro));
			contratoSB.append(String.format("%02d", centro.getIdGiro()));
			contratoSB.append(String.format("%02d", centro.getIdEstadoRepublica()));
			contratoSB.append(String.format("%04d", lastUser));
			
			
			String tmpPwd = Util.getTmpPwd(12);
			
			usuario.setContrasena(tmpPwd);
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String pwd = passwordEncoder.encode(usuario.getContrasena());
			
			usuario.setContrasena(pwd);
			usuario.setCreacion(new Date());
			usuario.setUsuario(contratoSB.toString());
			usuario.setIdPerfil(Constants.ID_PERFIL_CLIENTE);
			usuario.setIdUsuarioCrea(0);
			usuario.setBanActivo(Constants.BAN_INACTIVO);
			usuario.setEstatus(Constants.BAN_INACTIVO);
			 
			usuario = usersManager.addUser(usuario);
			
			centro.setIdUsuarioCrea(usuario.getId());
			centro.setCreacion(fechaRegistro);
			centro.setIdUsuario(usuario.getId());
			centro.setBanActivo(Constants.BAN_ACTIVO);
			centro = centroTrabajoManager.save(centro);
			
			envioCorreoConfirmacion(usuario);

			resp.add(true);
			
			
			
		} catch (Exception e) {
			LOGGER.error("Ourrio un error en el registro				error:	",e);
			resp = new ArrayList<Object>();
			resp.add(false);
		}
		
		return resp;

	}
	
	@RequestMapping(value = "/registro/registroBK", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> registroBK(Model model, HttpServletRequest request, @RequestBody UsuarioVO usuario) {

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
		sbResp.append(usuario.getUsuario());
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
			String asunto = "Instrucciones para difusión de cuestionarios y compra de resultados";
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
			String asunto = "Instrucciones para resolver cuestionarios 035 ";
			String shtml = "";

			String encodeUrl = URLEncoder.encode(url,"UTF");
			shtml = ReadFileForEmail.getFile(rutaHtml + emailFile)
					.replaceAll(Pattern.quote("{url}"), Matcher.quoteReplacement(encodeUrl));

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
			List<UsuarioVO> usuarios =  usersManager.getUsersByMail(mail.toUpperCase());
			StringBuilder sb = new StringBuilder();
//			UsuarioVO usuario =  usersManager.getUserByMail(mail.toUpperCase());
			if(usuarios != null && !usuarios.isEmpty()) {
				valido = false; 
				for(UsuarioVO usuario : usuarios) {
					sb.append(usuario.getUsuario());
					sb.append("<br>");
				}
			}
			resp.add(valido);
			resp.add(sb.toString());
			
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
			
			return "notFound";
		} else {
			UsuarioVO usuarioCorpVO = usersManager.getByUsrPwd(usuario, contrasena);
			
			try {
				if(usuarioCorpVO != null) {
					
					model.addAttribute("usr", usuario);
					model.addAttribute("pwd", contrasena);
					return "confirmaPwd";
				}else {
					return "notFound";
				}
			} catch (Exception e) {
				return "notFound";
			}
		}
	}
	
	@RequestMapping(value = "/registro/confirmaContrasena", method = RequestMethod.POST)
	public String concluyeRegistro(Model model, HttpServletRequest request, HttpServletResponse response) {

		
		String usuario = request.getParameter("iptHidenUsr");
		String contrasena = request.getParameter("iptHidenPwd");
		String contrasenaNew = request.getParameter("password");
		
		UsuarioVO usuarioCorpVO = usersManager.getByUsrPwd(usuario, contrasena);
		
		try {
			if(usuarioCorpVO != null) {
				
				if(usuarioCorpVO.getEstatus() == Constants.BAN_INACTIVO) {
					
					BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
					String pwd = passwordEncoder.encode(contrasenaNew);

					usuarioCorpVO.setBanActivo(Constants.BAN_ACTIVO);
					usuarioCorpVO.setEstatus(Constants.BAN_ACTIVO);
					usuarioCorpVO.setContrasena(pwd);
					
					usuarioCorpVO = usersManager.updateUser(usuarioCorpVO);
				}
				
				CentroTrabajoVO centro = centroTrabajoManager.getByUuario(usuarioCorpVO.getId());
				
				StringBuilder sb = new StringBuilder();
				sb.append("https://app.035.com.mx/Admin035/cuestionarios?param=");
				sb.append(URLEncoder.encode(centro.getIdCrypt(), StandardCharsets.UTF_8.toString()));
				
				envioCorreoPasos(usuarioCorpVO);
				envioCorreoUrl(usuarioCorpVO, sb.toString());
				

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
		} catch (Exception e) {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/registro/descargaCuestionarios", method = RequestMethod.GET)
	public String descargaCuestionarios(Model model, HttpServletRequest request, HttpServletResponse response, 
		@RequestParam(value = "param1") Integer id) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			
			try {
				
				XSSFWorkbook workbook = new XSSFWorkbook();
				XSSFSheet sheet = workbook.createSheet("Cuestionarios");

				// Se crea el archivo temporal
				File file = new File("Cuestionarios.xlsx");
			
				int rowCount = 0;
				
				// Se crea la lista de contenido de la hoja
				List<String[]> lineasDSC = cuestionariosManager.getCuestionarioTipo1Descarga(id);
				//List<String[]> lineasDSC = cuestionariosManager.getCuestionarioTipo2Descarga(id);
				//List<String[]> lineasDSC = cuestionariosManager.getCuestionarioTipo3Descarga(id);
				
				for (String[] linea : lineasDSC) {
					Row row = sheet.createRow(rowCount++);
					int columnCount = 0;
					for (String field : linea) {
						Cell cell = row.createCell(columnCount++);
						if (field instanceof String) {
							cell.setCellValue((String) field);
						}
					}
				}
				
				FileOutputStream outputStream = new FileOutputStream(file);
				workbook.write(outputStream);
				workbook.close();

				FileInputStream fileInputStream = new FileInputStream(file);
				String contentType = file.toURL().openConnection().getContentType();
				byte[] outArray = IOUtils.toByteArray(fileInputStream);
				response.setContentType(contentType);
				response.setContentLength(outArray.length);
				response.setHeader("Expires:", "0");
				response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
				response.getOutputStream().write(outArray);
				response.getOutputStream().flush();
				response.getOutputStream().close();
				response.flushBuffer();

				file.delete();
			
			} catch (Exception ex) {
				
				ex.printStackTrace();
				LOGGER.error("Ocurrio un error en descargaCuestionarios", ex);
				String result = "No se pudo descargar el archivo";
				try {
					response.getOutputStream().write(result.getBytes());
					response.getOutputStream().flush();
					response.getOutputStream().close();
					response.flushBuffer();
				} catch (IOException e) {
					LOGGER.error("Ocurrio un error al cerrar el recurso", e);
				}
				
			}
		} 
		return null;
	}
	
}
