package com.teknei.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class CuestionarioVO extends BaseVO implements Serializable {
	
	
	private static final long serialVersionUID = 4612531967742769066L;
	
	
	private String nombre;
	private String titulo;
	private String descripcion;
	private Integer empleadosRangoInicial;
	private Integer empleadosRangoFinal;
	private Integer orden;
	private Integer diasLimiteActividad;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	private Integer banActivo;
	
	private List<PreguntaVO> preguntas;
	
	private ActividadVO actividad;
	
	private Integer resueltos;
	
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public Integer getEmpleadosRangoInicial() {
		return empleadosRangoInicial;
	}
	public void setEmpleadosRangoInicial(Integer empleadosRangoInicial) {
		this.empleadosRangoInicial = empleadosRangoInicial;
	}
	
	public Integer getEmpleadosRangoFinal() {
		return empleadosRangoFinal;
	}
	public void setEmpleadosRangoFinal(Integer empleadosRangoFinal) {
		this.empleadosRangoFinal = empleadosRangoFinal;
	}
	
	public Integer getOrden() {
		return orden;
	}
	public void setOrden(Integer orden) {
		this.orden = orden;
	}
	
	public Integer getDiasLimiteActividad() {
		return diasLimiteActividad;
	}
	public void setDiasLimiteActividad(Integer diasLimiteActividad) {
		this.diasLimiteActividad = diasLimiteActividad;
	}
	
	public Integer getIdUsuarioCrea() {
		return idUsuarioCrea;
	}
	public void setIdUsuarioCrea(Integer idUsuarioCrea) {
		this.idUsuarioCrea = idUsuarioCrea;
	}
	
	public Integer getIdUsuarioModifica() {
		return idUsuarioModifica;
	}
	public void setIdUsuarioModifica(Integer idUsuarioModifica) {
		this.idUsuarioModifica = idUsuarioModifica;
	}
	
	public Date getCreacion() {
		return creacion;
	}
	public void setCreacion(Date creacion) {
		this.creacion = creacion;
	}
	
	public Date getModificacion() {
		return modificacion;
	}
	public void setModificacion(Date modificacion) {
		this.modificacion = modificacion;
	}
	
	public Integer getBanActivo() {
		return banActivo;
	}
	public void setBanActivo(Integer banActivo) {
		this.banActivo = banActivo;
	}
	/**
	 * @return the preguntas
	 */
	public List<PreguntaVO> getPreguntas() {
		return preguntas;
	}
	/**
	 * @param preguntas the preguntas to set
	 */
	public void setPreguntas(List<PreguntaVO> preguntas) {
		this.preguntas = preguntas;
	}
	/**
	 * @return the actividad
	 */
	public ActividadVO getActividad() {
		return actividad;
	}
	/**
	 * @param actividad the actividad to set
	 */
	public void setActividad(ActividadVO actividad) {
		this.actividad = actividad;
	}
	/**
	 * @return the resueltos
	 */
	public Integer getResueltos() {
		return resueltos;
	}
	/**
	 * @param resueltos the resueltos to set
	 */
	public void setResueltos(Integer resueltos) {
		this.resueltos = resueltos;
	}
	
}
