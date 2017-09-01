package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aoa.models.Client;


@Service
public interface ClientesService {

	public void create(Client c);
	public void update(Client c);
	public Client getClientById(int id);
	public Client getClientBycode(String code);
}
