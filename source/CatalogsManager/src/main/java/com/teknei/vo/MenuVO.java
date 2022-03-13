package com.teknei.vo;

import java.io.Serializable;

public class MenuVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = 4612531967742768768L;
	
	
	private String nombre;
	private Integer orden;
	private Integer banActivo;
	
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public Integer getOrden() {
		return orden;
	}
	public void setOrden(Integer orden) {
		this.orden = orden;
	}
	
	public Integer getBanActivo() {
		return banActivo;
	}
	public void setBanActivo(Integer banActivo) {
		this.banActivo = banActivo;
	}
	
}
