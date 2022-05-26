package com.teknei.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.Cuestionario;

@Repository
public class CuestionarioDAOImpl extends HibernateBaseDAO<Integer,Cuestionario> implements CuestionarioDAO{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1504417906713196988L;

	@SuppressWarnings("unchecked")
	@Override
	public List<Cuestionario> getByCentro(Integer idCentro) {
		
		StringBuilder sbQuery = new StringBuilder();
		sbQuery.append("from Cuestionario c ");
		sbQuery.append("where (select ct.empleadoNumero from CentroTrabajo ct where ct.id = :idCentro ) >= c.empleadosRangoInicial and  (select ct.empleadoNumero from CentroTrabajo ct where ct.id = :idCentro ) <= c.empleadosRangoFinal ");
		
		Query query = sessionFactory.getCurrentSession().createQuery(sbQuery.toString());
		query.setParameter("idCentro", idCentro);
		
		return (List<Cuestionario>)query.list();
	}
	
	

}
