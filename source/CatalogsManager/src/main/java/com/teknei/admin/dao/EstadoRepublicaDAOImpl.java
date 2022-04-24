package com.teknei.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.EstadoRepublica;

@Repository
public class EstadoRepublicaDAOImpl extends HibernateBaseDAO<Integer,EstadoRepublica> implements EstadoRepublicaDAO{

	private static final long serialVersionUID = -1773916921266185412L;

	@SuppressWarnings("unchecked")
	@Override
	public List<EstadoRepublica> getAll() {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from EstadoRepublica where banActivo = 1 ");
		
		return (List<EstadoRepublica>)query.list();
	}

}
