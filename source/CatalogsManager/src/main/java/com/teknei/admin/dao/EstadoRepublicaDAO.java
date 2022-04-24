package com.teknei.admin.dao;

import java.util.List;

import com.teknei.base.dao.BaseDAO;
import com.teknei.entity.EstadoRepublica;

public interface EstadoRepublicaDAO extends BaseDAO<Integer, EstadoRepublica>{

	List<EstadoRepublica> getAll(); 
}
