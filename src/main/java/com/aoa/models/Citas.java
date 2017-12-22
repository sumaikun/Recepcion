package com.aoa.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="cita_servicio")
public class Citas {
	@Id
	@Column(name="id")	
	private int id;	

	private int siniestro;	
	private String arribo;
	private int oficina;
	private int dias_servicio;
	
	public int getOficina() {
		return oficina;
	}
	public void setOficina(int oficina) {
		this.oficina = oficina;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSiniestro() {
		return siniestro;
	}
	public void setName(int siniestro) {
		this.siniestro = siniestro;
	}
	public String getArribo() {
		return arribo;
	}
	public void setArribo(String arribo) {
		this.arribo = arribo;
	}
	
	public void setSiniestro(int siniestro) {
		this.siniestro = siniestro;
	}
	public int getDias_servicio() {
		return dias_servicio;
	}
	public void setDias_servicio(int dias_servicio) {
		this.dias_servicio = dias_servicio;
	}
	
}
