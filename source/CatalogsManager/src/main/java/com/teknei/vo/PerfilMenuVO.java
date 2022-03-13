package com.teknei.vo;

import java.io.Serializable;
import java.util.Date;

public class PerfilMenuVO extends BaseVO implements Serializable {
	

	private static final long serialVersionUID = 4612531967742768866L;
	
	
	private Integer idPerfil;
	private Integer idMenu;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	
	
	public Integer getIdPerfil() {
		return idPerfil;
	}
	public void setIdPerfil(Integer idPerfil) {
		this.idPerfil = idPerfil;
	}
	
	public Integer getIdMenu() {
		return idMenu;
	}
	public void setIdMenu(Integer idMenu) {
		this.idMenu = idMenu;
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
	
}
