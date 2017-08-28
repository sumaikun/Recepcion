package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aoa.dao.ClientDao;
import com.aoa.dao.RecepcionDao;
import com.aoa.dao.SiniestrosDao;
import com.aoa.models.Client;
import com.aoa.models.Recepcion;
import com.aoa.models.Siniestros;


@Service
public class RecepcionServiceImp implements RecepcionService {
	
	private RecepcionDao recepcionDao;
	
	public void setRecepcionDao(RecepcionDao recepcionDao){
		this.recepcionDao = recepcionDao;
	}
	
	@Transactional
	@Override
	public Recepcion getRecepcionById(int id) {
		Recepcion r = this.recepcionDao.getRecepcionById(id);
		return r;
	}

	@Override
	public void create(Recepcion r) {
		this.recepcionDao.create(r);
		
	}
	

	
	

}
