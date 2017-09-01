package com.aoa.dao;

import java.util.List;

import com.aoa.models.Ciudad;


public interface CiudadDao {
	public List<Ciudad> listciudades(String departamento);
	public List<Ciudad> listdepartamentos();
	public  Ciudad  get_by_code(String  ciudad);
}
