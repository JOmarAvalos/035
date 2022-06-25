package com.teknei.admin.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.CentroTrabajo;

@Repository
public class CentroTrabajoDAOImpl extends HibernateBaseDAO<Integer,CentroTrabajo> implements CentroTrabajoDAO{

	/**
	 * Generated Serial Version
	 */
	private static final long serialVersionUID = 6979320291672030845L;

	@Override
	public CentroTrabajo getByUsuario(Integer idUsuario) {
		Query query = sessionFactory.getCurrentSession().createQuery("from CentroTrabajo where idUsuario = :idUsuario ");
		query.setParameter("idUsuario", idUsuario);
		return (CentroTrabajo) query.uniqueResult();
	}
 
}
