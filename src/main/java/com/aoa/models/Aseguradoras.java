package com.aoa.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="aseguradora")
public class Aseguradoras{
	
	@Id
	@Column(name="id")	
	private int id;
	String garantia;
	String garantia_consignada;
	String valor_no_reembols;
	int pide_autorizacion;
	String nombre;
	String nit;
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getNit() {
		return nit;
	}
	public void setNit(String nit) {
		this.nit = nit;
	}	
	
	public String getGarantia_consignada() {
		return garantia_consignada;
	}
	public void setGarantia_consignada(String garantia_consignada) {
		this.garantia_consignada = garantia_consignada;
	}
	public String getValor_no_reembols() {
		return valor_no_reembols;
	}
	public void setValor_no_reembols(String valor_no_reembols) {
		this.valor_no_reembols = valor_no_reembols;
	}
	public int getPide_autorizacion() {
		return pide_autorizacion;
	}
	public void setPide_autorizacion(int pide_autorizacion) {
		this.pide_autorizacion = pide_autorizacion;
	}	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGarantia() {
		return garantia;
	}
	public void setGarantia(String garantia) {
		this.garantia = garantia;
	}
		
}
