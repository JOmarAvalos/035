package com.teknei.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class UsuarioVO extends BaseVO implements Serializable {	
/**
	 * 
	 */
	private static final long serialVersionUID = 3091293943377530518L;
	
//	private Integer id;
	private String username;
	private String password;
	private Integer idEstatus;
	private Date modificacion;
	private Date creacion;
	private Integer idEmpresa;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private String usuarioCorp;
	private List<String> lstAutoridades;
	public UsuarioVO() {
	}


	public UsuarioVO(Integer id, String username, String password, Integer idEstatus,Date modificacion, Date creacion,Integer idEmpresa,
			Integer idUsuarioCrea, Integer idUsuarioModifica)
	{
		super.setId(id);
		this.username=username;
		this.password=password;
		this.idEstatus=idEstatus;
		this.modificacion=modificacion;
		this.creacion=creacion;
		this.idEmpresa=idEmpresa;
		this.idUsuarioCrea=idUsuarioCrea;
		this.idUsuarioModifica=idUsuarioModifica;
	}


	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getIdEstatus() {
		return idEstatus;
	}
	public void setIdEstatus(Integer idEstatus) {
		this.idEstatus = idEstatus;
	}
	public Date getModificacion() {
		return modificacion;
	}
	public void setModificacion(Date modificacion) {
		this.modificacion = modificacion;
	}
	public Date getCreacion() {
		return creacion;
	}
	public void setCreacion(Date creacion) {
		this.creacion = creacion;
	}

	public Integer getIdEmpresa() {
		return idEmpresa;
	}


	public void setIdEmpresa(Integer idEmpresa) {
		this.idEmpresa = idEmpresa;
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
	
	/**
	 * @return the usuarioCorp
	 */
	public String getUsuarioCorp() {
		return usuarioCorp;
	}


	/**
	 * @param usuarioCorp the usuarioCorp to set
	 */
	public void setUsuarioCorp(String usuarioCorp) {
		this.usuarioCorp = usuarioCorp;
	}


	public List<String> getLstAutoridades() {
		return lstAutoridades;
	}
	public void setLstAutoridades(List<String> lstAutoridades) {
		this.lstAutoridades = lstAutoridades;
	}

}
