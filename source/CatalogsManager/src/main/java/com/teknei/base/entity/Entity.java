package com.teknei.base.entity;

import java.io.Serializable;

public interface Entity<K extends Serializable> extends Serializable {
	
	public K getId();
	
	public void setId(K id);
}