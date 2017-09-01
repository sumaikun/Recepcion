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
	

	
	
	

}
