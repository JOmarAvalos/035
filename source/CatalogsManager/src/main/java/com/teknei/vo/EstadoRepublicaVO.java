package com.teknei.vo;

import java.io.Serializable;

public class EstadoRepublicaVO extends BaseVO implements Serializable {

	
	private static final long serialVersionUID = 4612531967742768766L;
	
	
	private String nombre;
	private Integer banActivo;
	
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public Integer getBanActivo() {
		return banActivo;
	}
	public void setBanActivo(Integer banActivo) {
		this.banActivo = banActivo;
	}
	
}
