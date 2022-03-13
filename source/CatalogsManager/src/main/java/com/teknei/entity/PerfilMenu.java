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
@Table(name="tbl_perfil_menu")
public class PerfilMenu extends BaseEntity<Integer> {

	
	private static final long serialVersionUID = 5981177210512620607L;
	
	
	private Integer idPerfil;
	private Integer idMenu;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	
	
	@Id
	@GeneratedValue(strategy= IDENTITY)
	@Column(name="cve_perfil_menu",unique=true, nullable=false )
	public Integer getId() {
		return super.getId();
	}

	@Column(name = "id_perfil", nullable = false)
	public Integer getIdPerfil() {
		return idPerfil;
	}
	public void setIdPerfil(Integer idPerfil) {
		this.idPerfil = idPerfil;
	}

	@Column(name = "id_menu", nullable = false)
	public Integer getIdMenu() {
		return idMenu;
	}
	public void setIdMenu(Integer idMenu) {
		this.idMenu = idMenu;
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
	
}
