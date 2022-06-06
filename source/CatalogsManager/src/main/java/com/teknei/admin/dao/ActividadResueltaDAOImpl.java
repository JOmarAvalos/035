package com.teknei.admin.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.ActividadResuelta;


@Repository
public class ActividadResueltaDAOImpl extends HibernateBaseDAO<Integer,ActividadResuelta> implements ActividadResueltaDAO {
	

	private static final long serialVersionUID = 7527364373319074736L;

	@Override
	public int actividadesConcluidas(Integer idActividad) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("Select count(*) from ActividadResuelta a where a.idActividad = :idActividad and a.estatus = 2 ");
		query.setInteger("idActividad", idActividad);
		int total = ((Long)query.uniqueResult()).intValue();
		return total;

	}

}

