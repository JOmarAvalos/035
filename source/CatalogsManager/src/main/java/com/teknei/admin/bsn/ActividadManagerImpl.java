package com.teknei.admin.bsn;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teknei.admin.dao.ActividadDAO;
import com.teknei.entity.Actividad;
import com.teknei.mapper.Mapper;
import com.teknei.vo.ActividadVO;


@Service
@Transactional
public class ActividadManagerImpl implements ActividadManager {
	
	private static final Logger LOGGER = Logger.getLogger(ActividadManagerImpl.class);
	
	@Autowired
	private ActividadDAO actividadDAO;

	
	@Override
	public List<ActividadVO> getAll() {
		List<ActividadVO> rs = new ArrayList<ActividadVO>();
		List<Actividad> actividades = actividadDAO.getAll();
		for (Actividad actividad : actividades) {
			rs.add(Mapper.toVO(actividad));
		}
		return rs;
	}
	
}

