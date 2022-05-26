package com.teknei.admin.bsn;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teknei.admin.dao.ActividadDAO;
import com.teknei.admin.dao.CentroTrabajoDAO;
import com.teknei.admin.dao.CuestionarioDAO;
import com.teknei.admin.dao.ProductoCompradoDAO;
import com.teknei.admin.dao.ProductoDAO;
import com.teknei.entity.Actividad;
import com.teknei.entity.CentroTrabajo;
import com.teknei.entity.Cuestionario;
import com.teknei.entity.Producto;
import com.teknei.entity.ProductoComprado;
import com.teknei.mapper.Mapper;
import com.teknei.util.Constants;
import com.teknei.vo.CentroTrabajoVO;

@Service
@Transactional
public class CentroTrabajoManagerImpl implements CentroTrabajoManager{
	
	@Autowired
	private CentroTrabajoDAO centroTrabajoDAO;
	@Autowired
	private CuestionarioDAO cuestionarioDAO;
	@Autowired
	private ActividadDAO actividadDAO;
	@Autowired
	private ProductoDAO productoDAO;
	@Autowired
	private ProductoCompradoDAO productoCompradoDAO;

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
			
			List<Cuestionario> cuestionarios = cuestionarioDAO.getByCentro(centro.getId());
			for(Cuestionario cuestionario: cuestionarios) {
				Actividad actividad = new Actividad();
				actividad.setIdCuestionario(cuestionario.getId());
				actividad.setIdUsuarioCrea(centro.getIdUsuarioCrea());
				actividad.setCreacion(new Date());
				
				actividadDAO.save(actividad);
				
			}
			
			List<Producto> productos = productoDAO.getByRango(centro.getId());
			
			for(Producto producto: productos) {
				ProductoComprado productoComprado = new ProductoComprado();
				productoComprado.setIdCentroTrabajo(centro.getId());
				productoComprado.setIdProducto(producto.getId());
				productoComprado.setCosto(producto.getPrecio());
				productoComprado.setIdUsuarioCrea(centro.getIdUsuarioCrea());
				productoComprado.setCreacion(new Date());
				productoComprado.setIdCompraEstatus(Constants.ID_PRODUCTO_DISPONIBLE);
				
				productoCompradoDAO.save(productoComprado);
			}
		}
		return centro;
	}

}
