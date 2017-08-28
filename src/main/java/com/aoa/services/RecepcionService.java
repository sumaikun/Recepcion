package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;


import com.aoa.models.Recepcion;



@Service
public interface RecepcionService {

	public Recepcion getRecepcionById(int id);
	public void create(Recepcion r);
}
