package com.teknei.vo;

import java.io.Serializable;
import java.util.Date;

public class ActividadResueltaVO extends BaseVO implements Serializable {
	
	
	private static final long serialVersionUID = -3617796303912330645L;
	
	
	private Integer idActividad;
	private String nombre;
	private String paterno;
	private String materno;
	private Date creacion;
	private Integer estatus;
	
	
	public Integer getIdActividad() {
		return idActividad;
	}
	public void setIdActividad(Integer idActividad) {
		this.idActividad = idActividad;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getPaterno() {
		return paterno;
	}
	public void setPaterno(String paterno) {
		this.paterno = paterno;
	}
	
	public String getMaterno() {
		return materno;
	}
	public void setMaterno(String materno) {
		this.materno = materno;
	}
	
	public Date getCreacion() {
		return creacion;
	}
	public void setCreacion(Date creacion) {
		this.creacion = creacion;
	}
	
	public Integer getEstatus() {
		return estatus;
	}
	public void setEstatus(Integer estatus) {
		this.estatus = estatus;
	}
	
}
