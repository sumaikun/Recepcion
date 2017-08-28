package com.aoa.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="siniestro")
public class Siniestros {
	
	@Id
	@Column(name="id")	
	private int id;
	private String numero;
	private String placa;
	private String declarante_celular;
	private int estado;
	private int no_garantia;
	
	public int getNo_garantia() {
		return no_garantia;
	}
	
	public void setNo_garantia(int no_garantia) {
		this.no_garantia = no_garantia;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getPlaca() {
		return placa;
	}
	public void setPlaca(String placa) {
		this.placa = placa;
	}
	public String getDeclarante_celular() {
		return declarante_celular;
	}
	public void setDeclarante_celular(String declarante_celular) {
		this.declarante_celular = declarante_celular;
	}
	
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	
}
