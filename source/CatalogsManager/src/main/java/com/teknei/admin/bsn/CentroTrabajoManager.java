package com.teknei.admin.bsn;

import com.teknei.vo.CentroTrabajoVO;

public interface CentroTrabajoManager {
	
	CentroTrabajoVO getByUuario(Integer idUsuario);
	
	CentroTrabajoVO save(CentroTrabajoVO centro);

}
