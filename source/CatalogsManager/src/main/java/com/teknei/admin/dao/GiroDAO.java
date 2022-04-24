package com.teknei.admin.dao;

import java.util.List;

import com.teknei.base.dao.BaseDAO;
import com.teknei.entity.Giro;

public interface GiroDAO extends BaseDAO<Integer, Giro>{
	
	List<Giro> getAll();

}
