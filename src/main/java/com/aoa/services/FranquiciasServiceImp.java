package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aoa.dao.AseguradorasDao;
import com.aoa.dao.FranquiciasDaoImp;
import com.aoa.models.Aseguradoras;
import com.aoa.models.Franquicia;


@Service
public class FranquiciasServiceImp {
	
	private FranquiciasDaoImp franquiciasDao;
	
	public void setFranquiciasDao(FranquiciasDaoImp franquiciasDao){
		this.franquiciasDao = franquiciasDao;
	}

	@Transactional
	public List<Franquicia> get_franquicias(int oficina, String aseguradora) {
		return this.franquiciasDao.get_franquicias(oficina, aseguradora);
	}
	
	

}
