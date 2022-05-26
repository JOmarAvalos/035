package com.teknei.admin.bsn;

import java.util.List;

import com.teknei.vo.ProductoCompradoVO;

public interface CarritoManager {
	
	List<ProductoCompradoVO> getByidCentro(Integer idCentro);

	
}
