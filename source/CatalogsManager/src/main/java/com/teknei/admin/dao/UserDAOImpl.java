package com.teknei.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.teknei.base.dao.HibernateBaseDAO;
import com.teknei.entity.Usuario;

@Repository
public class UserDAOImpl extends HibernateBaseDAO<Integer, Usuario> implements UserDAO {

	private static final long serialVersionUID = 1L;

	@Override
	public Object getUserComplete(String userName) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Usuario u, Funcionario f, DtsFuncionario df "
				+ "where u.username = :userName and u.id = f.idUsuario and f.id = df.idFuncionario");
		query.setString("userName", userName );
		return (Object)query.uniqueResult();
	}
	
	@Override
	public Usuario getUser(String userName) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Usuario where usuario = :userName");
		query.setString("userName", userName );
		
		return (Usuario)query.uniqueResult();
	}

	@Override
	public Usuario getUser(Integer userId) {
		return find(userId);
	}

	@Override
	public List<Usuario> getAllUsers() {
		return list();
	}
	
	@Override
	public Usuario saveUser(Usuario user) {
		return save(user);
	}

	@Override
	public Usuario updateUser(Usuario userToUpdate) {
		return update(userToUpdate);
	}

	@Override
	public void deleteUser(String userName) {
		Query query = sessionFactory.getCurrentSession().createQuery("delete Usuario where username = :userName");
		query.setString("userName", userName );
		 
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getAllUsersDatosPersonales() {
		StringBuilder statement = new StringBuilder(); 
		statement.append("\n    FROM Usuario u");
		statement.append("\n       , DatosPersonales dp ");
		statement.append("\n   WHERE 1=1 ");
		statement.append("\n     AND u.idDatosPersonales=sp.id ");
		statement.append("\n   ORDER BY u.id");

		//Resultado del QUERY
		Query query = sessionFactory.getCurrentSession().createQuery(statement.toString());

		return (List<Object>)query.list();
	}	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getUsersDatosPersonalesById(Integer id) {
		if(id==null ) return null;

		StringBuilder statement = new StringBuilder(); 

		statement.append("\n    FROM Usuario u");
		statement.append("\n       , DatosPersonales dp ");
		statement.append("\n   WHERE 1=1 ");
		statement.append("\n     AND u.id=:idUser ");
		statement.append("\n     AND u.idDatosPersonales=sp.id ");
		statement.append("\n   ORDER BY u.id");

		//Resultado del QUERY
		Query query = sessionFactory.getCurrentSession().createQuery(statement.toString());
		query.setParameter("idUser", id);
		
		return (List<Object>)query.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getAllUsersByEmployee(Integer idDatosPersonales) {
		if(idDatosPersonales==null ) return null;

		Query query = sessionFactory.getCurrentSession().createQuery("from Usuario where idDatosPersonales = :idDatosPersonalesEmployee");
		query.setInteger("idDatosPersonalesEmployee", idDatosPersonales );
		return (List<Usuario>)query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getAllUsersByEnpresa(Integer idEmpresa) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Usuario u where u.idEmpresa = :idEmpresa");
		query.setParameter("idEmpresa", idEmpresa );
		return (List<Usuario>)query.list();
	}

	@Override
	public Usuario getUserCorp(String userName) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Usuario where usuarioCorp = :userName");
		query.setString("userName", userName );
		
		return (Usuario)query.uniqueResult();
	}

	@Override
	public Usuario getUserByMail(String mail) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Usuario where upper(email) = :mail");
		query.setString("mail", mail );
		
		return (Usuario)query.uniqueResult();
	}

	@Override
	public Usuario getByUsrPwd(String userName, String pwd) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Usuario where usuario = :userName and contrasena = :contrasena ");
		query.setString("userName", userName );
		query.setString("contrasena", pwd );
		
		return (Usuario)query.uniqueResult();
	}	
	
	@Override
	public int countUsuariosRegistrados() {
		Query query = sessionFactory.getCurrentSession().createQuery("Select count(*) from Usuario a where a.idPerfil = 2 ");
		int total = ((Long)query.uniqueResult()).intValue();
		return total;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsersByMail(String mail) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Usuario where upper(email) = :mail");
		query.setString("mail", mail );
		
		return (List<Usuario>)query.list();
	}

	@Override
	public int lastUser() {
		Query query = sessionFactory.getCurrentSession().createQuery("from Usuario a order by a.id desc");
		query.setMaxResults(1);
		
		Usuario usuario = (Usuario) query.uniqueResult();
		int resp = usuario.getId();
		return resp;
	}
	
}
