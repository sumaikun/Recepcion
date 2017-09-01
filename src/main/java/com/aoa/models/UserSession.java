package com.aoa.models;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("session")
public class UserSession {
	private String id_siniestro;

	public String getId_siniestro() {
		return id_siniestro;
	}

	public void setId_siniestro(String id_siniestro) {
		this.id_siniestro = id_siniestro;
	}
}
