package com.teknei.admin.bsn;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teknei.admin.dao.EstadoRepublicaDAO;
import com.teknei.entity.EstadoRepublica;
import com.teknei.mapper.Mapper;
import com.teknei.vo.EstadoRepublicaVO;

@Transactional
@Service
public class EstadoRepublicaManagerImpl implements EstadoRepublicaManager{
	
	@Autowired
	private EstadoRepublicaDAO estadoRepublicaDAO;

	@Override
	public List<EstadoRepublicaVO> getAll() {
		
		List<EstadoRepublicaVO> resp = new ArrayList<EstadoRepublicaVO>();
		for(EstadoRepublica estado: estadoRepublicaDAO.getAll()) {
			resp.add(Mapper.toVO(estado));
		}
		return resp;
	}

}
