package com.teknei.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import static javax.persistence.GenerationType.IDENTITY;

import com.teknei.base.entity.BaseEntity;

@Entity
@Table(name="tbl_cuestionarios")
public class Cuestionario extends BaseEntity<Integer> {

	
	private static final long serialVersionUID = 5981177210512620807L;
	
	
	private String nombre;
	private String titulo;
	private String descripcion;
	private Integer empleadosRangoInicial;
	private Integer empleadosRangoFinal;
	private Integer orden;
	private Integer diasLimiteActividad;
	private BigDecimal costo;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	private Integer banActivo;
	
	
	@Id
	@GeneratedValue(strategy= IDENTITY)
	@Column(name="cve_cuestionario",unique=true, nullable=false )
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
	
	@Column(name = "titulo")
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	@Column(name = "descripcion")
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
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
	
	@Column(name = "orden")
	public Integer getOrden() {
		return orden;
	}
	public void setOrden(Integer orden) {
		this.orden = orden;
	}
	
	@Column(name = "dias_limite_actividad")
	public Integer getDiasLimiteActividad() {
		return diasLimiteActividad;
	}
	public void setDiasLimiteActividad(Integer diasLimiteActividad) {
		this.diasLimiteActividad = diasLimiteActividad;
	}
	
	@Column(name = "costo")
	public BigDecimal getCosto() {
		return costo;
	}
	public void setCosto(BigDecimal costo) {
		this.costo = costo;
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
