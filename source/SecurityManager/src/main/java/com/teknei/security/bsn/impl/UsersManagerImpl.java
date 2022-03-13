package com.teknei.security.bsn.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teknei.admin.dao.UserDAO;
import com.teknei.entity.Usuario;
import com.teknei.security.bsn.UsersManager;
import com.teknei.vo.UsuarioVO;

@Service
@Transactional
public class UsersManagerImpl implements UsersManager {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private Mapper mapper;

	public UsuarioVO getUser(String userName) {
		Usuario user = userDAO.getUser(userName);

		return com.teknei.mapper.Mapper.toVO(user);
	}

	public UsuarioVO getUser(Integer userId) {
		
		Usuario user = userDAO.getUser(userId);

		return com.teknei.mapper.Mapper.toVO(user);
	}

	public List<UsuarioVO> getAllUsers() {
		List<Usuario> users = userDAO.getAllUsers();
		List<UsuarioVO> results = new ArrayList<UsuarioVO>(users.size());

		for (Usuario user : users) {
			UsuarioVO result = mapper.map(user, UsuarioVO.class);
			results.add(result);
		}

		return results;
	}

	public List<UsuarioVO> getAllUsersDatosPersonales() {
		List<Object> lstEntities = userDAO.getAllUsersDatosPersonales();
		List<UsuarioVO> lstVosReturn = new ArrayList<UsuarioVO>();

		if (lstEntities != null)
			for (Object element : lstEntities) {
				Usuario u = (Usuario) ((Object[]) element)[0];

				UsuarioVO uvo = com.teknei.mapper.Mapper.toVO(u);

				lstVosReturn.add(uvo);
			}

		return lstVosReturn;
	}

	public UsuarioVO addUser(UsuarioVO newUser) {
		Usuario user = mapper.map(newUser, Usuario.class);

		user = userDAO.saveUser(user);
		UsuarioVO userVO = com.teknei.mapper.Mapper.toVO(user);

		return userVO;
	}

	public UsuarioVO updateUser(UsuarioVO userToUpdate) {
		UsuarioVO result;
		Usuario user = userDAO.getUser(userToUpdate.getId());

		user.setIdEstatus(userToUpdate.getIdEstatus());
		user.setPassword(userToUpdate.getPassword());
		user.setIdEstatus(userToUpdate.getIdEstatus());
		user.setModificacion(userToUpdate.getModificacion());
		user.setIdEmpresa(userToUpdate.getIdEmpresa());
		user.setUsername(userToUpdate.getUsername());
		user.setIdUsuarioModifica(userToUpdate.getIdUsuarioModifica());
		user.setUsuarioCorp(userToUpdate.getUsuarioCorp());
		user = userDAO.updateUser(user);

		Usuario persistedUser = userDAO.getUser(userToUpdate.getUsername());
		result = mapper.map(persistedUser, UsuarioVO.class);

		return result;
	}

	public UsuarioVO updateUserPassword(UsuarioVO userToUpdate) {
		UsuarioVO result;

		Usuario user = userDAO.getUser(userToUpdate.getUsername());
		user.setPassword(userToUpdate.getPassword());
		user = userDAO.updateUser(user);
		result = mapper.map(user, UsuarioVO.class);

		return result;
	}

	public void deleteUser(String userToDelete) {
		userDAO.deleteUser(userToDelete);
	}

	@Override
	public UsuarioVO getUserDatosPersonalesById(Integer id) {
		List<Object> lstEntities = userDAO.getUsersDatosPersonalesById(id);

		if (lstEntities != null)
			for (Object element : lstEntities) {
				Usuario u = (Usuario) ((Object[]) element)[0];

				UsuarioVO uvo = com.teknei.mapper.Mapper.toVO(u);

				return uvo;
			}

		return null;
	}

	@Override
	public int getAllUsersByEmployeeCount(Integer idDatosPersonales, Integer idUser) {
		List<Usuario> users = userDAO.getAllUsersByEmployee(idDatosPersonales);
		boolean sameUser = false;
		if (users != null) {
			if (users.size() >= 1) {
				for (Usuario usuario : users) {
					if (usuario.getId() == idUser) {
						sameUser = true;
					}
				}
				if (sameUser) {
					return 1;
				} else {
					return 2;
				}
			} else {
				return users.size();
			}
		} else {
			return 0;
		}
	}

	@Override
	public UsuarioVO getUserComplete(String userName) {
		Object userComplete = userDAO.getUserComplete(userName);
		UsuarioVO usuarioVO = new UsuarioVO();
		if (userComplete != null) {
				Usuario usuario   = (Usuario) ((Object[]) userComplete)[0];
				
				usuarioVO = com.teknei.mapper.Mapper.toVO(usuario);
				
			}

		return usuarioVO;
	}


	@Override
	public List<UsuarioVO> getAllUsersByEnpresa(Integer idEmpresa) {
		List<Usuario> users = userDAO.getAllUsersByEnpresa(idEmpresa);
		List<UsuarioVO> results = new ArrayList<UsuarioVO>(users.size());

		for (Usuario user : users) {
			UsuarioVO result = mapper.map(user, UsuarioVO.class);
			results.add(result);
		}

		return results;
	}

	@Override
	public UsuarioVO getUserCorp(String userName) {
		Usuario user = userDAO.getUserCorp(userName);

		return com.teknei.mapper.Mapper.toVO(user);
	}
}