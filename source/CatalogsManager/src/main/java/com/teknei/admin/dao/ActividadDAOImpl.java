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


	@Override
	public Actividad getByCentroCuestionario(Integer idCentro, Integer idCuestionario) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Actividad where idCentroTrabajo = :idCentroTrabajo and idCuestionario = :idCuestionario ");
		query.setParameter("idCentroTrabajo", idCentro);
		query.setParameter("idCuestionario", idCuestionario);
		return (Actividad) query.uniqueResult();
	}

}

