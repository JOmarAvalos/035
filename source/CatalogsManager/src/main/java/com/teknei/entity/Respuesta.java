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
@Table(name="tbl_respuestas")
public class Respuesta extends BaseEntity<Integer> {

	
	private static final long serialVersionUID = 5981177210512621007L;
	
	
	private Integer idPregunta;
	private String nombre;
	private Integer orden;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	private Integer banActivo;
	
	
	@Id
	@GeneratedValue(strategy= IDENTITY)
	@Column(name="cve_respuesta",unique=true, nullable=false )
	public Integer getId() {
		return super.getId();
	}
	
	@Column(name = "id_pregunta", nullable = false)
	public Integer getIdPregunta() {
		return idPregunta;
	}
	public void setIdPregunta(Integer idPregunta) {
		this.idPregunta = idPregunta;
	}
	
	@Column(name = "nombre")
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@Column(name = "orden")
	public Integer getOrden() {
		return orden;
	}
	public void setOrden(Integer orden) {
		this.orden = orden;
	}
	
	@Column(name = "id_usuario_crea")
	public Integer getIdUsuarioCrea() {
		return idUsuarioCrea;
	}
	public void setIdUsuarioCrea(Integer idUsuarioCrea) {
		this.idUsuarioCrea = idUsuarioCrea;
	}
	
	@Column(name = "id_usuario_modifica")
	public Integer getIdUsuarioModifica() {
		return idUsuarioModifica;
	}
	public void setIdUsuarioModifica(Integer idUsuarioModifica) {
		this.idUsuarioModifica = idUsuarioModifica;
	}
	
	@Column(name = "fch_creacion")
	public Date getCreacion() {
		return creacion;
	}
	public void setCreacion(Date creacion) {
		this.creacion = creacion;
	}
	
	@Column(name = "fch_modificacion")
	public Date getModificacion() {
		return modificacion;
	}
	public void setModificacion(Date modificacion) {
		this.modificacion = modificacion;
	}
	
	@Column(name = "ban_activo")
	public Integer getBanActivo() {
		return banActivo;
	}
	public void setBanActivo(Integer banActivo) {
		this.banActivo = banActivo;
	}
	
}
