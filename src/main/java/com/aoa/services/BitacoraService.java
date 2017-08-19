package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aoa.models.Bitacora;


@Service
public interface BitacoraService {
	public void create(Bitacora b);
}
