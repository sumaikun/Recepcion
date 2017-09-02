package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aoa.dao.AutorizacionDao;
import com.aoa.models.Autorizacion;



@Service
public class AutorizacionServiceImp implements AutorizacionService {
	
	private AutorizacionDao autorizacionDao;
	
	public void setAutorizacionDao(AutorizacionDao autorizacionDao){
		this.autorizacionDao = autorizacionDao;
	}
	
	@Transactional
	@Override
	public void create(Autorizacion a) {	
		this.autorizacionDao.create(a);
	}

	@Transactional
	@Override
	public Autorizacion get_by_siniester(String siniestro) {
		// TODO Auto-generated method stub
		return this.autorizacionDao.get_by_siniester(siniestro);
	}

	@Transactional
	@Override
	public void update(Autorizacion a) {
		this.autorizacionDao.update(a);		
	}
	

	
	
	

}
