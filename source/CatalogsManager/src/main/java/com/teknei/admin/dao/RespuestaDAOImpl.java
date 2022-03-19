package com.teknei.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.Pregunta;
import com.teknei.entity.Respuesta;

@Repository
public class RespuestaDAOImpl extends HibernateBaseDAO<Integer,Respuesta> implements RespuestaDAO{

	/**
	 * 
	 */
	private static final long serialVersionUID = -791907286731965938L;

	@SuppressWarnings("unchecked")
	@Override
	public List<Respuesta> getActivasByPregunta(Integer idPregunta) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Respuesta where banActivo = 1 and idPregunta = :idPregunta order by orden ");
		query.setParameter("idPregunta", idPregunta);
		
		return (List<Respuesta>)query.list();
	}


	

}
