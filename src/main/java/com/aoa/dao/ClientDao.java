package com.aoa.dao;

import java.util.List;

import com.aoa.models.Client;


public interface ClientDao {
	public void create(Client c);
	public void update(Client c);
	public Client getClientById(int id);
	public Client getClientBycode(String code);
}
