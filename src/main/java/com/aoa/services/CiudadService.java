package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aoa.models.Ciudad;
import com.aoa.models.Role;

@Service
public interface CiudadService {

	public List<Ciudad> listciudades(String departamento);
	public List<Ciudad> listdepartamentos();
	public Ciudad get_by_code(String  ciudad);
}
