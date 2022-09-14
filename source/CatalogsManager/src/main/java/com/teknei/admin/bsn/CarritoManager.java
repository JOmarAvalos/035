package com.teknei.admin.bsn;

import java.util.List;

import com.teknei.vo.ProductoCompradoVO;

public interface CarritoManager {
	
	List<ProductoCompradoVO> getByidCentro(Integer idCentro);
	ProductoCompradoVO findProducto(Integer id);
	ProductoCompradoVO save(ProductoCompradoVO productoCompradoVO);
	List<ProductoCompradoVO> getAll();
	List<ProductoCompradoVO> getCarritoByidUsuario(Integer idUsuario);
	ProductoCompradoVO lastOrderId(Integer idUsuario);

	
}
