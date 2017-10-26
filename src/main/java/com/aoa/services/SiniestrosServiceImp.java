package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aoa.dao.SiniestrosDao;
import com.aoa.models.Siniestros;


@Service
public class SiniestrosServiceImp implements SiniestrosService {
	
	private SiniestrosDao siniestrosDao;
	
	public void setSiniestrosDao(SiniestrosDao siniestrosDao){
		this.siniestrosDao = siniestrosDao;
	}
	
	@Transactional
	@Override
	public List<Siniestros> listsiniestros() {
		return this.siniestrosDao.listsiniestros();
	}

	@Transactional
	@Override
	public Siniestros begin_service(String placa, String declarante_celular) {
		System.out.println("entre al servicio");
		return this.siniestrosDao.begin_service(placa, declarante_celular);
	}

	@Transactional
	@Override
	public Siniestros getSiniestroByid(int id) {
		return this.siniestrosDao.getSiniestroByid(id);
	}

}
