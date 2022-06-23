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
	
	@SuppressWarnings("unchecked")
	@Override 
	public String getRespuestaAbierta(Integer idActividadResuelta, Integer idPregunta) {
		StringBuilder sbQuery = new StringBuilder();
		
		sbQuery.append("	SELECT preRes.respuesta_abierta ");
		sbQuery.append("	  FROM desarrollo.tbl_preguntas_resueltas preRes ");
		sbQuery.append("	 WHERE id_actividad_resuelta = :idActividadResuelta "); 
		sbQuery.append("	   AND id_pregunta = :idPregunta "); 
		sbQuery.append("	 LIMIT 1 "); 

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sbQuery.toString());

		query.setParameter("idActividadResuelta", idActividadResuelta);
		query.setParameter("idPregunta", idPregunta);
		
		String res = (String)query.uniqueResult();
		return res;	
	}
	
	@SuppressWarnings("unchecked")
	@Override 
	public String getRespuestaCerrada(Integer idActividadResuelta, Integer idPregunta) {
		StringBuilder sbQuery = new StringBuilder();
		
		sbQuery.append("	SELECT res.nombre ");
		sbQuery.append("	  FROM desarrollo.tbl_preguntas_resueltas preRes ");
		sbQuery.append("      LEFT JOIN desarrollo.tbl_respuestas res ON res.cve_respuesta = preRes.id_respuesta");
		sbQuery.append("	 WHERE id_actividad_resuelta = :idActividadResuelta "); 
		sbQuery.append("	   AND preRes.id_pregunta = :idPregunta "); 
		sbQuery.append("	 LIMIT 1 "); 

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sbQuery.toString());

		query.setParameter("idActividadResuelta", idActividadResuelta);
		query.setParameter("idPregunta", idPregunta);
		
		String res = (String)query.uniqueResult();
		return res;	
	}
	
}

