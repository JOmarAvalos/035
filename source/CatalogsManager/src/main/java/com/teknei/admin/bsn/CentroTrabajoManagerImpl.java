package com.teknei.admin.bsn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teknei.admin.dao.CentroTrabajoDAO;
import com.teknei.entity.CentroTrabajo;
import com.teknei.mapper.Mapper;
import com.teknei.vo.CentroTrabajoVO;

@Service
@Transactional
public class CentroTrabajoManagerImpl implements CentroTrabajoManager{
	
	@Autowired
	private CentroTrabajoDAO centroTrabajoDAO;

	@Override
	public CentroTrabajoVO getByUuario(Integer idUsuario) {
		return Mapper.toVO(centroTrabajoDAO.getByUsuario(idUsuario));
	}

	@Override
	public CentroTrabajoVO save(CentroTrabajoVO centro) {
		
		if(centro.getId() != null && centro.getId() > 0) {
			CentroTrabajo centroOld = centroTrabajoDAO.find(centro.getId());
			
			centroOld.setEmpleadoNumero(centro.getEmpleadoNumero());
			centroOld.setFacEstado(centro.getFacEstado());
			centroOld.setNombre(centro.getNombre());
			centroOld.setIdUsuarioModifica(centro.getIdUsuarioModifica());
			centroOld.setModificacion(centro.getModificacion());
			
			centro = Mapper.toVO(centroTrabajoDAO.update(centroOld));
		}else {
			CentroTrabajo centroE = Mapper.toEntity(centro);
			centro = Mapper.toVO(centroTrabajoDAO.save(centroE));
		}
		return centro;
	}

}
