package com.teknei.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.Actividad;


@Repository
public class ActividadDAOImpl extends HibernateBaseDAO<Integer,Actividad> implements ActividadDAO {
	
private static final long serialVersionUID = 1L;
	

	@SuppressWarnings("unchecked")
	@Override
	public List<Actividad> getAll() {
		Query query = sessionFactory.getCurrentSession().createQuery("from Actividad");
		
		return (List<Actividad>)query.list();
	}

}

