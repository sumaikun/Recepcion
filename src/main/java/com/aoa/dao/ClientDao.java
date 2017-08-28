package com.aoa.dao;

import java.util.List;

import com.aoa.models.Client;


public interface ClientDao {
	public void create(Client c);
	public Client getClientById(int id);
	public String getClientBycode(String code);
}
