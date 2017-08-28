package com.aoa.dao;

import java.util.List;

import com.aoa.models.Recepcion;



public interface RecepcionDao {
	public Recepcion getRecepcionById(int id);
	public void create(Recepcion r);
}
