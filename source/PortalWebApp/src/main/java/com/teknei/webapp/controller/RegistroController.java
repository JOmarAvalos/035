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

import com.teknei.admin.bsn.ActividadManager;
import com.teknei.admin.bsn.CentroTrabajoManager;
import com.teknei.admin.bsn.CuestionariosManager;
import com.teknei.security.bsn.UsersManager;
import com.teknei.util.Constants;
import com.teknei.util.Util;
import com.teknei.vo.ActividadVO;
import com.teknei.vo.CentroTrabajoVO;
import com.teknei.vo.CuestionarioVO;
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
	private ActividadManager actividadManager;

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
					sb.append("http://localhost:8080/035/cuestionarios?param=");
					sb.append(centro.getIdCrypt());
					
					String url = URLEncoder.encode(sb.toString(), StandardCharsets.UTF_8.toString());
					envioCorreoPasos(usuarioVO);
					envioCorreoUrl_1_15(usuarioVO, url);
					
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
		sbResp.append("https://app.035.com.mx/035/");
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
					.replaceAll(Pattern.quote("{url}"), Matcher.quoteReplacement(generaLink(user)))
					.replaceAll(Pattern.quote("{numContrato}"), user.getUsuario());

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
			String asunto = "Instrucciones para difusi\u00F3n de cuestionarios y compra de resultados";
			String shtml = "";
			
			DateFormat df = new SimpleDateFormat("dd//MM/yyyy");

			String fchLimite = df.format(Util.calculaFecha(user.getCreacion(), 10)); 

			shtml = ReadFileForEmail.getFile(rutaHtml + emailFile)
					.replaceAll(Pattern.quote("{numContrato}"), user.getUsuario())
					.replaceAll(Pattern.quote("{fechaDescarga}"), fchLimite)
					;

			email.sendEmail(notificacionFrom, lstEmail, asunto, shtml);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	private void envioCorreoUrl_1_15(UsuarioVO user, String url) {

		try {
			String emailFile = ReadFileForEmail.EMAIL_CUESTIONARIOS_1_15;
			String urlBG = "";
			String color = "";
			String notificacionFrom = "noreply@035.com.mx";
			List<String> lstEmail = new ArrayList<String>();
			lstEmail.add(user.getEmail());
			EMailService email = new EMailService(mailUser, pass, smtp, tsl, port, login);
			String asunto = "Conteste el cuestionario de la Norma 035 ";
			String shtml = "";

			shtml = ReadFileForEmail.getFile(rutaHtml + emailFile)
					.replaceAll(Pattern.quote("{url}"), Matcher.quoteReplacement(url))
					.replaceAll(Pattern.quote("{numContrato}"), user.getUsuario());

			email.sendEmail(notificacionFrom, lstEmail, asunto, shtml);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	private void envioCorreoUrl_16_mas(UsuarioVO user, String url) {

		try {
			String emailFile = ReadFileForEmail.EMAIL_CUESTIONARIOS_16_MAS;
			String urlBG = "";
			String color = "";
			String notificacionFrom = "noreply@035.com.mx";
			List<String> lstEmail = new ArrayList<String>();
			lstEmail.add(user.getEmail());
			EMailService email = new EMailService(mailUser, pass, smtp, tsl, port, login);
			String asunto = "Conteste el cuestionario de la Norma 035 ";
			String shtml = "";

			shtml = ReadFileForEmail.getFile(rutaHtml + emailFile)
					.replaceAll(Pattern.quote("{url}"), Matcher.quoteReplacement(url))
					.replaceAll(Pattern.quote("{numContrato}"), user.getUsuario());

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
				sb.append("https://app.035.com.mx/035/cuestionarios?param=");
				sb.append(URLEncoder.encode(centro.getIdCrypt(), StandardCharsets.UTF_8.toString()));
				
				envioCorreoPasos(usuarioCorpVO);
				
				if(centro.getEmpleadoNumero() <= 15) {
					envioCorreoUrl_1_15(usuarioCorpVO, sb.toString());
				}else {
					envioCorreoUrl_16_mas(usuarioCorpVO, sb.toString());
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
		} catch (Exception e) {
			return "redirect:/";
		}
	}
	
//	@RequestMapping(value = "/registro/descargaCuestionarios", method = RequestMethod.GET)
//	public String descargaCuestionarios(Model model, HttpServletRequest request, HttpServletResponse response, 
//		@RequestParam(value = "param1", required = true) Integer idCuestionario,
//		@RequestParam(value = "param2", required = true) Integer idCentroTrabajo) {
//
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//
//		if (!(auth instanceof AnonymousAuthenticationToken)) {
//			LOGGER.info("***************************************** descargaCuestionarios paso 1 version 100");
//			try {
//				
//				DateFormat df = new SimpleDateFormat("ddMMyyyyHHmmss");
//				
//				XSSFWorkbook workbook = new XSSFWorkbook();
//				XSSFSheet sheet = workbook.createSheet("Cuestionarios");
//
//				// Se crea el archivo temporal
//				File file = new File("/home/com035/webapp/tmpFile/Cuestionarios"+df.format(new Date())+".xlsx");
//			
//				int rowCount = 0;
//				List<String[]> lineasDSC = null;
//				
//				// Se crea la lista de contenido de la hoja
//				if(idCuestionario == 1) {
//					lineasDSC = cuestionariosManager.getCuestionarioTipo1Descarga(idCuestionario, idCentroTrabajo);
//				} else if (idCuestionario == 2) {
//					lineasDSC = cuestionariosManager.getCuestionarioTipo2Descarga(idCuestionario, idCentroTrabajo);
//				} else if (idCuestionario == 3) {
//					lineasDSC = cuestionariosManager.getCuestionarioTipo3Descarga(idCuestionario, idCentroTrabajo);
//				}
//				
//				
//				for (String[] linea : lineasDSC) {
//					Row row = sheet.createRow(rowCount++);
//					int columnCount = 0;
//					for (String field : linea) {
//						Cell cell = row.createCell(columnCount++);
//						if (field instanceof String) {
//							cell.setCellValue((String) field);
//						}
//					}
//				}
//				
//				File fileOld = new File("/home/com035/webapp/tmpFile/Cuestionarios.xlsx");
//				FileOutputStream outputStream = new FileOutputStream(file);
//				workbook.write(outputStream);
//				workbook.close();
//				
//				outputStream.flush();
//				outputStream.close();
//
//
//				FileInputStream fileInputStream = new FileInputStream(fileOld);
//				String contentType = fileOld.toURL().openConnection().getContentType();
//				byte[] outArray = IOUtils.toByteArray(fileInputStream);
//				response.setContentType(contentType);
//				response.setContentLength(outArray.length);
//				response.setHeader("Expires:", "0");
//				response.setHeader("Content-Disposition", "attachment; filename=" + fileOld.getName());
//				response.getOutputStream().write(outArray);
//				response.getOutputStream().flush();
//				response.getOutputStream().close();
//				response.flushBuffer();
//
//				file.delete();
//			
//			} catch (Exception ex) {
//				
//				ex.printStackTrace();
//				LOGGER.error("Ocurrio un error en descargaCuestionarios", ex);
//				String result = "No se pudo descargar el archivo";
//				try {
//					response.getOutputStream().write(result.getBytes());
//					response.getOutputStream().flush();
//					response.getOutputStream().close();
//					response.flushBuffer();
//				} catch (IOException e) {
//					LOGGER.error("Ocurrio un error al cerrar el recurso", e);
//				}
//				
//			}
//		} 
//		return null;
//	}
	
	@RequestMapping(value = "/registro/descargaCuestionarios", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> descargaCuestionarios(Model model, HttpServletRequest request, HttpServletResponse response, 
		@RequestParam(value = "param1", required = true) Integer idCuestionario,
		@RequestParam(value = "param2", required = true) Integer idCentroTrabajo) {

		List<Object> resp = new ArrayList<Object>();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

			UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsuario());
			LOGGER.info("***************************************** descargaCuestionarios paso 1 version Mail");
			try {
				
				CuestionarioVO cuestionario =  cuestionariosManager.find(idCuestionario);
				CentroTrabajoVO centro =  centroTrabajoManager.find(idCentroTrabajo);
				UsuarioVO usuario = usersManager.getUser(centro.getIdUsuarioCrea());

				DateFormat df = new SimpleDateFormat("ddMMyyyyHHmmss");
				
				XSSFWorkbook workbook = new XSSFWorkbook();
				XSSFSheet sheet = workbook.createSheet("Cuestionarios");

				// Se crea el archivo temporal
				File file = new File("Cuestionarios_"+usuario.getUsuario()+idCuestionario+".xlsx");
			
				int rowCount = 0;
				List<String[]> lineasDSC = null;
				
				// Se crea la lista de contenido de la hoja
				if(idCuestionario == 1) {
					lineasDSC = cuestionariosManager.getCuestionarioTipo1Descarga(idCuestionario, idCentroTrabajo);
				} else if (idCuestionario == 2) {
					lineasDSC = cuestionariosManager.getCuestionarioTipo2Descarga(idCuestionario, idCentroTrabajo);
				} else if (idCuestionario == 3) {
					lineasDSC = cuestionariosManager.getCuestionarioTipo3Descarga(idCuestionario, idCentroTrabajo);
				}
				
				
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
				
				outputStream.flush();
				outputStream.close();
				
				
				enviaEmailBaseDatos(usuarioVO.getEmail(), cuestionario.getNombre(), usuario.getUsuario(), file);


				file.delete();
			
				resp.add(true);
			} catch (Exception ex) {
				LOGGER.error("Ocurrio un error en el envio de cuestionarios: 		error",ex);
				resp = new ArrayList<Object>();
				resp.add(false);
			}
		} 
		return resp;
	}
	
	private void envioCorreoRecupera(UsuarioVO user) {

		try {
			String emailFile = ReadFileForEmail.EMAIL_RECUPERA;
			String urlBG = "";
			String color = "";
			String notificacionFrom = "noreply@035.com.mx";
			List<String> lstEmail = new ArrayList<String>();
			lstEmail.add(user.getEmail());
			EMailService email = new EMailService(mailUser, pass, smtp, tsl, port, login);
			String asunto = "Recuperación de contraseña ";
			String shtml = "";

			shtml = ReadFileForEmail.getFile(rutaHtml + emailFile)
					.replaceAll(Pattern.quote("{url}"), Matcher.quoteReplacement(generaLinkRecupera(user)))
					.replaceAll(Pattern.quote("{numContrato}"), user.getUsuario());

			email.sendEmail(notificacionFrom, lstEmail, asunto, shtml);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	private String generaLinkRecupera(UsuarioVO usuario){
		StringBuilder sbResp = new StringBuilder();
		sbResp.append("https://app.035.com.mx/035/");
		sbResp.append("registro/confimaRecupera?param1=");
		sbResp.append(usuario.getUsuario());
		sbResp.append("&param2=");
		sbResp.append(usuario.getContrasena());
		return sbResp.toString();
	}
	
	@RequestMapping(value = "/registro/recuperaC", method = RequestMethod.POST)
	public String recuperaC(Model model, HttpServletRequest request, HttpServletResponse response) {

		
		String usuario = request.getParameter("iptHidenUsr");
		String contrasena = request.getParameter("iptHidenPwd");
		String contrasenaNew = request.getParameter("password");
		
		UsuarioVO usuarioCorpVO = usersManager.getByUsrPwd(usuario, contrasena);
		
		try {
			if(usuarioCorpVO != null) {
				
					
					BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
					String pwd = passwordEncoder.encode(contrasenaNew);

					usuarioCorpVO.setBanActivo(Constants.BAN_ACTIVO);
					usuarioCorpVO.setEstatus(Constants.BAN_ACTIVO);
					usuarioCorpVO.setContrasena(pwd);
					
					usuarioCorpVO = usersManager.updateUser(usuarioCorpVO);
				
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
	
	@RequestMapping(value = "/registro/recuperapwd", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> recuperapwd(Model model, HttpServletRequest request, @RequestParam(value = "param", required = true) String contrato) {

		List<Object> resp = new ArrayList<Object>();
		
		try {
			
			contrato = contrato.replaceAll(" ","").trim();
			
			UsuarioVO usuario = usersManager.getUser(contrato);
			
			if(usuario != null) {
				envioCorreoRecupera(usuario);

				resp.add(true);
			}else {
				resp.add(false);
			}
			
			
			
			
		} catch (Exception e) {
			LOGGER.error("Ourrio un error en el registro				error:	",e);
			resp = new ArrayList<Object>();
			resp.add(false);
		}
		
		return resp;

	}
	
	@RequestMapping(value = "/registro/confimaRecupera", method = RequestMethod.GET)
	public String confimaRecupera(Model model, HttpServletRequest request, HttpServletResponse response, 
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
					return "confirmaRecuperaPwd";
				}else {
					return "notFound";
				}
			} catch (Exception e) {
				return "notFound";
			}
		}
	}
	
	private void enviaEmailBaseDatos(String mail, String cuestionario, String contrato, File adjunto) {
		try {
			String emailFile = ReadFileForEmail.EMAIL_BASE_DATOS;
			String notificacionFrom = "noreply@035.com.mx";
			List<String> lstEmail = new ArrayList<String>();
			lstEmail.add(mail);
			EMailService email = new EMailService(mailUser, pass, smtp, tsl, port, login);
			String asunto = "Base de datos nom035 "+cuestionario;
			
			asunto = asunto.replaceAll("á","\\u00E1");
			String shtml = "";

			shtml = ReadFileForEmail.getFile(rutaHtml + emailFile)
					.replaceAll(Pattern.quote("{cuestionario}"), cuestionario)
					.replaceAll(Pattern.quote("{contrato}"), contrato);

//			email.sendEmail(notificacionFrom, lstEmail, asunto, shtml);
			
			email.sendEmailAdjuntoB(notificacionFrom, lstEmail, asunto, shtml, adjunto,null,null);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/registro/terminaCuestionarios", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> cierraCuestionarios(Model model, HttpServletRequest request) {

		List<Object> resp = new ArrayList<Object>();
		
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();

			if (!(auth instanceof AnonymousAuthenticationToken)) {
				
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

				UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsuario());
				
				CentroTrabajoVO centroTrabajo = centroTrabajoManager.getByUuario(usuarioVO.getId());
				
				if(centroTrabajo != null){
					
					List<CuestionarioVO> cuestionarios = cuestionariosManager.getCuestionariosByCentro(centroTrabajo.getId());
					
					if(cuestionarios != null) {
						for(CuestionarioVO cuestionario: cuestionarios) {
							ActividadVO actividad =  cuestionario.getActividad();
							actividad.setFin(new Date());
							actividadManager.save(actividad);
							
						}
					}
					
				}
				
				resp.add(true);
				
			}
			
		} catch (Exception e) {
			LOGGER.error("Ourrio un error				error:	",e);
			resp = new ArrayList<Object>();
			resp.add(false);
		}
		
		return resp;

	}

	
}
