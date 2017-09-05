package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aoa.dao.AseguradorasDao;
import com.aoa.models.Aseguradoras;


@Service
public class AseguradorasServiceImp implements AseguradorasService {
	
	private AseguradorasDao aseguradorasDao;
	
	public void setAseguradorasDao(AseguradorasDao aseguradorasDao){
		this.aseguradorasDao = aseguradorasDao;
	}

	@Transactional
	@Override
	public Aseguradoras getAseguradorasById(int id) {
		// TODO Auto-generated method stub
		return this.aseguradorasDao.getAseguradorasById(id);
	}
	

	
	
	

}
