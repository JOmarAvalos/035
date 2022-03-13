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
@Table(name="tbl_centros_trabajo")
public class CentroTrabajo extends BaseEntity<Integer> {

	
	private static final long serialVersionUID = 5981177210512620707L;
	
	
	private String nombre;
	private Integer empleadoNumero;
	private Integer idUsuario;
	private Integer idGiro;
	private Integer idEstadoRepublica;
	private String facNombre;
	private String facRfc;
	private String facPais;
	private String facEstado;
	private String facMunicipio;
	private String facColonia;
	private String facCalle;
	private String facNumeroExterior;
	private String facNumeroInterior;
	private String facCp;
	private String facTelefono;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	private Integer banActivo;
	
	
	@Id
	@GeneratedValue(strategy= IDENTITY)
	@Column(name="cve_centro_trabajo",unique=true, nullable=false )
	public Integer getId() {
		return super.getId();
	}

	@Column(name = "nombre")
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "empleados_numero")
	public Integer getEmpleadoNumero() {
		return empleadoNumero;
	}
	public void setEmpleadoNumero(Integer empleadoNumero) {
		this.empleadoNumero = empleadoNumero;
	}

	@Column(name = "id_usuario", nullable = false)
	public Integer getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	@Column(name = "id_giro", nullable = false)
	public Integer getIdGiro() {
		return idGiro;
	}
	public void setIdGiro(Integer idGiro) {
		this.idGiro = idGiro;
	}

	@Column(name = "id_estado_republica", nullable = false)
	public Integer getIdEstadoRepublica() {
		return idEstadoRepublica;
	}
	public void setIdEstadoRepublica(Integer idEstadoRepublica) {
		this.idEstadoRepublica = idEstadoRepublica;
	}

	@Column(name = "fac_nombre")
	public String getFacNombre() {
		return facNombre;
	}
	public void setFacNombre(String facNombre) {
		this.facNombre = facNombre;
	}

	@Column(name = "fac_rfc")
	public String getFacRfc() {
		return facRfc;
	}
	public void setFacRfc(String facRfc) {
		this.facRfc = facRfc;
	}

	@Column(name = "fac_pais")
	public String getFacPais() {
		return facPais;
	}
	public void setFacPais(String facPais) {
		this.facPais = facPais;
	}

	@Column(name = "fac_estado")
	public String getFacEstado() {
		return facEstado;
	}
	public void setFacEstado(String facEstado) {
		this.facEstado = facEstado;
	}

	@Column(name = "fac_municipio")
	public String getFacMunicipio() {
		return facMunicipio;
	}
	public void setFacMunicipio(String facMunicipio) {
		this.facMunicipio = facMunicipio;
	}

	@Column(name = "fac_colonia")
	public String getFacColonia() {
		return facColonia;
	}
	public void setFacColonia(String facColonia) {
		this.facColonia = facColonia;
	}

	@Column(name = "fac_calle")
	public String getFacCalle() {
		return facCalle;
	}
	public void setFacCalle(String facCalle) {
		this.facCalle = facCalle;
	}

	@Column(name = "fac_numero_exterior")
	public String getFacNumeroExterior() {
		return facNumeroExterior;
	}
	public void setFacNumeroExterior(String facNumeroExterior) {
		this.facNumeroExterior = facNumeroExterior;
	}

	@Column(name = "fac_numero_interior")
	public String getFacNumeroInterior() {
		return facNumeroInterior;
	}
	public void setFacNumeroInterior(String facNumeroInterior) {
		this.facNumeroInterior = facNumeroInterior;
	}

	@Column(name = "fac_cp")
	public String getFacCp() {
		return facCp;
	}
	public void setFacCp(String facCp) {
		this.facCp = facCp;
	}

	@Column(name = "fac_telefono")
	public String getFacTelefono() {
		return facTelefono;
	}
	public void setFacTelefono(String facTelefono) {
		this.facTelefono = facTelefono;
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
