package com.teknei.entity;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import static javax.persistence.GenerationType.IDENTITY;

import com.teknei.base.entity.BaseEntity;

@Entity
@Table(name="tbl_actividades")
public class Actividad extends BaseEntity<Integer> {


	private static final long serialVersionUID = 5981177210512620507L;

	
	private Integer idCentroTrabajo;
	private Integer idProducto;
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
	
	
	@Id
	@GeneratedValue(strategy= IDENTITY)
	@Column(name="cve_actividad",unique=true, nullable=false )
	public Integer getId() {
		return super.getId();
	}

	@Column(name = "id_centro_trabajo", nullable = false)
	public Integer getIdCentroTrabajo() {
		return idCentroTrabajo;
	}
	public void setIdCentroTrabajo(Integer idCentroTrabajo) {
		this.idCentroTrabajo = idCentroTrabajo;
	}

	@Column(name = "id_producto", nullable = false)
	public Integer getIdProducto() {
		return idProducto;
	}
	public void setIdProducto(Integer idProducto) {
		this.idProducto = idProducto;
	}

	@Column(name = "codigo")
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	@Column(name = "ruta_cuestionario")
	public String getRutaCuestionario() {
		return rutaCuestionario;
	}
	public void setRutaCuestionario(String rutaCuestionario) {
		this.rutaCuestionario = rutaCuestionario;
	}

	@Column(name = "ruta_respuesta")
	public String getRutaRespuesta() {
		return rutaRespuesta;
	}
	public void setRutaRespuesta(String rutaRespuesta) {
		this.rutaRespuesta = rutaRespuesta;
	}

	@Column(name = "numero_referencia_pago")
	public String getNumeroReferenciaPago() {
		return numeroReferenciaPago;
	}
	public void setNumeroReferenciaPago(String numeroReferenciaPago) {
		this.numeroReferenciaPago = numeroReferenciaPago;
	}

	@Column(name = "costo")
	public BigInteger getCosto() {
		return costo;
	}
	public void setCosto(BigInteger costo) {
		this.costo = costo;
	}

	@Column(name = "iva")
	public BigInteger getIva() {
		return iva;
	}
	public void setIva(BigInteger iva) {
		this.iva = iva;
	}

	@Column(name = "total")
	public BigInteger getTotal() {
		return total;
	}
	public void setTotal(BigInteger total) {
		this.total = total;
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

	@Column(name = "id_actividad_estatus", nullable = false)
	public Integer getIdActividadEstatus() {
		return idActividadEstatus;
	}
	public void setIdActividadEstatus(Integer idActividadEstatus) {
		this.idActividadEstatus = idActividadEstatus;
	}

}
