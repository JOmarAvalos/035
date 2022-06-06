package com.teknei.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teknei.admin.bsn.CarritoManager;
import com.teknei.util.Constants;
import com.teknei.vo.ProductoCompradoVO;
import com.teknei.vo.UsuarioVO;

@Controller
public class CarritoController {
	
	private static final Logger LOGGER = Logger.getLogger(CarritoController.class);
	
	@Autowired
	private CarritoManager carritoManager;
	
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

	
}
