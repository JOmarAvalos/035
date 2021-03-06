package com.teknei.webapp.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import com.teknei.security.bsn.UsersManager;
import com.teknei.util.Constants;
import com.teknei.vo.CentroTrabajoVO;
import com.teknei.vo.CuestionarioVO;
import com.teknei.vo.EstadoRepublicaVO;
import com.teknei.vo.GiroVO;
import com.teknei.vo.ProductoCompradoVO;
import com.teknei.vo.UsuarioVO;

import mx.openpay.client.Address;
import mx.openpay.client.Card;
import mx.openpay.client.Charge;
import mx.openpay.client.Customer;
import mx.openpay.client.core.OpenpayAPI;
import mx.openpay.client.core.requests.RequestBuilder;
import mx.openpay.client.core.requests.transactions.CreateCardChargeParams;

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

	@Autowired
	private CarritoManager carritoManager;
	@Autowired
	private UsersManager usersManager;
	
	@RequestMapping(value = "/carrito/agregaProducto", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> agregaProducto(Model model, HttpServletRequest request, @RequestParam(value = "param", required = true) Integer param) {
		List<Object> resp = new ArrayList<Object>();
		try {
			ProductoCompradoVO producto = carritoManager.findProducto(param);
			producto.setIdCompraEstatus(Constants.ID_PRODUCTO_EN_CARRITO);
			producto = carritoManager.save(producto);
			
			resp.add(true);
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
			producto = carritoManager.save(producto);
			
			resp.add(true);
		} catch (Exception e) {
			LOGGER.error("Ocurrio un error al acualizar el producto				error: ",e);
		}
		return resp;
	}
	
	
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/carrito/pagoSimulado", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> simulaPago(Model model, HttpServletRequest request) {
		List<Object> resp = new ArrayList<Object>();
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();

			if (!(auth instanceof AnonymousAuthenticationToken)) {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

				UsuarioVO usuarioVO = usersManager.getUser(currentUser.getUsuario());
				
//				String tarjeta = request.getParameter("card_number");
//				String nombre = request.getParameter("holder_name");
//				Integer anio = Integer.valueOf(request.getParameter("expiration_year"));
//				Integer mes = Integer.valueOf(request.getParameter("expiration_month"));
//				String cvv = request.getParameter("cvv2");
//				String monto = request.getParameter("monto");
				String sessionId = request.getParameter("deviceIdHiddenFieldName");
				String token = request.getParameter("token_id");
				
				System.out.println("******************************");
//				System.out.println(tarjeta);
//				System.out.println(nombre);
//				System.out.println(anio);
//				System.out.println(mes);
//				System.out.println(cvv);
//				System.out.println(monto);
				System.out.println(sessionId);
				System.out.println(token);
				System.out.println("******************************");
				
				
				
				OpenpayAPI api = new OpenpayAPI("https://sandbox-api.openpay.mx", "sk_61d6b63daefb41caa4b5d5a1d3b095b7", "ms7xebg9txnc6i3bbw4p");
				
				Customer customer = api.customers().create(new Customer()
				        .name("John")
				        .lastName("Doe")
				        .email("johndoe@example.com")
//				        .phoneNumber("554-170-3567")
//				        .address(address)
				        );
				
				CreateCardChargeParams requestB = new CreateCardChargeParams();
				
				requestB.cardId(token); // =source_id
				requestB.amount(new BigDecimal("100.00"));
				requestB.currency("MXN");
				requestB.description("Cargo inicial a mi merchant");
				requestB.orderId("oid-00");
				requestB.deviceSessionId(sessionId);
				requestB.customer(customer);

				Charge charge = api.charges().createCharge(requestB);
				
				System.out.println(charge.getStatus());
				System.out.println(charge.getAuthorization());
				
				String referencia = "";
				
				
				if(charge.getStatus().equalsIgnoreCase("completed")) {
					List<ProductoCompradoVO> productosAll = carritoManager.getCarritoByidUsuario(usuarioVO.getId());
					for(ProductoCompradoVO producto: productosAll) {
						if(producto.getIdCompraEstatus() == Constants.ID_PRODUCTO_EN_CARRITO){
							producto.setIdCompraEstatus(Constants.ID_PRODUCTO_COMPRADO);
							producto.setNumeroReferenciaPago(producto.getIdCrypt());
							producto.setIdUsuarioModifica(null);
							producto.setModificacion(new Date());
							producto = carritoManager.save(producto);
							referencia = charge.getAuthorization();
						}
					}
					
					resp.add(true);
					resp.add(referencia);
				}else {
					resp.add(false);
				}
				
			}else {
				resp.add(false);
			}

			
		} catch (Exception e) {
			LOGGER.error("Ocurrio un error al acualizar el producto				error: ",e);
			resp = new ArrayList<Object>();
			resp.add(false);
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
			
			model.addAttribute(ATTR_TOTAL_CARRITO, total);
			model.addAttribute(ATTR_PRODUCTOS_CARRITO, productosCarrito);
			model.addAttribute("idPay", payID);
			model.addAttribute("publicKey", payPublicKey);
			model.addAttribute("privateKey", payPrivateKey);
			model.addAttribute("sandbox", sandBox);

			
			
			return "pagoTmp";
		} else {
			return "appLogin";
		}
	}

	
}
