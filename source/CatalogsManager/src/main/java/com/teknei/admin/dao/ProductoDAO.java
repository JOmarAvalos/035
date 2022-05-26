package com.teknei.admin.dao;

import java.util.List;

import com.teknei.base.dao.BaseDAO;
//import com.teknei.entity.Actividad;
import com.teknei.entity.Producto;


public interface ProductoDAO extends BaseDAO<Integer, Producto> {

	List<Producto> getAll();
	
	List<Producto> getByRango(Integer idCentro);
	
//	Actividad getByCentroCuestionario(Integer idCentro, Integer idCuestionario); 
}

