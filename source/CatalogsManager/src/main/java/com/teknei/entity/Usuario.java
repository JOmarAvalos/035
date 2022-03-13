package com.teknei.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.teknei.base.entity.BaseEntity;

@Entity
@Table(name = "tbl_usuarios")
public class Usuario extends BaseEntity<Integer> {
	private static final long serialVersionUID = 1799900731503938309L;
	
	private String usuario;
	private String contrasena;
	private String nombre;
	private String email;
	private Integer idPerfil;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	private Integer estatus;
	private Integer banActivo;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "cve_usuario", unique = true, nullable = false)
	public Integer getId() {
		return super.getId();
	}

	@Column(name = "usuario")
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	@Column(name = "contrasena")
	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	@Column(name = "nombre")
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "id_perfil", nullable = false)
	public Integer getIdPerfil() {
		return idPerfil;
	}
	public void setIdPerfil(Integer idPerfil) {
		this.idPerfil = idPerfil;
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

	@Column(name = "estatus")
	public Integer getEstatus() {
		return estatus;
	}
	public void setEstatus(Integer estatus) {
		this.estatus = estatus;
	}

	@Column(name = "ban_activo")
	public Integer getBanActivo() {
		return banActivo;
	}
	public void setBanActivo(Integer banActivo) {
		this.banActivo = banActivo;
	}

}
