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
@Table(name="tbl_preguntas_resueltas")
public class PreguntaResuelta extends BaseEntity<Integer> {

	
	private static final long serialVersionUID = 5981177210512620807L;
	
	
	private Integer idActividadResuelta;
	private Integer idPregunta;
	private Integer idRespuesta;
	private String respuestaAbierta;
	private Date creacion;
	
	
	@Id
	@GeneratedValue(strategy= IDENTITY)
	@Column(name="cve_pregunta_resuelta",unique=true, nullable=false )
	public Integer getId() {
		return super.getId();
	}
	
	@Column(name = "id_actividad", nullable = false)
	public Integer getIdActividadResuelta() {
		return idActividadResuelta;
	}
	public void setIdActividadResuelta(Integer idActividadResuelta) {
		this.idActividadResuelta = idActividadResuelta;
	}
	
	@Column(name = "id_actividad", nullable = false)
	public Integer getIdPregunta() {
		return idPregunta;
	}
	public void setIdPregunta(Integer idPregunta) {
		this.idPregunta = idPregunta;
	}
	
	@Column(name = "id_respuesta", nullable = false)
	public Integer getIdRespuesta() {
		return idRespuesta;
	}
	public void setIdRespuesta(Integer idRespuesta) {
		this.idRespuesta = idRespuesta;
	}
	
	@Column(name = "respuesta_abierta")
	public String getRespuestaAbierta() {
		return respuestaAbierta;
	}
	public void setRespuestaAbierta(String respuestaAbierta) {
		this.respuestaAbierta = respuestaAbierta;
	}
	
	@Column(name = "fch_creacion")
	public Date getCreacion() {
		return creacion;
	}
	public void setCreacion(Date creacion) {
		this.creacion = creacion;
	}
	
}
