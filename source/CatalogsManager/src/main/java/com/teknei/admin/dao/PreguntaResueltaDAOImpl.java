package com.teknei.admin.dao;


import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.PreguntaResuelta;


@Repository
public class PreguntaResueltaDAOImpl extends HibernateBaseDAO<Integer,PreguntaResuelta> implements PreguntaResueltaDAO {

	private static final long serialVersionUID = -5630573710214902384L;

	@Override
	public PreguntaResuelta getByActividadPregunta(Integer idActividad, Integer idPregunta) {
		
		StringBuilder sbQuery = new StringBuilder();
		sbQuery.append("from PreguntaResuelta pr ");
		sbQuery.append("where  pr.idActividadResuelta = :idActividad and pr.idPregunta = :idPregunta ");
		
		Query query = sessionFactory.getCurrentSession().createQuery(sbQuery.toString());
		query.setParameter("idActividad", idActividad);
		query.setParameter("idPregunta", idPregunta);
		
		return (PreguntaResuelta) query.uniqueResult();
	}
	
}

