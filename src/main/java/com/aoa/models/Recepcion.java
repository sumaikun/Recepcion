package com.aoa.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="ingreso_recepcion")
public class Recepcion {
	@Id
	@Column(name="id")	
	private int id;
	private String nombre;
	private String apellido;
	private String identificacion;
	private String fecha;
	private int visitado;
	private String registrado_por;
	private String descripcion;
	private String foto_f;
	private int cita;
	private int siniestro;
	
	
	public int getCita() {
		return cita;
	}
	public void setCita(int cita) {
		this.cita = cita;
	}
	public int getSiniestro() {
		return siniestro;
	}
	public void setSiniestro(int siniestro) {
		this.siniestro = siniestro;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public int getVisitado() {
		return visitado;
	}
	public void setVisitado(int visitado) {
		this.visitado = visitado;
	}
	public String getRegistrado_por() {
		return registrado_por;
	}
	public void setRegistrado_por(String registrado_por) {
		this.registrado_por = registrado_por;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getFoto_f() {
		return foto_f;
	}
	public void setFoto_f(String foto_f) {
		this.foto_f = foto_f;
	}
	
	
}
