package com.teknei.base.dao;

import java.io.Serializable;
import java.util.List;

import com.teknei.base.entity.Entity;

public interface BaseDAO<K extends Serializable, E extends Entity<K>> extends Serializable {
	
	public E save(E entity);
	
	public E merge(E entity);
	
	public E find(K id);
	
	public List<E> list();
	
	public E update(E entity);
	
	public void delete(K id);
}