package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aoa.dao.CiudadDao;
import com.aoa.models.Ciudad;



@Service
public class CiudadServiceImp implements CiudadService {
	
	private CiudadDao ciudadDao;
	
	public void setCiudadDao(CiudadDao ciudadDao){
		this.ciudadDao =  ciudadDao;
	}

	@Transactional
	@Override
	public List<Ciudad> listciudades() {
		return this.ciudadDao.listciudades();
	}

	@Transactional
	@Override
	public List<Ciudad> listdepartamentos() {
		return this.ciudadDao.listdepartamentos();
	}
	
	
	


}
