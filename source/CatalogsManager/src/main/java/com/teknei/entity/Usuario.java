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
	
	private String username;
	private String password;
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

	@Column(name = "usuario", nullable = false)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "contrasena", nullable = false)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "fch_modificacion")
	public Date getModificacion() {
		return modificacion;
	}

	public void setModificacion(Date modificacion) {
		this.modificacion = modificacion;
	}

	@Column(name = "fch_creacion")
	public Date getCreacion() {
		return creacion;
	}

	public void setCreacion(Date creacion) {
		this.creacion = creacion;
	}

	@Column(name="id_usuario_crea")
	public Integer getIdUsuarioCrea() {
		return idUsuarioCrea;
	}

	public void setIdUsuarioCrea(Integer idUsuarioCrea) {
		this.idUsuarioCrea = idUsuarioCrea;
	}

	@Column(name="id_usuario_modifica")
	public Integer getIdUsuarioModifica() {
		return idUsuarioModifica;
	}

	public void setIdUsuarioModifica(Integer idUsuarioModifica) {
		this.idUsuarioModifica = idUsuarioModifica;
	}

	/**
	 * @return the nombre
	 */
	@Column(name = "nombre")
	public String getNombre() {
		return nombre;
	}

	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return the email
	 */
	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the idPerfil
	 */
	@Column(name = "id_perfil")
	public Integer getIdPerfil() {
		return idPerfil;
	}

	/**
	 * @param idPerfil the idPerfil to set
	 */
	public void setIdPerfil(Integer idPerfil) {
		this.idPerfil = idPerfil;
	}

	/**
	 * @return the estatus
	 */
	@Column(name = "estatus")
	public Integer getEstatus() {
		return estatus;
	}

	/**
	 * @param estatus the estatus to set
	 */
	public void setEstatus(Integer estatus) {
		this.estatus = estatus;
	}

	/**
	 * @return the banActivo
	 */
	@Column(name = "ban_activo")
	public Integer getBanActivo() {
		return banActivo;
	}

	/**
	 * @param banActivo the banActivo to set
	 */
	public void setBanActivo(Integer banActivo) {
		this.banActivo = banActivo;
	}

}

