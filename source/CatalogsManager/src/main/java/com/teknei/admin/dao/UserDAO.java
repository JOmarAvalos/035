package com.teknei.admin.dao;

import java.util.List;

import com.teknei.base.dao.BaseDAO;
import com.teknei.entity.Usuario;

public interface UserDAO extends BaseDAO<Integer, Usuario> {
	
	Usuario getUser(String userName);
	
	Object getUserComplete(String userName);
	
	Usuario getUser(Integer userId);
	
	List<Usuario> getAllUsers();
	
	Usuario saveUser(Usuario user);
	
	Usuario updateUser(Usuario userToUpdate);
	
	void deleteUser(String userName);

	List<Object> getAllUsersDatosPersonales();

	List<Object> getUsersDatosPersonalesById(Integer id);

	List<Usuario> getAllUsersByEmployee(Integer idDatosPersonales);

	List<Usuario> getAllUsersByEnpresa(Integer idEmpresa);
	
	Usuario getUserCorp(String userName);

}
