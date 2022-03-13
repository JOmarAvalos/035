package com.teknei.mapper;

import com.teknei.entity.*;
import com.teknei.vo.*;

public class Mapper {

	//////////////////////////////

	public static UsuarioVO toVO(Usuario u) {
		if (u == null)
			return null;

		UsuarioVO us = new UsuarioVO();
		us.setId(u.getId());
		us.setUsuario(u.getUsuario());
		us.setContrasena(u.getContrasena());
		us.setNombre(u.getNombre());
		us.setEmail(u.getEmail());
		us.setIdPerfil(u.getIdPerfil());
		us.setCreacion(u.getCreacion());
		us.setModificacion(u.getModificacion());
		us.setIdUsuarioCrea(u.getIdUsuarioCrea());
		us.setIdUsuarioModifica(u.getIdUsuarioModifica());
		us.setEstatus(u.getEstatus());
		us.setBanActivo(u.getBanActivo());

		return us;
	}

	public static Usuario toEntity(UsuarioVO us) {
		if (us == null)
			return null;

		Usuario u = new Usuario();

		u.setId(us.getId());
		u.setUsuario(us.getUsuario());
		u.setContrasena(us.getContrasena());
		u.setNombre(us.getNombre());
		u.setEmail(us.getEmail());
		u.setIdPerfil(us.getIdPerfil());
		u.setCreacion(us.getCreacion());
		u.setModificacion(us.getModificacion());
		u.setIdUsuarioCrea(us.getIdUsuarioCrea());
		u.setIdUsuarioModifica(us.getIdUsuarioModifica());
		u.setEstatus(us.getEstatus());
		u.setBanActivo(us.getBanActivo());

		return u;
	}

	
	//////////////////////////////
	
	public static GiroVO toVO(Giro g) {
		if (g == null) {
			return null;
		}
	
		GiroVO gi = new GiroVO();

		gi.setId(g.getId());
		gi.setNombre(g.getNombre());
		gi.setBanActivo(g.getBanActivo());

		return gi;
	}
	
	public static Giro toEntity(GiroVO gi) {
		if (gi == null) {
			return null;
		}
	
		Giro g = new Giro();
		
		g.setId(gi.getId());
		g.setNombre(gi.getNombre());
		g.setBanActivo(gi.getBanActivo());
	
		return g;
	}
	
	//////////////////////////////
	
	public static EstadoRepublicaVO toVO(EstadoRepublica e) {
		if (e == null) {
			return null;
		}
	
		EstadoRepublicaVO es = new EstadoRepublicaVO();

		es.setId(e.getId());
		es.setNombre(e.getNombre());
		es.setBanActivo(e.getBanActivo());

		return es;
	}
	
	public static EstadoRepublica toEntity(EstadoRepublicaVO es) {
		if (es == null) {
			return null;
		}
	
		EstadoRepublica e = new EstadoRepublica();
		
		e.setId(es.getId());
		e.setNombre(es.getNombre());
		e.setBanActivo(es.getBanActivo());

		return e;
	}
	
	//////////////////////////////
	
	public static PerfilVO toVO(Perfil p) {
		if (p == null) {
			return null;
		}
	
		PerfilVO pe = new PerfilVO();

		pe.setId(p.getId());
		pe.setNombre(p.getNombre());
		pe.setBanActivo(p.getBanActivo());

		return pe;
	}
	
	public static Perfil toEntity(PerfilVO pe) {
		if (pe == null) {
			return null;
		}
	
		Perfil p = new Perfil();
		
		p.setId(pe.getId());
		p.setNombre(pe.getNombre());
		p.setBanActivo(pe.getBanActivo());

		return p;
	}
	
	//////////////////////////////
	
	public static MenuVO toVO(Menu m) {
		if (m == null) {
			return null;
		}
	
		MenuVO me = new MenuVO();

		me.setId(m.getId());
		me.setNombre(m.getNombre());
		me.setOrden(m.getOrden());
		me.setBanActivo(m.getBanActivo());

		return me;
	}
	
	public static Menu toEntity(MenuVO me) {
		if (me == null) {
			return null;
		}
	
		Menu m = new Menu();
		
		m.setId(me.getId());
		m.setNombre(me.getNombre());
		m.setOrden(me.getOrden());
		m.setBanActivo(me.getBanActivo());

		return m;
	}
	
	//////////////////////////////
	
	public static PreguntaTipoVO toVO(PreguntaTipo p) {
		if (p == null) {
			return null;
		}
	
		PreguntaTipoVO pe = new PreguntaTipoVO();

		pe.setId(p.getId());
		pe.setNombre(p.getNombre());
		pe.setBanActivo(p.getBanActivo());

		return pe;
	}
	
	public static PreguntaTipo toEntity(PreguntaTipoVO pe) {
		if (pe == null) {
			return null;
		}
	
		PreguntaTipo p = new PreguntaTipo();
		
		p.setId(pe.getId());
		p.setNombre(pe.getNombre());
		p.setBanActivo(pe.getBanActivo());

		return p;
	}
	
	//////////////////////////////
	
	public static ActividadEstatusVO toVO(ActividadEstatus a) {
		if (a == null) {
			return null;
		}
	
		ActividadEstatusVO ac = new ActividadEstatusVO();

		ac.setId(a.getId());
		ac.setNombre(a.getNombre());
		ac.setBanActivo(a.getBanActivo());

		return ac;
	}
	
	public static ActividadEstatus toEntity(ActividadEstatusVO ac) {
		if (ac == null) {
			return null;
		}
	
		ActividadEstatus a = new ActividadEstatus();
		
		a.setId(ac.getId());
		a.setNombre(ac.getNombre());
		a.setBanActivo(ac.getBanActivo());

		return a;
	}
	
	//////////////////////////////
	
	public static PerfilMenuVO toVO(PerfilMenu p) {
		if (p == null) {
			return null;
		}
	
		PerfilMenuVO pe = new PerfilMenuVO();

		pe.setId(p.getId());
		pe.setIdPerfil(p.getIdPerfil());
		pe.setIdMenu(p.getIdMenu());
		pe.setIdUsuarioCrea(p.getIdUsuarioCrea());
		pe.setIdUsuarioModifica(p.getIdUsuarioModifica());
		pe.setCreacion(p.getCreacion());
		pe.setModificacion(p.getModificacion());

		return pe;
	}
	
	public static PerfilMenu toEntity(PerfilMenuVO pe) {
		if (pe == null) {
			return null;
		}
	
		PerfilMenu p = new PerfilMenu();
		
		p.setId(pe.getId());
		p.setIdPerfil(pe.getIdPerfil());
		p.setIdMenu(pe.getIdMenu());
		p.setIdUsuarioCrea(pe.getIdUsuarioCrea());
		p.setIdUsuarioModifica(pe.getIdUsuarioModifica());
		p.setCreacion(pe.getCreacion());
		p.setModificacion(pe.getModificacion());

		return p;
	}
	
	//////////////////////////////
	
	public static CentroTrabajoVO toVO(CentroTrabajo c) {
		if (c == null) {
			return null;
		}
	
		CentroTrabajoVO ce = new CentroTrabajoVO();

		ce.setId(c.getId());
		ce.setNombre(c.getNombre());
		ce.setEmpleadoNumero(c.getEmpleadoNumero());
		ce.setIdUsuario(c.getIdUsuario());
		ce.setIdGiro(c.getIdGiro());
		ce.setFacNombre(c.getFacNombre());
		ce.setFacRfc(c.getFacRfc());
		ce.setFacPais(c.getFacPais());
		ce.setFacEstado(c.getFacEstado());
		ce.setFacMunicipio(c.getFacMunicipio());
		ce.setFacColonia(c.getFacColonia());
		ce.setFacCalle(c.getFacCalle());
		ce.setFacNumeroExterior(c.getFacNumeroExterior());
		ce.setFacNumeroInterior(c.getFacNumeroInterior());
		ce.setFacCp(c.getFacCp());
		ce.setFacTelefono(c.getFacTelefono());
		ce.setIdUsuarioCrea(c.getIdUsuarioCrea());
		ce.setIdUsuarioModifica(c.getIdUsuarioModifica());
		ce.setCreacion(c.getCreacion());
		ce.setModificacion(c.getModificacion());
		ce.setBanActivo(c.getBanActivo());

		return ce;
	}
	
	public static CentroTrabajo toEntity(CentroTrabajoVO ce) {
		if (ce == null) {
			return null;
		}
	
		CentroTrabajo c = new CentroTrabajo();
		
		c.setId(ce.getId());
		c.setNombre(ce.getNombre());
		c.setEmpleadoNumero(ce.getEmpleadoNumero());
		c.setIdUsuario(ce.getIdUsuario());
		c.setIdGiro(ce.getIdGiro());
		c.setIdEstadoRepublica(ce.getIdEstadoRepublica());
		c.setFacNombre(ce.getFacNombre());
		c.setFacRfc(ce.getFacRfc());
		c.setFacPais(ce.getFacPais());
		c.setFacEstado(ce.getFacEstado());
		c.setFacMunicipio(ce.getFacMunicipio());
		c.setFacColonia(ce.getFacColonia());
		c.setFacCalle(ce.getFacCalle());
		c.setFacNumeroExterior(ce.getFacNumeroExterior());
		c.setFacNumeroInterior(ce.getFacNumeroInterior());
		c.setFacCp(ce.getFacCp());
		c.setFacTelefono(ce.getFacTelefono());
		c.setIdUsuarioCrea(ce.getIdUsuarioCrea());
		c.setIdUsuarioModifica(ce.getIdUsuarioModifica());
		c.setCreacion(ce.getCreacion());
		c.setModificacion(ce.getModificacion());
		c.setBanActivo(ce.getBanActivo());

		return c;
	}
	
	//////////////////////////////
	
	public static CuestionarioVO toVO(Cuestionario c) {
		if (c == null) {
			return null;
		}
	
		CuestionarioVO cu = new CuestionarioVO();

		cu.setId(c.getId());
		cu.setNombre(c.getNombre());
		cu.setTitulo(c.getTitulo());
		cu.setDescripcion(c.getDescripcion());
		cu.setEmpleadosRangoInicial(c.getEmpleadosRangoInicial());
		cu.setEmpleadosRangoFinal(c.getEmpleadosRangoFinal());
		cu.setOrden(c.getOrden());
		cu.setDiasLimiteActividad(c.getDiasLimiteActividad());
		cu.setCosto(c.getCosto());
		cu.setIdUsuarioCrea(c.getIdUsuarioCrea());
		cu.setIdUsuarioModifica(c.getIdUsuarioModifica());
		cu.setCreacion(c.getCreacion());
		cu.setModificacion(c.getModificacion());
		cu.setBanActivo(c.getBanActivo());

		return cu;
	}
	
	public static Cuestionario toEntity(CuestionarioVO cu) {
		if (cu == null) {
			return null;
		}
	
		Cuestionario c = new Cuestionario();
		
		c.setId(cu.getId());
		c.setNombre(cu.getNombre());
		c.setTitulo(cu.getTitulo());
		c.setDescripcion(cu.getDescripcion());
		c.setEmpleadosRangoInicial(cu.getEmpleadosRangoInicial());
		c.setEmpleadosRangoInicial(cu.getEmpleadosRangoFinal());
		c.setOrden(cu.getOrden());
		c.setDiasLimiteActividad(cu.getDiasLimiteActividad());
		c.setCosto(cu.getCosto());
		c.setIdUsuarioCrea(cu.getIdUsuarioCrea());
		c.setIdUsuarioModifica(cu.getIdUsuarioModifica());
		c.setCreacion(cu.getCreacion());
		c.setModificacion(cu.getModificacion());
		c.setBanActivo(cu.getBanActivo());

		return c;
	}
	
	//////////////////////////////
	
	public static PreguntaVO toVO(Pregunta p) {
		if (p == null) {
			return null;
		}
	
		PreguntaVO pr = new PreguntaVO();

		pr.setId(p.getId());
		pr.setIdCuestionario(p.getIdCuestionario());
		pr.setIdPreguntaTipo(p.getIdPreguntaTipo());
		pr.setSeccion(p.getSeccion());
		pr.setNombre(p.getNombre());
		pr.setTitulo(p.getTitulo());
		pr.setDescripcion(p.getDescripcion());
		pr.setOrden(p.getOrden());
		pr.setIdUsuarioCrea(p.getIdUsuarioCrea());
		pr.setIdUsuarioModifica(p.getIdUsuarioModifica());
		pr.setCreacion(p.getCreacion());
		pr.setModificacion(p.getModificacion());
		pr.setBanActivo(p.getBanActivo());

		return pr;
	}
	
	public static Pregunta toEntity(PreguntaVO pr) {
		if (pr == null) {
			return null;
		}
	
		Pregunta p = new Pregunta();
		
		p.setId(pr.getId());
		p.setIdCuestionario(pr.getIdCuestionario());
		p.setIdPreguntaTipo(pr.getIdPreguntaTipo());
		p.setSeccion(pr.getSeccion());
		p.setNombre(pr.getNombre());
		p.setTitulo(pr.getTitulo());
		p.setDescripcion(pr.getDescripcion());
		p.setOrden(pr.getOrden());
		p.setIdUsuarioCrea(pr.getIdUsuarioCrea());
		p.setIdUsuarioModifica(pr.getIdUsuarioModifica());
		p.setCreacion(pr.getCreacion());
		p.setModificacion(pr.getModificacion());
		p.setBanActivo(pr.getBanActivo());

		return p;
	}
	
	//////////////////////////////
	
	public static RespuestaVO toVO(Respuesta r) {
		if (r == null) {
			return null;
		}
	
		RespuestaVO re = new RespuestaVO();

		re.setId(r.getId());
		re.setIdPregunta(r.getIdPregunta());
		re.setNombre(r.getNombre());
		re.setOrden(r.getOrden());
		re.setIdUsuarioCrea(r.getIdUsuarioCrea());
		re.setIdUsuarioModifica(r.getIdUsuarioModifica());
		re.setCreacion(r.getCreacion());
		re.setModificacion(r.getModificacion());
		re.setBanActivo(r.getBanActivo());

		return re;
	}
	
	public static Respuesta toEntity(RespuestaVO re) {
		if (re == null) {
			return null;
		}
	
		Respuesta r = new Respuesta();
		
		r.setId(re.getId());
		r.setIdPregunta(re.getIdPregunta());
		r.setNombre(re.getNombre());
		r.setOrden(re.getOrden());
		r.setIdUsuarioCrea(re.getIdUsuarioCrea());
		r.setIdUsuarioModifica(re.getIdUsuarioModifica());
		r.setCreacion(re.getCreacion());
		r.setModificacion(re.getModificacion());
		r.setBanActivo(re.getBanActivo());

		return r;
	}
	
	//////////////////////////////
	
	public static ActividadVO toVO(Actividad a) {
		if (a == null) {
			return null;
		}
	
		ActividadVO ac = new ActividadVO();

		ac.setId(a.getId());
		ac.setIdCentroTrabajo(a.getIdCentroTrabajo());
		ac.setIdCuestionario(a.getIdCuestionario());
		ac.setCodigo(a.getCodigo());
		ac.setRutaCuestionario(a.getRutaCuestionario());
		ac.setRutaRespuesta(a.getRutaRespuesta());
		ac.setNumeroReferenciaPago(a.getNumeroReferenciaPago());
		ac.setCosto(a.getCosto());
		ac.setIva(a.getIva());
		ac.setTotal(a.getTotal());
		ac.setIdUsuarioCrea(a.getIdUsuarioCrea());
		ac.setIdUsuarioModifica(a.getIdUsuarioModifica());
		ac.setCreacion(a.getCreacion());
		ac.setModificacion(a.getModificacion());
		ac.setIdActividadEstatus(a.getIdActividadEstatus());

		return ac;
	}
	
	public static Actividad toEntity(ActividadVO ac) {
		if (ac == null) {
			return null;
		}
	
		Actividad a = new Actividad();
		
		a.setId(ac.getId());
		a.setIdCentroTrabajo(ac.getIdCentroTrabajo());
		a.setIdCuestionario(ac.getIdCuestionario());
		a.setCodigo(ac.getCodigo());
		a.setRutaCuestionario(ac.getRutaCuestionario());
		a.setRutaRespuesta(ac.getRutaRespuesta());
		a.setNumeroReferenciaPago(ac.getNumeroReferenciaPago());
		a.setCosto(ac.getCosto());
		a.setIva(ac.getIva());
		a.setTotal(ac.getTotal());
		a.setIdUsuarioCrea(ac.getIdUsuarioCrea());
		a.setIdUsuarioModifica(ac.getIdUsuarioModifica());
		a.setCreacion(ac.getCreacion());
		a.setModificacion(ac.getModificacion());
		a.setIdActividadEstatus(ac.getIdActividadEstatus());

		return a;
	}
	
	//////////////////////////////
	
	public static ActividadResueltaVO toVO(ActividadResuelta a) {
		if (a == null) {
			return null;
		}
	
		ActividadResueltaVO ac = new ActividadResueltaVO();

		ac.setId(a.getId());
		ac.setIdActividad(a.getIdActividad());
		ac.setNombre(a.getNombre());
		ac.setPaterno(a.getPaterno());
		ac.setMaterno(a.getMaterno());
		ac.setCreacion(a.getCreacion());
		ac.setEstatus(a.getEstatus());

		return ac;
	}
	
	public static ActividadResuelta toEntity(ActividadResueltaVO ac) {
		if (ac == null) {
			return null;
		}
	
		ActividadResuelta a = new ActividadResuelta();
		
		a.setId(ac.getId());
		a.setIdActividad(ac.getIdActividad());
		a.setNombre(ac.getNombre());
		a.setPaterno(ac.getPaterno());
		a.setMaterno(ac.getMaterno());
		a.setCreacion(ac.getCreacion());
		a.setEstatus(ac.getEstatus());

		return a;
	}
	
	//////////////////////////////
	
	public static PreguntaResueltaVO toVO(PreguntaResuelta p) {
		if (p == null) {
			return null;
		}
	
		PreguntaResueltaVO pr = new PreguntaResueltaVO();

		pr.setId(p.getId());
		pr.setIdActividadResuelta(p.getIdActividadResuelta());
		pr.setIdPregunta(p.getIdPregunta());
		pr.setIdRespuesta(p.getIdRespuesta());
		pr.setRespuestaAbierta(p.getRespuestaAbierta());
		pr.setCreacion(p.getCreacion());

		return pr;
	}
	
	public static PreguntaResuelta toEntity(PreguntaResueltaVO pr) {
		if (pr == null) {
			return null;
		}
	
		PreguntaResuelta p = new PreguntaResuelta();
		
		p.setId(pr.getId());
		p.setIdActividadResuelta(pr.getIdActividadResuelta());
		p.setIdPregunta(pr.getIdPregunta());
		p.setIdRespuesta(pr.getIdRespuesta());
		p.setRespuestaAbierta(pr.getRespuestaAbierta());
		p.setCreacion(pr.getCreacion());

		return p;
	}
	
	//////////////////////////////
	
}

