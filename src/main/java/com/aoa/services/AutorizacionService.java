package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aoa.models.Autorizacion;


@Service
public interface AutorizacionService {
	public void create(Autorizacion a);
}
