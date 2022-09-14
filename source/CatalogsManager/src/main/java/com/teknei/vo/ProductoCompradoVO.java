package com.teknei.vo;

import java.io.Serializable;
import java.util.Date;
import java.math.BigInteger;


public class ProductoCompradoVO extends BaseVO implements Serializable {

	
	private static final long serialVersionUID = -3617796303912330645L;
	
	
	private Integer idCentroTrabajo;
	private Integer idProducto;
	private String codigo;
	private String rutaRespuesta;
	private String numeroReferenciaPago;
	private BigInteger costo;
	private BigInteger iva;
	private BigInteger total;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	private Integer idCompraEstatus;
	private String orderId;
	
	private ProductoVO productoVO;
	private UsuarioVO usuario;
	
	public Integer getIdCentroTrabajo() {
		return idCentroTrabajo;
	}
	public void setIdCentroTrabajo(Integer idCentroTrabajo) {
		this.idCentroTrabajo = idCentroTrabajo;
	}
	
	public Integer getIdProducto() {
		return idProducto;
	}
	public void setIdProducto(Integer idProducto) {
		this.idProducto = idProducto;
	}
	
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
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
	
	public Integer getIdCompraEstatus() {
		return idCompraEstatus;
	}
	public void setIdCompraEstatus(Integer idCompraEstatus) {
		this.idCompraEstatus = idCompraEstatus;
	}
	/**
	 * @return the orderId
	 */
	public String getOrderId() {
		return orderId;
	}
	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	/**
	 * @return the productoVO
	 */
	public ProductoVO getProductoVO() {
		return productoVO;
	}
	/**
	 * @param productoVO the productoVO to set
	 */
	public void setProductoVO(ProductoVO productoVO) {
		this.productoVO = productoVO;
	}
	/**
	 * @return the usuario
	 */
	public UsuarioVO getUsuario() {
		return usuario;
	}
	/**
	 * @param usuario the usuario to set
	 */
	public void setUsuario(UsuarioVO usuario) {
		this.usuario = usuario;
	}
	
}

