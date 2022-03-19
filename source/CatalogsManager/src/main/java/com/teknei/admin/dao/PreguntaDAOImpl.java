package com.teknei.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.Pregunta;

@Repository
public class PreguntaDAOImpl extends HibernateBaseDAO<Integer,Pregunta> implements PreguntaDAO{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7363227123279318738L;

	@SuppressWarnings("unchecked")
	@Override
	public List<Pregunta> getActivasByCuestionario(Integer idCuestionario) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Pregunta where banActivo = 1 and idCuestionario = :idCuestionario order by orden ");
		query.setParameter("idCuestionario", idCuestionario);
		
		return (List<Pregunta>)query.list();
	}

	

}
