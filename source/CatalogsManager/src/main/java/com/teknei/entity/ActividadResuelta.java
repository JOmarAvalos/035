package com.teknei.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import static javax.persistence.GenerationType.IDENTITY;

import com.teknei.base.entity.BaseEntity;

@Entity
@Table(name="tbl_actividades_resueltas")
public class ActividadResuelta extends BaseEntity<Integer> {

	
	private static final long serialVersionUID = 5981177210512620607L;
	
	
	private Integer idActividad;
	private String nombre;
	private String paterno;
	private String materno;
	private Date creacion;
	private Integer estatus;
	
	
	@Id
	@GeneratedValue(strategy= IDENTITY)
	@Column(name="cve_actividad_resuelta",unique=true, nullable=false )
	public Integer getId() {
		return super.getId();
	}

	@Column(name = "id_actividad", nullable = false)
	public Integer getIdActividad() {
		return idActividad;
	}
	public void setIdActividad(Integer idActividad) {
		this.idActividad = idActividad;
	}

	@Column(name = "nombre")
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "paterno")
	public String getPaterno() {
		return paterno;
	}
	public void setPaterno(String paterno) {
		this.paterno = paterno;
	}

	@Column(name = "materno")
	public String getMaterno() {
		return materno;
	}
	public void setMaterno(String materno) {
		this.materno = materno;
	}

	@Column(name = "fch_creacion")
	public Date getCreacion() {
		return creacion;
	}
	public void setCreacion(Date creacion) {
		this.creacion = creacion;
	}

	@Column(name = "estatus")
	public Integer getEstatus() {
		return estatus;
	}
	public void setEstatus(Integer estatus) {
		this.estatus = estatus;
	}
	
}
