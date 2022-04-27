package com.teknei.admin.bsn;

import java.util.List;

import com.teknei.vo.CuestionarioVO;

public interface CuestionariosManager {
	
	CuestionarioVO getCustonarioCompleto(Integer id);
	List<CuestionarioVO> getCuestionariosByCentro(Integer idCentro);

}
