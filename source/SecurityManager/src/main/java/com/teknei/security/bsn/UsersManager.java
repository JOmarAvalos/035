package com.teknei.security.bsn;

import java.util.List;

import com.teknei.vo.UsuarioVO;

public interface UsersManager {
	
	UsuarioVO getUser(String userName);
	
	UsuarioVO getUser(Integer userId);
	
	UsuarioVO addUser(UsuarioVO newUser);
	
	UsuarioVO updateUser(UsuarioVO userToUpdate);
	
	UsuarioVO updateUserPassword(UsuarioVO userToUpdate);
	
	void deleteUser(String userToDelete);
	
	List<UsuarioVO> getAllUsers();

	List<UsuarioVO> getAllUsersDatosPersonales();

	UsuarioVO getUserDatosPersonalesById(Integer id);

	int getAllUsersByEmployeeCount(Integer idDatosPersonales,Integer idUser);
	
	UsuarioVO getUserComplete(String userName);
	
	List<UsuarioVO> getAllUsersByEnpresa(Integer idEmpresa);
	
	UsuarioVO getUserCorp(String userName);

	
}
