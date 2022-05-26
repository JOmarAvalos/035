package com.teknei.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.Producto;

@Repository
public class ProductoDAOImpl extends HibernateBaseDAO<Integer,Producto> implements ProductoDAO {

	private static final long serialVersionUID = 6851274671690456354L;

	@SuppressWarnings("unchecked")
	@Override
	public List<Producto> getAll() {
		Query query = sessionFactory.getCurrentSession().createQuery("from Producto");
		
		return (List<Producto>)query.list();	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Producto> getByRango(Integer idCentro) {
		
		StringBuilder sbQuery = new StringBuilder();
		sbQuery.append("from Producto p ");
		sbQuery.append("where (select ct.empleadoNumero from CentroTrabajo ct where ct.id = :idCentro ) >= p.empleadosRangoInicial and  (select ct.empleadoNumero from CentroTrabajo ct where ct.id = :idCentro ) <= p.empleadosRangoFinal ");
		Query query = sessionFactory.getCurrentSession().createQuery(sbQuery.toString());
		
		query.setParameter("idCentro", idCentro);
		
		return (List<Producto>)query.list();	
	}

}
