package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aoa.dao.CitasDao;

import com.aoa.models.Citas;


@Service
public class CitasServiceImp implements CitasService {
	
	private CitasDao citasDao;
	
	public void setCitasDao(CitasDao citasDao){
		this.citasDao = citasDao;
	}
	
	

	@Transactional
	@Override
	public Citas cita_arribo(int siniestro) {
		return this.citasDao.cita_arribo(siniestro);		
		
	}
	
	@Transactional
	@Override
	public void update(Citas c) {
		// TODO Auto-generated method stub
		
	}
	
	
	

}
