package com.teknei.admin.bsn;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teknei.admin.dao.CentroTrabajoDAO;
import com.teknei.admin.dao.CuestionarioDAO;
import com.teknei.admin.dao.ProductoCompradoDAO;
import com.teknei.admin.dao.ProductoDAO;
import com.teknei.admin.dao.UserDAO;
import com.teknei.entity.ProductoComprado;
import com.teknei.mapper.Mapper;
import com.teknei.vo.CentroTrabajoVO;
import com.teknei.vo.CuestionarioVO;
import com.teknei.vo.ProductoCompradoVO;
import com.teknei.vo.ProductoVO;
import com.teknei.vo.UsuarioVO;


@Service
@Transactional
public class CarritoManagerImpl implements CarritoManager {
	
	private static final Logger LOGGER = Logger.getLogger(CarritoManagerImpl.class);
	
	@Autowired
	private ProductoDAO productoDAO;
	@Autowired
	private ProductoCompradoDAO productoCompradoDAO;
	@Autowired
	private CuestionarioDAO cuestionarioDAO;
	@Autowired
	private CentroTrabajoDAO centroTrabajoDAO;
	@Autowired
	private UserDAO userDAO;
	
	
	@Override
	public List<ProductoCompradoVO> getByidCentro(Integer idCentro) {
		
		List<ProductoCompradoVO> resp = new ArrayList<ProductoCompradoVO>();  
		List<ProductoComprado> productosComprados = productoCompradoDAO.getByCentro(idCentro);
		
		for(ProductoComprado prodC: productosComprados) {
			ProductoCompradoVO vo = Mapper.toVO(prodC);
			ProductoVO producto = Mapper.toVO(productoDAO.find(prodC.getIdProducto()));
			CuestionarioVO cuestionario = Mapper.toVO(cuestionarioDAO.find(producto.getIdCuestionario()));
			
			producto.setCuestionarioVO(cuestionario);
			vo.setProductoVO(producto);
			
			resp.add(vo);
		}
		
		return resp;
	}


	@Override
	public ProductoCompradoVO findProducto(Integer id) {
		
		return Mapper.toVO(productoCompradoDAO.find(id));
	}


	@Override
	public ProductoCompradoVO save(ProductoCompradoVO productoCompradoVO) {
		return Mapper.toVO(productoCompradoDAO.update(Mapper.toEntity(productoCompradoVO)));
	}


	@Override
	public List<ProductoCompradoVO> getAll() {
		
		List<ProductoCompradoVO> resp = new ArrayList<ProductoCompradoVO>();  
		List<ProductoComprado> productosComprados = productoCompradoDAO.list();
		
		for(ProductoComprado prodC:productosComprados) {
			ProductoCompradoVO vo = Mapper.toVO(prodC);
			ProductoVO producto = Mapper.toVO(productoDAO.find(prodC.getIdProducto()));
			CuestionarioVO cuestionario = Mapper.toVO(cuestionarioDAO.find(producto.getIdCuestionario()));
			
			CentroTrabajoVO centro = Mapper.toVO(centroTrabajoDAO.find(vo.getIdCentroTrabajo()));
			UsuarioVO usuario = Mapper.toVO(userDAO.find(centro.getIdUsuario()));
			
			
			producto.setCuestionarioVO(cuestionario);
			vo.setProductoVO(producto);
			usuario.setCentroTrabajoVO(centro);
			vo.setUsuario(usuario);
			
			resp.add(vo);
		}
		return resp;
	}


	@Override
	public List<ProductoCompradoVO> getCarritoByidUsuario(Integer idUsuario) {
		List<ProductoCompradoVO> resp = new ArrayList<ProductoCompradoVO>();  
		List<ProductoComprado> productosComprados = productoCompradoDAO.getByUsuario(idUsuario);
		
		for(ProductoComprado prodC: productosComprados) {
			ProductoCompradoVO vo = Mapper.toVO(prodC);
			ProductoVO producto = Mapper.toVO(productoDAO.find(prodC.getIdProducto()));
			CuestionarioVO cuestionario = Mapper.toVO(cuestionarioDAO.find(producto.getIdCuestionario()));
			
			producto.setCuestionarioVO(cuestionario);
			vo.setProductoVO(producto);
			
			resp.add(vo);
		}
		
		return resp;
	}


	@Override
	public ProductoCompradoVO lastOrderId(Integer idUsuario) {
		return Mapper.toVO(productoCompradoDAO.getLastOrderId(idUsuario));
	}

	
}

