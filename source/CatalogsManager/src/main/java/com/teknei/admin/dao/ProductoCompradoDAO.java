package com.teknei.admin.dao;

import java.util.List;

import com.teknei.base.dao.BaseDAO;
//import com.teknei.entity.Actividad;
import com.teknei.entity.ProductoComprado;


public interface ProductoCompradoDAO extends BaseDAO<Integer, ProductoComprado> {

	List<ProductoComprado> getAll();
	
	List<ProductoComprado> getByCentro(Integer idCentro);
	
//	Actividad getByCentroCuestionario(Integer idCentro, Integer idCuestionario); 
}

