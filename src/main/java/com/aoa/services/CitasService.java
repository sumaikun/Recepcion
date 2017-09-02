package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aoa.models.Citas;
import com.aoa.models.Siniestros;
import com.aoa.models.User;

@Service
public interface CitasService {
	public Citas cita_arribo(int siniestro);
	void update(Citas c);
}
