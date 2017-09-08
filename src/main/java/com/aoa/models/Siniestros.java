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
	private int aseguradora;
	private String img_cedula_f;
	private String img_pase_f;
	private String Adicional1_f;
	private String Adicional2_f;
	
	public String getImg_cedula_f() {
		return img_cedula_f;
	}

	public void setImg_cedula_f(String img_cedula_f) {
		this.img_cedula_f = img_cedula_f;
	}

	public String getImg_pase_f() {
		return img_pase_f;
	}

	public void setImg_pase_f(String img_pase_f) {
		this.img_pase_f = img_pase_f;
	}

	public String getAdicional1_f() {
		return Adicional1_f;
	}

	public void setAdicional1_f(String adicional1_f) {
		Adicional1_f = adicional1_f;
	}

	public String getAdicional2_f() {
		return Adicional2_f;
	}

	public void setAdicional2_f(String adicional2_f) {
		Adicional2_f = adicional2_f;
	}	

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
	
	public int getAseguradora() {
		return aseguradora;
	}

	public void setAseguradora(int aseguradora) {
		this.aseguradora = aseguradora;
	}
	
}
