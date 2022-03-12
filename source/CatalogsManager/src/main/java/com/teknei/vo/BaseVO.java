package com.teknei.vo;

import com.teknei.util.StringEncrypt;

public class BaseVO {
	private Integer id;
	private String idCrypt;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
		try {
			idCrypt = StringEncrypt.encrypt(StringEncrypt.KEY, StringEncrypt.IV, id+"");
		} catch (Exception e) {
			
		}
	}
	public String getIdCrypt() {
		return idCrypt;
	}
//	public void setIdCrypt(String idCrypt) {
//		this.idCrypt = idCrypt;
//	}

}
