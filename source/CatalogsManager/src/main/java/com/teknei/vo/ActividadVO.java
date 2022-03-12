package com.teknei.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ActividadVO  extends BaseVO implements Serializable{

	private static final long serialVersionUID = -3617796303912330545L;

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
	
	
	
	/**
	 * @return the idCurso
	 */
	public Integer getIdCurso() {
		return idCurso;
	}
	/**
	 * @param idCurso the idCurso to set
	 */
	public void setIdCurso(Integer idCurso) {
		this.idCurso = idCurso;
	}
	/**
	 * @return the idTipoActividad
	 */
	public Integer getIdTipoActividad() {
		return idTipoActividad;
	}
	/**
	 * @param idTipoActividad the idTipoActividad to set
	 */
	public void setIdTipoActividad(Integer idTipoActividad) {
		this.idTipoActividad = idTipoActividad;
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
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}
	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	/**
	 * @return the orden
	 */
	public Integer getOrden() {
		return orden;
	}
	/**
	 * @param orden the orden to set
	 */
	public void setOrden(Integer orden) {
		this.orden = orden;
	}
	/**
	 * @return the banActivo
	 */
	public Integer getBanActivo() {
		return banActivo;
	}
	/**
	 * @param banActivo the banActivo to set
	 */
	public void setBanActivo(Integer banActivo) {
		this.banActivo = banActivo;
	}
	/**
	 * @return the idUsuarioCrea
	 */
	public Integer getIdUsuarioCrea() {
		return idUsuarioCrea;
	}
	/**
	 * @param idUsuarioCrea the idUsuarioCrea to set
	 */
	public void setIdUsuarioCrea(Integer idUsuarioCrea) {
		this.idUsuarioCrea = idUsuarioCrea;
	}
	/**
	 * @return the idUsuarioModifica
	 */
	public Integer getIdUsuarioModifica() {
		return idUsuarioModifica;
	}
	/**
	 * @param idUsuarioModifica the idUsuarioModifica to set
	 */
	public void setIdUsuarioModifica(Integer idUsuarioModifica) {
		this.idUsuarioModifica = idUsuarioModifica;
	}
	/**
	 * @return the creacion
	 */
	public Date getCreacion() {
		return creacion;
	}
	/**
	 * @param creacion the creacion to set
	 */
	public void setCreacion(Date creacion) {
		this.creacion = creacion;
	}
	/**
	 * @return the modificacion
	 */
	public Date getModificacion() {
		return modificacion;
	}
	/**
	 * @param modificacion the modificacion to set
	 */
	public void setModificacion(Date modificacion) {
		this.modificacion = modificacion;
	}
	
	
	public String getRuta() {
		return ruta;
	}
	public void setRuta(String ruta) {
		this.ruta = ruta;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public Integer getTiempoEstimado() {
		return tiempoEstimado;
	}
	public void setTiempoEstimado(Integer tiempoEstimado) {
		this.tiempoEstimado = tiempoEstimado;
	}
	
	public Integer getNumeroOportunidades() {
		return numeroOportunidades;
	}
	public void setNumeroOportunidades(Integer numeroOportunidades) {
		this.numeroOportunidades = numeroOportunidades;
	}
	
	public Integer getPreguntasMostrar() {
		return preguntasMostrar;
	}
	public void setPreguntasMostrar(Integer preguntasMostrar) {
		this.preguntasMostrar = preguntasMostrar;
	}
	
	public Boolean getPreguntasAleatorias() {
		return preguntasAleatorias;
	}
	public void setPreguntasAleatorias(Boolean preguntasAleatorias) {
		this.preguntasAleatorias = preguntasAleatorias;
	}
	public Boolean getPromedia() {
		return promedia;
	}
	public void setPromedia(Boolean promedia) {
		this.promedia = promedia;
	}
	
	public Integer getPromediaPorcentaje() {
		return promediaPorcentaje;
	}
	public void setPromediaPorcentaje(Integer promediaPorcentaje) {
		this.promediaPorcentaje = promediaPorcentaje;
	}
	
	public Boolean getCalificacionMinima() {
		return calificacionMinima;
	}
	public void setCalificacionMinima(Boolean calificacionMinima) {
		this.calificacionMinima = calificacionMinima;
	}
	
	public Integer getCalificacionMinimaPorcentaje() {
		return calificacionMinimaPorcentaje;
	}
	public void setCalificacionMinimaPorcentaje(Integer calificacionMinimaPorcentaje) {
		this.calificacionMinimaPorcentaje = calificacionMinimaPorcentaje;
	}
	
	
	public String getNombreEn() {
		return nombreEn;
	}
	public void setNombreEn(String nombreEn) {
		this.nombreEn = nombreEn;
	}
	
	public String getNombreFr() {
		return nombreFr;
	}
	public void setNombreFr(String nombreFr) {
		this.nombreFr = nombreFr;
	}
	
	public String getDescripcionEn() {
		return descripcionEn;
	}
	public void setDescripcionEn(String descripcionEn) {
		this.descripcionEn = descripcionEn;
	}
	
	public String getDescripcionFr() {
		return descripcionFr;
	}
	public void setDescripcionFr(String descripcionFr) {
		this.descripcionFr = descripcionFr;
	}

}
