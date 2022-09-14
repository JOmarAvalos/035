package com.teknei.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.ProductoComprado;

@Repository
public class ProductoCompradoDAOImpl extends HibernateBaseDAO<Integer,ProductoComprado> implements ProductoCompradoDAO {

	private static final long serialVersionUID = 6851274671690456354L;

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductoComprado> getAll() {
		Query query = sessionFactory.getCurrentSession().createQuery("from ProductoComprado");
		
		return (List<ProductoComprado>)query.list();	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductoComprado> getByCentro(Integer idCentro) {
		
		StringBuilder sbQuery = new StringBuilder();
		sbQuery.append("from ProductoComprado p ");
		sbQuery.append("where p.idCentroTrabajo = :idCentro ");
		sbQuery.append("order by p.id ");
		Query query = sessionFactory.getCurrentSession().createQuery(sbQuery.toString());
		
		query.setParameter("idCentro", idCentro);
		
		return (List<ProductoComprado>)query.list();	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductoComprado> getByUsuario(Integer idUsuario) {
		StringBuilder sbQuery = new StringBuilder();
		sbQuery.append("from ProductoComprado p ");
		sbQuery.append("where p.idUsuarioCrea = :idUsuario ");
		sbQuery.append("order by p.id ");
		Query query = sessionFactory.getCurrentSession().createQuery(sbQuery.toString());
		
		query.setParameter("idUsuario", idUsuario);
		
		return (List<ProductoComprado>)query.list();	
	}

	@Override
	public ProductoComprado getLastOrderId(Integer idUsuario) {
		
		StringBuilder sbQuery = new StringBuilder();
		sbQuery.append("from ProductoComprado p ");
		sbQuery.append("where p.idUsuarioCrea = :idUsuario ");
		sbQuery.append("and p.orderId is not null ");
		sbQuery.append("order by p.orderId desc ");
		Query query = sessionFactory.getCurrentSession().createQuery(sbQuery.toString());
		
		query.setParameter("idUsuario", idUsuario);
		
		query.setMaxResults(1);
		
		return (ProductoComprado) query.uniqueResult();
		
	}

}
