package com.aoa.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="ciudad_franq")
public class Ciudadfranq {
	@Id
	@Column(name="id")	
	private int id;	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFranquicia() {
		return franquicia;
	}
	public void setFranquicia(int franquicia) {
		this.franquicia = franquicia;
	}
	public int getOficina() {
		return oficina;
	}
	public void setOficina(int oficina) {
		this.oficina = oficina;
	}
	public String getAseguradora() {
		return aseguradora;
	}
	public void setAseguradora(String aseguradora) {
		this.aseguradora = aseguradora;
	}
	private int franquicia;
	private int oficina;
	private String aseguradora;
	
}
