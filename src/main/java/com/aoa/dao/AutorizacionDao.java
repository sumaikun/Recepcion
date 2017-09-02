package com.aoa.dao;

import java.util.List;

import com.aoa.models.Autorizacion;



public interface AutorizacionDao {


	public void create(Autorizacion a);
	public void update(Autorizacion a);
	public Autorizacion get_by_siniester(String siniestro);
}
