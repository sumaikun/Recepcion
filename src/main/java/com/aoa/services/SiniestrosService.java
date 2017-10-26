package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aoa.models.Siniestros;
import com.aoa.models.User;

@Service
public interface SiniestrosService {

	public List<Siniestros> listsiniestros();
	public Siniestros begin_service(String placa, String declarante_celular);
	public Siniestros getSiniestroByid(int id);
	
}
