package com.teknei.vo;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;


public class ActividadVO extends BaseVO implements Serializable {

	
	private static final long serialVersionUID = -3617796303912330545L;


	private Integer idCentroTrabajo;
	private Integer idCuestionario;
	private String codigo;
	private String rutaCuestionario;
	private String rutaRespuesta;
	private String numeroReferenciaPago;
	private BigInteger costo;
	private BigInteger iva;
	private BigInteger total;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	private Integer idActividadEstatus;
	
	
	public Integer getIdCentroTrabajo() {
		return idCentroTrabajo;
	}
	public void setIdCentroTrabajo(Integer idCentroTrabajo) {
		this.idCentroTrabajo = idCentroTrabajo;
	}
	
	public Integer getIdCuestionario() {
		return idCuestionario;
	}
	public void setIdCuestionario(Integer idCuestionario) {
		this.idCuestionario = idCuestionario;
	}
	
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	public String getRutaCuestionario() {
		return rutaCuestionario;
	}
	public void setRutaCuestionario(String rutaCuestionario) {
		this.rutaCuestionario = rutaCuestionario;
	}
	
	public String getRutaRespuesta() {
		return rutaRespuesta;
	}
	public void setRutaRespuesta(String rutaRespuesta) {
		this.rutaRespuesta = rutaRespuesta;
	}
	
	public String getNumeroReferenciaPago() {
		return numeroReferenciaPago;
	}
	public void setNumeroReferenciaPago(String numeroReferenciaPago) {
		this.numeroReferenciaPago = numeroReferenciaPago;
	}
	
	public BigInteger getCosto() {
		return costo;
	}
	public void setCosto(BigInteger costo) {
		this.costo = costo;
	}
	
	public BigInteger getIva() {
		return iva;
	}
	public void setIva(BigInteger iva) {
		this.iva = iva;
	}
	
	public BigInteger getTotal() {
		return total;
	}
	public void setTotal(BigInteger total) {
		this.total = total;
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
	
	public Integer getIdActividadEstatus() {
		return idActividadEstatus;
	}
	public void setIdActividadEstatus(Integer idActividadEstatus) {
		this.idActividadEstatus = idActividadEstatus;
	}

}
