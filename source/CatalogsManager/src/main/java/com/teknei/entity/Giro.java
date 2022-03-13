package com.teknei.entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.teknei.base.entity.BaseEntity;

@Entity
@Table(name = "tbl_cata_giros")
public class Giro extends BaseEntity<Integer> {

	
	private static final long serialVersionUID = 8440760761901325989L;
	
	
	private String nombre;
	private Integer banActivo;
	
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "cve_giro", unique = true, nullable = false)
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
	
	@Column(name = "ban_activo")
	public Integer getBanActivo() {
		return banActivo;
	}
	public void setBanActivo(Integer banActivo) {
		this.banActivo = banActivo;
	}
	
}
