package com.teknei.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.Giro;

@Repository
public class GiroDAOImpl extends HibernateBaseDAO<Integer,Giro> implements GiroDAO{


	private static final long serialVersionUID = 2941407867516804425L;

	@SuppressWarnings("unchecked")
	@Override
	public List<Giro> getAll() {
		Query query = sessionFactory.getCurrentSession().createQuery("from Giro where banActivo = 1 ");
		
		return (List<Giro>)query.list();
	}

}
