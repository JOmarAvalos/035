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
@Table(name="mdl_actividad")
public class Actividad extends BaseEntity<Integer> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5981177210512620507L;

	
	private Integer idCurso;
	private Integer idTipoActividad;
	private String nombre;
	private String descripcion;
	private Integer orden;
	private Integer banActivo;
	private Integer idUsuarioCrea;
	private Integer idUsuarioModifica;
	private Date creacion;
	private Date modificacion;
	private String ruta;
	private String url;
	private Integer tiempoEstimado;
	private Integer numeroOportunidades;
	private Integer preguntasMostrar;
	private Boolean preguntasAleatorias;
	private Boolean promedia;
	private Integer promediaPorcentaje;
	private Boolean calificacionMinima;
	private Integer calificacionMinimaPorcentaje;
	private String nombreEn;
	private String nombreFr;
	private String descripcionEn;
	private String descripcionFr;
	
	
	@Id
	@GeneratedValue(strategy= IDENTITY)
	@Column(name="cve_actividad",unique=true, nullable=false )
	public Integer getId() {
		return super.getId();
	}

	
	@Column(name = "id_curso", nullable = false)
	public Integer getIdCurso() {
		return idCurso;
	}
	public void setIdCurso(Integer idCurso) {
		this.idCurso = idCurso;
	}

	
	@Column(name = "id_tipo_actividad", nullable = false)
	public Integer getIdTipoActividad() {
		return idTipoActividad;
	}
	public void setIdTipoActividad(Integer idTipoActividad) {
		this.idTipoActividad = idTipoActividad;
	}

	
	@Column(name = "nombre", nullable = false)
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	
	@Column(name = "descripcion", nullable = false)
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	
	@Column(name = "orden", nullable = false)
	public Integer getOrden() {
		return orden;
	}
	public void setOrden(Integer orden) {
		this.orden = orden;
	}

	
	@Column(name = "ban_activo", nullable = false)
	public Integer getBanActivo() {
		return banActivo;
	}
	public void setBanActivo(Integer banActivo) {
		this.banActivo = banActivo;
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

	
	@Column(name = "ruta")
	public String getRuta() {
		return ruta;
	}
	public void setRuta(String ruta) {
		this.ruta = ruta;
	}

	
	@Column(name = "url")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	
	@Column(name = "tiempo_estimado")
	public Integer getTiempoEstimado() {
		return tiempoEstimado;
	}
	public void setTiempoEstimado(Integer tiempoEstimado) {
		this.tiempoEstimado = tiempoEstimado;
	}

	
	@Column(name = "numero_oportunidades")
	public Integer getNumeroOportunidades() {
		return numeroOportunidades;
	}
	public void setNumeroOportunidades(Integer numeroOportunidades) {
		this.numeroOportunidades = numeroOportunidades;
	}

	
	@Column(name = "preguntas_mostrar")
	public Integer getPreguntasMostrar() {
		return preguntasMostrar;
	}
	public void setPreguntasMostrar(Integer preguntasMostrar) {
		this.preguntasMostrar = preguntasMostrar;
	}

	@Column(name = "preguntas_aleatorias")
	public Boolean getPreguntasAleatorias() {
		return preguntasAleatorias;
	}
	public void setPreguntasAleatorias(Boolean preguntasAleatorias) {
		this.preguntasAleatorias = preguntasAleatorias;
	}

	@Column(name = "promedia")
	public Boolean getPromedia() {
		return promedia;
	}
	public void setPromedia(Boolean promedia) {
		this.promedia = promedia;
	}

	@Column(name = "promedia_porcentaje")
	public Integer getPromediaPorcentaje() {
		return promediaPorcentaje;
	}
	public void setPromediaPorcentaje(Integer promediaPorcentaje) {
		this.promediaPorcentaje = promediaPorcentaje;
	}

	@Column(name = "calificacion_minima")
	public Boolean getCalificacionMinima() {
		return calificacionMinima;
	}
	public void setCalificacionMinima(Boolean calificacionMinima) {
		this.calificacionMinima = calificacionMinima;
	}

	@Column(name = "calificacion_minima_porcentaje")
	public Integer getCalificacionMinimaPorcentaje() {
		return calificacionMinimaPorcentaje;
	}
	public void setCalificacionMinimaPorcentaje(Integer calificacionMinimaPorcentaje) {
		this.calificacionMinimaPorcentaje = calificacionMinimaPorcentaje;
	}

	@Column(name = "nombre_en")
	public String getNombreEn() {
		return nombreEn;
	}
	public void setNombreEn(String nombreEn) {
		this.nombreEn = nombreEn;
	}

	@Column(name = "nombre_fr")
	public String getNombreFr() {
		return nombreFr;
	}
	public void setNombreFr(String nombreFr) {
		this.nombreFr = nombreFr;
	}

	@Column(name = "descripcion_en")
	public String getDescripcionEn() {
		return descripcionEn;
	}
	public void setDescripcionEn(String descripcionEn) {
		this.descripcionEn = descripcionEn;
	}

	@Column(name = "descripcion_fr")
	public String getDescripcionFr() {
		return descripcionFr;
	}
	public void setDescripcionFr(String descripcionFr) {
		this.descripcionFr = descripcionFr;
	}

}
