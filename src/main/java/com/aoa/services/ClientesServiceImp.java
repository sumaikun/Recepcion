package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aoa.dao.ClientDao;
import com.aoa.dao.SiniestrosDao;
import com.aoa.models.Client;
import com.aoa.models.Siniestros;


@Service
public class ClientesServiceImp implements ClientesService {
	
	private ClientDao clientDao;
	
	public void setClientDao(ClientDao clientDao){
		this.clientDao = clientDao;
	}
	@Transactional
	@Override
	public void create(Client c) {
		this.clientDao.create(c);
	}
	
	@Transactional
	@Override
	public Client getClientById(int id) {
		// TODO Auto-generated method stub
		return this.clientDao.getClientById(id);
	}
	
	@Transactional
	@Override
	public Client getClientBycode(String code) {
		// TODO Auto-generated method stub
		System.out.println("llegue al servicio");
		return this.clientDao.getClientBycode(code);
	}
	@Override
	public void update(Client c) {
		this.clientDao.update(c);		
	}
	

	
	

}
