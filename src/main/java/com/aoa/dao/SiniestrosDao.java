package com.aoa.dao;

import java.util.List;

import com.aoa.models.Siniestros;

public interface SiniestrosDao {
	public List<Siniestros> listsiniestros();
	public Siniestros begin_service(String placa, String declarante_celular);
}
