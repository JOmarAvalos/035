package com.teknei.vo;

import java.io.Serializable;
import java.util.Date;


public class ActividadVO extends BaseVO implements Serializable {

	
	private static final long serialVersionUID = -3617796303912330545L;


	private Integer idCuestionario;
	private Integer idCentroTrabajo;
	private String rutaCuestionario;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	private Date fin;

	
	public Integer getIdCuestionario() {
		return idCuestionario;
	}
	public void setIdCuestionario(Integer idCuestionario) {
		this.idCuestionario = idCuestionario;
	}
	
	/**
	 * @return the idCentroTrabajo
	 */
	public Integer getIdCentroTrabajo() {
		return idCentroTrabajo;
	}
	/**
	 * @param idCentroTrabajo the idCentroTrabajo to set
	 */
	public void setIdCentroTrabajo(Integer idCentroTrabajo) {
		this.idCentroTrabajo = idCentroTrabajo;
	}
	public String getRutaCuestionario() {
		return rutaCuestionario;
	}
	public void setRutaCuestionario(String rutaCuestionario) {
		this.rutaCuestionario = rutaCuestionario;
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
	/**
	 * @return the fin
	 */
	public Date getFin() {
		return fin;
	}
	/**
	 * @param fin the fin to set
	 */
	public void setFin(Date fin) {
		this.fin = fin;
	}

}
