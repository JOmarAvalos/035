package com.teknei.admin.bsn;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teknei.admin.dao.GiroDAO;
import com.teknei.entity.Giro;
import com.teknei.mapper.Mapper;
import com.teknei.vo.GiroVO;

@Service
@Transactional
public class GiroManagerImpl implements GiroManager{
	
	@Autowired
	private GiroDAO giroDAO;

	@Override
	public List<GiroVO> getGiros() {
		
		List<GiroVO> resp = new ArrayList<GiroVO>();
		
		for(Giro giro: giroDAO.getAll()) {
			resp.add(Mapper.toVO(giro));
		}
		
		return resp;
	}

}
