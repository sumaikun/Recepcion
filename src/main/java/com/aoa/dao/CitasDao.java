package com.aoa.dao;

import java.util.List;

import com.aoa.models.Citas;

public interface CitasDao {
	public int cita_arribo(int siniestro);

	void update(Citas c);
}
