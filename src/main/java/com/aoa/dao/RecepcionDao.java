package com.aoa.dao;

import java.util.List;

import com.aoa.models.Recepcion;



public interface RecepcionDao {
	public Recepcion getRecepcionById(int id);
	public Recepcion get_by_code(String code, int cita);
	public void create(Recepcion r);
	public void update(Recepcion r);
}
