package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aoa.dao.BitacoraDao;
import com.aoa.models.Bitacora;
import com.aoa.models.Citas;


@Service
public class BitacoraServiceImp implements BitacoraService {
	
	private BitacoraDao bitacoraDao;
	
	public void setBitacoraDao(BitacoraDao bitacoraDao){
		this.bitacoraDao = bitacoraDao;
	}
	
	@Transactional	
	@Override
	public void create(Bitacora b) {
		this.bitacoraDao.create(b);
		
	}
	
	
	

}
