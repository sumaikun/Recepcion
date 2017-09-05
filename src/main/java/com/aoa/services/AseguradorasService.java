package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aoa.models.Aseguradoras;



@Service
public interface AseguradorasService {
	public Aseguradoras getAseguradorasById(int id);
}
