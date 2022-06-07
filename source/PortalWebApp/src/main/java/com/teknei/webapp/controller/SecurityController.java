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
import java.math.BigDecimal;
import java.math.BigInteger;
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
import com.teknei.vo.CentroTrabajoVO;
import com.teknei.vo.CuestionarioVO;
import com.teknei.vo.EstadoRepublicaVO;
import com.teknei.vo.GiroVO;
import com.teknei.vo.ProductoCompradoVO;
import com.teknei.admin.bsn.ActividadManager;
import com.teknei.admin.bsn.CarritoManager;
import com.teknei.admin.bsn.CentroTrabajoManager;
import com.teknei.admin.bsn.CuestionariosManager;
import com.teknei.admin.bsn.EstadoRepublicaManager;
import com.teknei.admin.bsn.GiroManager;

@Controller
public class SecurityController {

	private static final Logger LOGGER = Logger.getLogger(SecurityController.class);

	
	@Autowired
	private UsersManager usersManager;
	@Autowired
	private MessageSource messageSource;
	@Autowired 
	private CentroTrabajoManager centroTrabajoManager;
	@Autowired
	private GiroManager giroManager;
	@Autowired
	private EstadoRepublicaManager estadoRepublicaManager;
	@Autowired
	private CuestionariosManager cuestionariosManager;
	@Autowired
	private CarritoManager carritoManager;
	
	
//	@Value("${app.wff.inscripcion.justificante}")
//	private String rutaJustificantes;
	
	private static final String LOGIN_VIEW = "appLogin";
	private static final String HOME_VIEW = "home";
	private static final String UNAUTHORIZED_VIEW = "notFound";
	private static final String ATTR_CENTRO = "centro";
	private static final String ATTR_USUARIO = "usuario";
	private static final String ATTR_LST_GIRO = "lstGiro";
	private static final String ATTR_LST_ESTADOS = "lstEstados";
	private static final String ATTR_LST_CUESTIONARIOS = "lstCuestionarios";
	private static final String ATTR_LST_PRODUCTOS = "lstProductos";
	private static final String ATTR_TOTAL_CARRITO = "totalCarrito";
	private static final String ATTR_PRODUCTOS_CARRITO = "productosCarrito";
	private static final String ATTR_PRODUCTOS_COMPRADOS = "productosComprados";
	private static final String ATTR_PRODUCTOS_ENTREGADOS = "productosEntregados";
	private static final String ATTR_PRODUCTOS_SIN_COMPRA = "productosSinCompra";
	private static final String ATTR_USUARIOS_REGISTRADO = "countUsers";
	private static final String ATTR_CUESTIONARIOS_RESUELTOS = "countCuestionarios";
	private static final String ATTR_TOTAL_VENTAS = "countVentas";
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

			UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsuario());
			
			if(usuarioVO.getIdPerfil() == Constants.ID_PERFIL_CLIENTE) {
				CentroTrabajoVO centroTrabajo = centroTrabajoManager.getByUuario(usuarioVO.getId());
				List<GiroVO> giros = giroManager.getGiros();
				List<EstadoRepublicaVO> estados = estadoRepublicaManager.getAll();
				
				List<CuestionarioVO> cuestionarios = new ArrayList<CuestionarioVO>();
				List<ProductoCompradoVO> productos = new ArrayList<ProductoCompradoVO>();
				
				if(centroTrabajo != null){
					cuestionarios = cuestionariosManager.getCuestionariosByCentro(centroTrabajo.getId());
					productos = carritoManager.getByidCentro(centroTrabajo.getId());
				}
				
				BigInteger total = new BigInteger("0");
				int productosCarrito = 0;
				
				if(!productos.isEmpty()) {
					for(ProductoCompradoVO producto: productos) {
						if(producto.getIdCompraEstatus() == Constants.ID_PRODUCTO_EN_CARRITO) {
							total = total.add(producto.getProductoVO().getPrecio());
							productosCarrito++;
						}
					}
				}
				
				model.addAttribute(ATTR_CENTRO, centroTrabajo);
				model.addAttribute(ATTR_LST_GIRO, giros);
				model.addAttribute(ATTR_LST_ESTADOS, estados);
				model.addAttribute(ATTR_USUARIO, usuarioVO);
				model.addAttribute(ATTR_LST_CUESTIONARIOS, cuestionarios);
				model.addAttribute(ATTR_LST_PRODUCTOS, productos);
				model.addAttribute(ATTR_TOTAL_CARRITO, total);
				model.addAttribute(ATTR_PRODUCTOS_CARRITO, productosCarrito);
			}else if(usuarioVO.getIdPerfil() == Constants.ID_PERFIL_ADMIIN) {
				
				List<ProductoCompradoVO> productosComprados = new ArrayList<ProductoCompradoVO>();
				List<ProductoCompradoVO> productosEntregados = new ArrayList<ProductoCompradoVO>();
				List<ProductoCompradoVO> productosSinCompra = new ArrayList<ProductoCompradoVO>();
				List<ProductoCompradoVO> productos = carritoManager.getAll();
				
				BigInteger totalCompras = new BigInteger("0");
				int usuariosRegistrados = usersManager.usuariosRegistrados();
				Integer cuestionariosResueltos = cuestionariosManager.cuestionariosResueltos();
				
				for(ProductoCompradoVO producto: productos) {
					if(producto.getIdCompraEstatus() == Constants.ID_PRODUCTO_DISPONIBLE || producto.getIdCompraEstatus() == Constants.ID_PRODUCTO_EN_CARRITO ) {
						productosSinCompra.add(producto);
					}else if(producto.getIdCompraEstatus() == Constants.ID_PRODUCTO_COMPRADO) {
						totalCompras = totalCompras.add(producto.getProductoVO().getPrecio());
						productosComprados.add(producto);
					}else if(producto.getIdCompraEstatus() == Constants.ID_PRODUCTO_DESCARGADO || producto.getIdCompraEstatus() == Constants.ID_PRODUCTO_ENTREGADO ) {
						totalCompras = totalCompras.add(producto.getProductoVO().getPrecio());
						productosEntregados.add(producto);
					}
				}
				model.addAttribute(ATTR_PRODUCTOS_COMPRADOS, productosComprados);
				model.addAttribute(ATTR_PRODUCTOS_ENTREGADOS, productosEntregados);
				model.addAttribute(ATTR_PRODUCTOS_SIN_COMPRA, productosSinCompra);
				model.addAttribute(ATTR_USUARIOS_REGISTRADO, usuariosRegistrados);
				model.addAttribute(ATTR_CUESTIONARIOS_RESUELTOS, cuestionariosResueltos);
				model.addAttribute(ATTR_TOTAL_VENTAS, totalCompras);

			}
			
			
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
