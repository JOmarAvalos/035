package com.teknei.vo;

import java.io.Serializable;
import java.util.Date;

public class PreguntaResueltaVO extends BaseVO implements Serializable {
	
	
	private static final long serialVersionUID = -3617796303912330745L;
	
	
	private Integer idActividadResuelta;
	private Integer idPregunta;
	private Integer idRespuesta;
	private String respuestaAbierta;
	private Date creacion;
	
	
	public Integer getIdActividadResuelta() {
		return idActividadResuelta;
	}
	public void setIdActividadResuelta(Integer idActividadResuelta) {
		this.idActividadResuelta = idActividadResuelta;
	}
	
	public Integer getIdPregunta() {
		return idPregunta;
	}
	public void setIdPregunta(Integer idPregunta) {
		this.idPregunta = idPregunta;
	}
	
	public Integer getIdRespuesta() {
		return idRespuesta;
	}
	public void setIdRespuesta(Integer idRespuesta) {
		this.idRespuesta = idRespuesta;
	}
	
	public String getRespuestaAbierta() {
		return respuestaAbierta;
	}
	public void setRespuestaAbierta(String respuestaAbierta) {
		this.respuestaAbierta = respuestaAbierta;
	}
	
	public Date getCreacion() {
		return creacion;
	}
	public void setCreacion(Date creacion) {
		this.creacion = creacion;
	}
	
}
