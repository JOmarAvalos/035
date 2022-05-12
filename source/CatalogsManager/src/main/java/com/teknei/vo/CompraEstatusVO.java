package com.teknei.vo;

import java.io.Serializable;
import java.util.Date;
import java.math.BigInteger;


public class CompraEstatusVO extends BaseVO implements Serializable {

	
	private static final long serialVersionUID = -3617796304012330645L;
	
	
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