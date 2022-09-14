package com.teknei.webapp.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teknei.admin.bsn.CarritoManager;
import com.teknei.admin.bsn.CentroTrabajoManager;
import com.teknei.security.bsn.UsersManager;
import com.teknei.util.Constants;
import com.teknei.vo.CentroTrabajoVO;
import com.teknei.vo.CuestionarioVO;
import com.teknei.vo.EstadoRepublicaVO;
import com.teknei.vo.GiroVO;
import com.teknei.vo.ProductoCompradoVO;
import com.teknei.vo.UsuarioVO;
import com.teknei.webapp.utils.EMailService;
import com.teknei.webapp.utils.ReadFileForEmail;

import mx.openpay.client.Address;
import mx.openpay.client.Card;
import mx.openpay.client.Charge;
import mx.openpay.client.Customer;
import mx.openpay.client.core.OpenpayAPI;
import mx.openpay.client.core.requests.RequestBuilder;
import mx.openpay.client.core.requests.transactions.CreateCardChargeParams;
import mx.openpay.client.exceptions.OpenpayServiceException;

@Controller
public class CarritoController {
	
	private static final Logger LOGGER = Logger.getLogger(CarritoController.class);
	
	@Value("${app.035.pay.id}")
	private String payID;
	@Value("${app.035.pay.key.public}")
	private String payPublicKey;
	@Value("${app.035.pay.key.private}")
	private String payPrivateKey;
	@Value("${app.035.pay.sand}")
	private boolean sandBox;
	
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
	private static final String ATTR_LST_PRODUCTOS_CARRITO = "lstCarrito";

	@Autowired
	private CarritoManager carritoManager;
	@Autowired
	private UsersManager usersManager;
	@Autowired
	private CentroTrabajoManager centroTrabajoManager;
	
	@RequestMapping(value = "/carrito/agregaProducto", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> agregaProducto(Model model, HttpServletRequest request, @RequestParam(value = "param", required = true) Integer param) {
		List<Object> resp = new ArrayList<Object>();
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (!(auth instanceof AnonymousAuthenticationToken)) {
				
//				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

				UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsuario());
				
				StringBuilder orderId = new StringBuilder();
				
				ProductoCompradoVO producto = carritoManager.findProducto(param);
				
				ProductoCompradoVO lastOrderId = carritoManager.lastOrderId(usuarioVO.getId());
				
				if(lastOrderId != null) {
					
					if(lastOrderId.getIdCompraEstatus() == Constants.ID_PRODUCTO_EN_CARRITO) {
						orderId.append(lastOrderId.getOrderId());
					}else {
						Integer secuenciaOrder = Integer.valueOf(lastOrderId.getOrderId().substring(lastOrderId.getOrderId().length() - 1));
						secuenciaOrder++;
						orderId.append(usuarioVO.getUsuario());
						orderId.append("0");
						orderId.append(secuenciaOrder);

					}
				}else {
					orderId.append(usuarioVO.getUsuario());
					orderId.append("01");
				}
				
				
				producto.setIdCompraEstatus(Constants.ID_PRODUCTO_EN_CARRITO);
				producto.setOrderId(orderId.toString());
				producto = carritoManager.save(producto);
				
				resp.add(true);
				
			}
		} catch (Exception e) {
			LOGGER.error("Ocurrio un error al acualizar el producto				error: ",e);
		}
		return resp;
	}
	
	@RequestMapping(value = "/carrito/quitaProducto", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> quitaProducto(Model model, HttpServletRequest request, @RequestParam(value = "param", required = true) Integer param) {
		List<Object> resp = new ArrayList<Object>();
		try {
			ProductoCompradoVO producto = carritoManager.findProducto(param);
			producto.setIdCompraEstatus(Constants.ID_PRODUCTO_DISPONIBLE);
			producto.setOrderId("");
			
			producto = carritoManager.save(producto);
			
			resp.add(true);
		} catch (Exception e) {
			LOGGER.error("Ocurrio un error al acualizar el producto				error: ",e);
		}
		return resp;
	}
	
	
	
	@RequestMapping(value = "/carrito/pagoSimulado", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> simulaPago(Model model, HttpServletRequest request) {
		List<Object> resp = new ArrayList<Object>();
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();

			if (!(auth instanceof AnonymousAuthenticationToken)) {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

				UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsuario());
				Integer totalProductos = 0; 
				String sessionId = request.getParameter("deviceIdHiddenFieldName");
				String token = request.getParameter("token_id");
				String monto = request.getParameter("monto");

				try {
					CentroTrabajoVO centro = centroTrabajoManager.getByUuario(usuarioVO.getId());
					
					
					List<ProductoCompradoVO> productosAll = carritoManager.getCarritoByidUsuario(usuarioVO.getId());
					
					String orderId = "";
					
					for(ProductoCompradoVO producto: productosAll) {
						if(producto.getIdCompraEstatus() == Constants.ID_PRODUCTO_EN_CARRITO){
							orderId = producto.getOrderId();
							totalProductos++;
						}
					}
	
					
					OpenpayAPI api = new OpenpayAPI("https://sandbox-api.openpay.mx", "sk_61d6b63daefb41caa4b5d5a1d3b095b7", "ms7xebg9txnc6i3bbw4p");
					
					Customer customer = api.customers().create(new Customer()
					        .name(usuarioVO.getNombre())
					        .email(usuarioVO.getEmail())
					        );
					
					CreateCardChargeParams requestB = new CreateCardChargeParams();
					
					requestB.cardId(token); // =source_id
					requestB.amount(new BigDecimal(monto+".00"));
					requestB.currency("MXN");
					requestB.description("Compra de servicio NOM035");
					requestB.orderId(orderId);
					requestB.deviceSessionId(sessionId);
					requestB.customer(customer);
	
					Charge charge = api.charges().createCharge(requestB);
					
					System.out.println(charge.getStatus());
					System.out.println(charge.getAuthorization());
					
					String referencia = "";
					
					if(charge.getStatus().equalsIgnoreCase("completed")) {
						for(ProductoCompradoVO producto: productosAll) {
							if(producto.getIdCompraEstatus() == Constants.ID_PRODUCTO_EN_CARRITO){
								producto.setIdCompraEstatus(Constants.ID_PRODUCTO_COMPRADO);
								producto.setNumeroReferenciaPago(charge.getAuthorization());
								producto.setIdUsuarioModifica(null);
								producto.setModificacion(new Date());
								producto = carritoManager.save(producto);
								referencia = charge.getAuthorization();
							}
						}
						
						try {
							envioCorreoCompra(usuarioVO, monto, totalProductos, charge.getStatus());
						} catch (Exception e) {
							e.printStackTrace();
						}
						
						resp.add(true);
						resp.add(referencia);
					}else {
						resp.add(false);
						resp.add("Error "+charge.getErrorCode()+", consulte al administrador del sistema");
						try {
							envioCorreoCompra(usuarioVO, monto, totalProductos, "Error "+charge.getErrorCode());
						} catch (Exception e) {
							e.printStackTrace();
						}
						
					}
				
				
				} catch(OpenpayServiceException e) {
					LOGGER.error("Ocurrio un error al pagar el producto				error: ",e);
					Integer codigoErr = e.getErrorCode();
					String msgErr = "";
					if(codigoErr >= 2000 && codigoErr <= 2999) {
						msgErr = "Error: "+codigoErr+" datos de tarjeta incorrectos.";
					}else if(codigoErr >= 3000 && codigoErr <= 3999) {
						msgErr = "Error: "+codigoErr+" transacción rechazada por el banco.";
					}else {
						msgErr = "Error: "+codigoErr+" contacta a un administrador.";
					}
					resp = new ArrayList<Object>();
					resp.add(false);
					resp.add(msgErr);
					try {
						msgErr = msgErr+" \""+e.getDescription()+"\" ";
						envioCorreoCompra(usuarioVO, monto, totalProductos, msgErr);
					} catch (Exception ex) {
						ex.printStackTrace();
					}

				} catch (Exception e) {
					LOGGER.error("Ocurrio un error al acualizar el producto				error: ",e);
					resp = new ArrayList<Object>();
					resp.add(false);
					resp.add("Error interno, consulte al administrador del sistema..");
					
				} 
				
			}else {
				resp.add(false);
				resp.add("Tiempo de la sesión expirado, por favor intentalo nuevo ");
			}

			
		return resp;
	}
	
	@RequestMapping(value = "/carrito/pagomp", method = RequestMethod.GET)
	public String welcome(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

			UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsuario());
			
			List<ProductoCompradoVO> productos = carritoManager.getCarritoByidUsuario(usuarioVO.getId());
			List<ProductoCompradoVO> enCarrito = new ArrayList<ProductoCompradoVO>();
			
			
			BigInteger total = new BigInteger("0");
			int productosCarrito = 0;
			
			if(!productos.isEmpty()) {
				for(ProductoCompradoVO producto: productos) {
					if(producto.getIdCompraEstatus() == Constants.ID_PRODUCTO_EN_CARRITO) {
						total = total.add(producto.getProductoVO().getPrecio());
						productosCarrito++;
						enCarrito.add(producto);
					}
				}
			}
			
			model.addAttribute(ATTR_TOTAL_CARRITO, total);
			model.addAttribute(ATTR_PRODUCTOS_CARRITO, productosCarrito);
			model.addAttribute(ATTR_LST_PRODUCTOS_CARRITO, enCarrito);
			model.addAttribute("idPay", payID);
			model.addAttribute("publicKey", payPublicKey);
			model.addAttribute("privateKey", payPrivateKey);
			model.addAttribute("sandbox", sandBox);

			
			
			return "pagoTmp";
		} else {
			return "appLogin";
		}
	}
	
	private void envioCorreoCompra(UsuarioVO user, String costo, Integer totalProductos, String estatus ) {

		try {
			String emailFile = ReadFileForEmail.EMAIL_COMPRA;
			String notificacionFrom = "noreply@035.com.mx";
			List<String> lstEmail = new ArrayList<String>();
			lstEmail.add("m.vill23@gmail.com");
			EMailService email = new EMailService(mailUser, pass, smtp, tsl, port, login);
			String asunto = "Notificación de compra";
			String shtml = "";

			shtml = ReadFileForEmail.getFile(rutaHtml + emailFile)
					.replaceAll(Pattern.quote("{numContrato}"), user.getUsuario())
					.replaceAll(Pattern.quote("{contacto}"), user.getNombre())
					.replaceAll(Pattern.quote("{contactoEmail}"), user.getEmail())
					.replaceAll(Pattern.quote("{productos}"), String.valueOf(totalProductos))
					.replaceAll(Pattern.quote("{costoTotal}"), costo)
					.replaceAll(Pattern.quote("{estatusCompra}"), estatus)
					;

			email.sendEmail(notificacionFrom, lstEmail, asunto, shtml);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}


	
}
