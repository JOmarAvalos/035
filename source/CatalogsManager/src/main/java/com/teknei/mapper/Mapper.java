package com.teknei.mapper;

import com.teknei.entity.*;
import com.teknei.vo.*;

public class Mapper {

	//////////////////////////////

	public static UsuarioVO toVO(Usuario p) {
		if (p == null)
			return null;

		UsuarioVO pvo = new UsuarioVO();
		pvo.setId(p.getId());
		pvo.setUsername(p.getUsername());
		pvo.setPassword(p.getPassword());
		pvo.setIdEstatus(p.getIdEstatus());
		pvo.setCreacion(p.getCreacion());
		pvo.setModificacion(p.getModificacion());
		pvo.setIdEmpresa(p.getIdEmpresa());
		pvo.setIdUsuarioCrea(p.getIdUsuarioCrea());
		pvo.setIdUsuarioModifica(p.getIdUsuarioModifica());
		pvo.setUsuarioCorp(p.getUsuarioCorp());

		return pvo;
	}

	public static Usuario toEntity(UsuarioVO usu) {
		if (usu == null)
			return null;

		Usuario u = new Usuario();

		u.setId(usu.getId());
		u.setUsername(usu.getUsername());
		u.setPassword(usu.getPassword());
		u.setIdEstatus(usu.getIdEstatus());
		u.setCreacion(usu.getCreacion());
		u.setModificacion(usu.getModificacion());
		u.setIdEmpresa(usu.getIdEmpresa());
		u.setIdUsuarioCrea(usu.getIdUsuarioCrea());
		u.setIdUsuarioModifica(usu.getIdUsuarioModifica());
		u.setUsuarioCorp(usu.getUsuarioCorp());

		return u;
	}

	///////////////////////
	public static ActividadVO toVO(Actividad a) {
		if (a == null) {
			return null;
		}
		ActividadVO av = new ActividadVO();

		av.setId(a.getId());
		av.setIdCurso(a.getIdCurso());
		av.setIdTipoActividad(a.getIdTipoActividad());
		av.setNombre(a.getNombre());
		av.setDescripcion(a.getDescripcion());
		av.setOrden(a.getOrden());
		av.setBanActivo(a.getBanActivo());
		av.setIdUsuarioCrea(a.getIdUsuarioCrea());
		av.setIdUsuarioModifica(a.getIdUsuarioModifica());
		av.setCreacion(a.getCreacion());
		av.setModificacion(a.getModificacion());
		av.setRuta(a.getRuta());
		av.setUrl(a.getUrl());
		av.setTiempoEstimado(a.getTiempoEstimado());
		av.setNumeroOportunidades(a.getNumeroOportunidades());
		av.setPreguntasMostrar(a.getPreguntasMostrar());
		av.setPreguntasAleatorias(a.getPreguntasAleatorias());
		av.setPromedia(a.getPromedia());
		av.setPromediaPorcentaje(a.getPromediaPorcentaje());
		av.setCalificacionMinimaPorcentaje(a.getCalificacionMinimaPorcentaje());
		av.setNombreEn(a.getNombreEn());
		av.setNombreFr(a.getNombreFr());
		av.setDescripcionEn(a.getDescripcionEn());
		av.setDescripcionFr(a.getDescripcionFr());
		
		if(a.getCalificacionMinima() == null) {
			av.setCalificacionMinima(false);
		}else {
			av.setCalificacionMinima(a.getCalificacionMinima());
		}

		return av;
	}

	public static Actividad toEntity(ActividadVO av) {
		if (av == null) {
			return null;
		}

		Actividad a = new Actividad();
		a.setId(av.getId());

		a.setIdCurso(av.getIdCurso());
		a.setIdTipoActividad(av.getIdTipoActividad());
		a.setNombre(av.getNombre());
		a.setDescripcion(av.getDescripcion());
		a.setOrden(av.getOrden());
		a.setBanActivo(av.getBanActivo());
		a.setIdUsuarioCrea(av.getIdUsuarioCrea());
		a.setIdUsuarioModifica(av.getIdUsuarioModifica());
		a.setCreacion(av.getCreacion());
		a.setModificacion(av.getModificacion());
		a.setRuta(av.getRuta());
		a.setUrl(av.getUrl());
		a.setTiempoEstimado(av.getTiempoEstimado());
		a.setNumeroOportunidades(av.getNumeroOportunidades());
		a.setPreguntasMostrar(av.getPreguntasMostrar());
		a.setPreguntasAleatorias(av.getPreguntasAleatorias());
		a.setPromedia(av.getPromedia());
		a.setPromediaPorcentaje(av.getPromediaPorcentaje());
		a.setCalificacionMinima(av.getCalificacionMinima());
		a.setCalificacionMinimaPorcentaje(av.getCalificacionMinimaPorcentaje());
		a.setNombreEn(av.getNombreEn());
		a.setNombreFr(av.getNombreFr());
		a.setDescripcionEn(av.getDescripcionEn());
		a.setDescripcionFr(av.getDescripcionFr());
		
		if(av.getCalificacionMinima() == null) {
			a.setCalificacionMinima(false);
		}else {
			a.setCalificacionMinima(av.getCalificacionMinima());
		}

		return a;
	}
	
}

