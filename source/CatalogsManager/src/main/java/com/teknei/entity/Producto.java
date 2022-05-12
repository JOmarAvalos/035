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
@Table(name="tbl_productos")
public class Producto extends BaseEntity<Integer> {
	
	private static final long serialVersionUID = 5981177210512620527L;
	
	private Integer idCuestionario;
	private BigInteger precio;
	private Integer empleadosRangoInicial;
	private Integer empleadosRangoFinal;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	private Integer banActivo;
	
	
	@Id
	@GeneratedValue(strategy= IDENTITY)
	@Column(name="cve_producto",unique=true, nullable=false )
	public Integer getId() {
		return super.getId();
	}

	@Column(name = "id_cuestionario", nullable = false)
	public Integer getIdCuestionario() {
		return idCuestionario;
	}
	public void setIdCuestionario(Integer idCuestionario) {
		this.idCuestionario = idCuestionario;
	}

	@Column(name = "precio")
	public BigInteger getPrecio() {
		return precio;
	}
	public void setPrecio(BigInteger precio) {
		this.precio = precio;
	}

	@Column(name = "empleados_rango_inicial")
	public Integer getEmpleadosRangoInicial() {
		return empleadosRangoInicial;
	}
	public void setEmpleadosRangoInicial(Integer empleadosRangoInicial) {
		this.empleadosRangoInicial = empleadosRangoInicial;
	}

	@Column(name = "empleados_rango_final")
	public Integer getEmpleadosRangoFinal() {
		return empleadosRangoFinal;
	}
	public void setEmpleadosRangoFinal(Integer empleadosRangoFinal) {
		this.empleadosRangoFinal = empleadosRangoFinal;
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