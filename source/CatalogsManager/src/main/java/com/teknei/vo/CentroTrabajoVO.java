package com.teknei.vo;

import java.io.Serializable;
import java.util.Date;

public class CentroTrabajoVO extends BaseVO implements Serializable {

	
	private static final long serialVersionUID = 4612531967742768966L;
	
	
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
	
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public Integer getEmpleadoNumero() {
		return empleadoNumero;
	}
	public void setEmpleadoNumero(Integer empleadoNumero) {
		this.empleadoNumero = empleadoNumero;
	}
	
	public Integer getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}
	
	public Integer getIdGiro() {
		return idGiro;
	}
	public void setIdGiro(Integer idGiro) {
		this.idGiro = idGiro;
	}
	
	public Integer getIdEstadoRepublica() {
		return idEstadoRepublica;
	}
	public void setIdEstadoRepublica(Integer idEstadoRepublica) {
		this.idEstadoRepublica = idEstadoRepublica;
	}
	
	public String getFacNombre() {
		return facNombre;
	}
	public void setFacNombre(String facNombre) {
		this.facNombre = facNombre;
	}
	
	public String getFacRfc() {
		return facRfc;
	}
	public void setFacRfc(String facRfc) {
		this.facRfc = facRfc;
	}
	
	public String getFacPais() {
		return facPais;
	}
	public void setFacPais(String facPais) {
		this.facPais = facPais;
	}
	
	public String getFacEstado() {
		return facEstado;
	}
	public void setFacEstado(String facEstado) {
		this.facEstado = facEstado;
	}
	
	public String getFacMunicipio() {
		return facMunicipio;
	}
	public void setFacMunicipio(String facMunicipio) {
		this.facMunicipio = facMunicipio;
	}
	
	public String getFacColonia() {
		return facColonia;
	}
	public void setFacColonia(String facColonia) {
		this.facColonia = facColonia;
	}
	
	public String getFacCalle() {
		return facCalle;
	}
	public void setFacCalle(String facCalle) {
		this.facCalle = facCalle;
	}
	
	public String getFacNumeroExterior() {
		return facNumeroExterior;
	}
	public void setFacNumeroExterior(String facNumeroExterior) {
		this.facNumeroExterior = facNumeroExterior;
	}
	
	public String getFacNumeroInterior() {
		return facNumeroInterior;
	}
	public void setFacNumeroInterior(String facNumeroInterior) {
		this.facNumeroInterior = facNumeroInterior;
	}
	
	public String getFacCp() {
		return facCp;
	}
	public void setFacCp(String facCp) {
		this.facCp = facCp;
	}
	
	public String getFacTelefono() {
		return facTelefono;
	}
	public void setFacTelefono(String facTelefono) {
		this.facTelefono = facTelefono;
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
	
	public Integer getBanActivo() {
		return banActivo;
	}
	public void setBanActivo(Integer banActivo) {
		this.banActivo = banActivo;
	}
	
}
