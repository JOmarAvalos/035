package com.teknei.webapp.controller;

import static com.teknei.common.webapp.RequestUtils.getLocalisedResource;
import static com.teknei.common.webapp.RequestUtils.getRememberMeTargetUrlFromSession;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.Console;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.jr.ob.JSON;
import com.google.gson.Gson;
//import com.teknei.admin.bsn.CalendarioManager;
//import com.teknei.admin.bsn.CatalogosManager;
//import com.teknei.admin.bsn.CursoManager;
//import com.teknei.admin.bsn.DatosPersonalesManager;
//import com.teknei.admin.bsn.EventoCalendarioManager;
//import com.teknei.admin.bsn.FuncionariosManager;
//import com.teknei.admin.bsn.MotivoCancelacionCursoManager;
//import com.teknei.admin.bsn.MotivoCancelacionManager;
//import com.teknei.admin.bsn.NotificacionManager;
import com.teknei.security.bsn.UsersManager;
//import com.teknei.admin.bsn.EventoSesionManager;
import com.teknei.util.Constants;
//import com.teknei.vo.CalendarioVO;
//import com.teknei.vo.CursoVO;
//import com.teknei.vo.DashboardVO;
//import com.teknei.vo.EmpresaVO;
//import com.teknei.vo.EventoCalendarioVO;
//import com.teknei.vo.EventoFormatoVO;
//import com.teknei.vo.EventoInscripcionVO;
//import com.teknei.vo.EventoInstructorVO;
//import com.teknei.vo.EventoSesionVO;
//import com.teknei.vo.FuncionarioGrupoVO;
//import com.teknei.vo.FuncionarioIngresoVO;
//import com.teknei.vo.FuncionarioVO;
//import com.teknei.vo.InscripcionJustificanteVO;
//import com.teknei.vo.InstructorVO;
//import com.teknei.vo.MensajesEmailVO;
//import com.teknei.vo.ModuloWebVO;
//import com.teknei.vo.MotivoCancelacionCursoVO;
//import com.teknei.vo.MotivoCancelacionVO;
//import com.teknei.vo.NotificacionVO;
//import com.teknei.vo.ProyectoVO;
//import com.teknei.vo.SedeVO;
import com.teknei.vo.UsuarioVO;
import com.teknei.vo.ActividadVO;
import com.teknei.admin.bsn.ActividadManager;

@Controller
public class SecurityController {

	private static final Logger LOGGER = Logger.getLogger(SecurityController.class);

	
	@Autowired
	private UsersManager usersManager;
	@Autowired
	private MessageSource messageSource;
//	@Autowired
//	private DatosPersonalesManager datosPersonalesManager;
//	@Autowired
//	private CursoManager cursoManager;
//	@Autowired
//	private FuncionariosManager funcionariosManager;
//	@Autowired
//	private CatalogosManager catalogosManager;
//	@Autowired
//	private CalendarioManager calendarioManager;
//	@Autowired
//	private EventoCalendarioManager eventoCalendarioManager;
//	@Autowired
//	private MotivoCancelacionManager motivoCancelacionManager;
//	@Autowired
//	private NotificacionManager notificacionManager;
//	@Autowired
//	private MotivoCancelacionCursoManager motivoCancelacionCursoManager;
//	@Autowired
//	private EventoSesionManager eventoSesionManager;
//	@Autowired
//	private ActividadManager actividadManager;
	
	
//	@Value("${app.wff.inscripcion.justificante}")
//	private String rutaJustificantes;
	
	private static final String LOGIN_VIEW = "appLogin";
	private static final String HOME_VIEW = "home";
	private static final String UNAUTHORIZED_VIEW = "notFound";
	private static final String ATTR_MODULOS = "modulos";
	private static final String ATTR_LST_CALENDARIO = "lstCalendario";
	private static final String ATTR_LST_CURSOS = "lstCursos";
	private static final String ATTR_LST_INSTRUCTORES = "lstInstructores";
	private static final String ATTR_LST_SEDES = "lstSedes";
	private static final String ATTR_LST_EVENTOS = "lstEventos";
	private static final String ATTR_LST_EVENTOS_PROXIMOS = "lstEventosProximos";
	private static final String ATTR_LST_EVENTOS_ANTERIORES = "lstEventosAnteriores";
	private static final String EVENTO_CALENDARIO_MODEL = "eventoCalendario";
	private static final String EVENTO_CALENDARIO_VIEW = "evento";
	private static final String ATTR_EVENTO = "evento";
	private static final String ATTR_MOTIVOS_CANCELACION = "lstMotivosCancelacion";
	private static final String ATTR_MOTIVOS_CANCELACION_CURSO = "lstMotivosCancelacionCurso";
	private static final String ATTR_LST_ACTIVIDADES = "lstActividades";
	private static final String ATTR_EMPRESA = "empresa";
	private static final String LST_EVENTOS_VIEW = "eventos";
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
//			UserDetails userDetail = (UserDetails) auth.getPrincipal();
//			UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

//			UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsuario());
			
			return HOME_VIEW;
		} else {
			return LOGIN_VIEW;
		}
	}

	
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request, Model model) {

		if (error != null) {
			System.out.println(error);
			if (error.equals("sessionExpiredDuplicateLogin")) {
				model.addAttribute("error", getLocalisedResource(messageSource, "login.invalid_session.duplicated"));
			} else {
				model.addAttribute("error", getLocalisedResource(messageSource, "login.error_login"));
			}
			String targetUrl = getRememberMeTargetUrlFromSession(request);

			if (StringUtils.hasText(targetUrl)) {
				model.addAttribute("targetUrl", targetUrl);
				model.addAttribute("loginUpdate", true);
			}
		} else {
			String targetUrl = getRememberMeTargetUrlFromSession(request);

			if (StringUtils.hasText(targetUrl)) {
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

	

	
//	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//	user.setUsername(newUser.getUsername());
//	user.setPassword(passwordEncoder.encode(newUser.getPassword()));
//	user.setEnabled(newUser.isEnabled());
//	user.getUserAuthorities().addAll(authortiesList);	

}
