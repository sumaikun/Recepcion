package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;


import com.aoa.models.Recepcion;



@Service
public interface RecepcionService {
	public Recepcion getRecepcionById(int id);
	public Recepcion get_by_code(String code, int cita);
	public void create(Recepcion r);
	public void update(Recepcion r);
}
