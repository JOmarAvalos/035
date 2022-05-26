package com.teknei.vo;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;


public class ProductoVO extends BaseVO implements Serializable {
	
	
	private static final long serialVersionUID = 4612531967742769099L;
	
	private Integer idCuestionario;
	private BigInteger precio;
	private Integer empleadosRangoInicial;
	private Integer empleadosRangoFinal;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	private Integer banActivo;
	private String nombre;
	private CuestionarioVO cuestionarioVO;
	
	
	public Integer getIdCuestionario() {
		return idCuestionario;
	}
	public void setIdCuestionario(Integer idCuestionario) {
		this.idCuestionario = idCuestionario;
	}
	
	public BigInteger getPrecio() {
		return precio;
	}
	public void setPrecio(BigInteger precio) {
		this.precio = precio;
	}
	
	public Integer getEmpleadosRangoInicial() {
		return empleadosRangoInicial;
	}
	public void setEmpleadosRangoInicial(Integer empleadosRangoInicial) {
		this.empleadosRangoInicial = empleadosRangoInicial;
	}
	
	public Integer getEmpleadosRangoFinal() {
		return empleadosRangoFinal;
	}
	public void setEmpleadosRangoFinal(Integer empleadosRangoFinal) {
		this.empleadosRangoFinal = empleadosRangoFinal;
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
	/**
	 * @return the nombre
	 */
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
	 * @return the cuestionarioVO
	 */
	public CuestionarioVO getCuestionarioVO() {
		return cuestionarioVO;
	}
	/**
	 * @param cuestionarioVO the cuestionarioVO to set
	 */
	public void setCuestionarioVO(CuestionarioVO cuestionarioVO) {
		this.cuestionarioVO = cuestionarioVO;
	}
	
}