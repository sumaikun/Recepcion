package com.aoa.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

@Entity
@Proxy(lazy = false)
@Table(name="cliente")
public class Client {
	@Id
	@Column(name="id")	
	private int id;	
	private String nombre;
	private String apellido;
	private String identificacion;
	private String tipo_id;
	private String lugar_expdoc;
	private String pais;
	private String ciudad;
	private String Barrio;	
	private String telefono_oficina;
	private String telefono_casa;
	private String celular;
	private String email_e;
	private String observaciones;
	private String direccion;
	private int auto_retencion;
	private String sexo;
	private String tipo_persona;
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getIdentificacion() {
		return identificacion;
	}
	public void setIdentificacion(String identificacion) {
		this.identificacion = identificacion;
	}
	public String getTipo_id() {
		return tipo_id;
	}
	public void setTipo_id(String tipo_id) {
		this.tipo_id = tipo_id;
	}
	public String getLugar_expdoc() {
		return lugar_expdoc;
	}
	public void setLugar_expdoc(String lugar_expdoc) {
		this.lugar_expdoc = lugar_expdoc;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	public String getTelefono_oficina() {
		return telefono_oficina;
	}
	public void setTelefono_oficina(String telefono_oficina) {
		this.telefono_oficina = telefono_oficina;
	}
	public String getTelefono_casa() {
		return telefono_casa;
	}
	public void setTelefono_casa(String telefono_casa) {
		this.telefono_casa = telefono_casa;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	public String getEmail_e() {
		return email_e;
	}
	public void setEmail_e(String email_e) {
		this.email_e = email_e;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public int getAuto_retencion() {
		return auto_retencion;
	}
	public void setAuto_retencion(int auto_retencion) {
		this.auto_retencion = auto_retencion;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getTipo_persona() {
		return tipo_persona;
	}
	public void setTipo_persona(String tipo_persona) {
		this.tipo_persona = tipo_persona;
	}	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getBarrio() {
		return Barrio;
	}
	public void setBarrio(String barrio) {
		Barrio = barrio;
	}
	
	
}
