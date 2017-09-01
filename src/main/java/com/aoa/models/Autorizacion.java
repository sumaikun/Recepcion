package com.aoa.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="sin_autor")
public class Autorizacion {
	@Id
	@Column(name="id")	
	private int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSiniestro() {
		return Siniestro;
	}
	public void setSiniestro(int siniestro) {
		Siniestro = siniestro;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getIdentificacion() {
		return identificacion;
	}
	public void setIdentificacion(String identificacion) {
		this.identificacion = identificacion;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public int getBanco() {
		return banco;
	}
	public void setBanco(int banco) {
		this.banco = banco;
	}
	public String getVencimiento_mes() {
		return vencimiento_mes;
	}
	public void setVencimiento_mes(String vencimiento_mes) {
		this.vencimiento_mes = vencimiento_mes;
	}
	public String getVencimiento_ano() {
		return vencimiento_ano;
	}
	public void setVencimiento_ano(String vencimiento_ano) {
		this.vencimiento_ano = vencimiento_ano;
	}
	public String getCodigo_seguridad() {
		return codigo_seguridad;
	}
	public void setCodigo_seguridad(String codigo_seguridad) {
		this.codigo_seguridad = codigo_seguridad;
	}
	public String getFecha_consignacion() {
		return fecha_consignacion;
	}
	public void setFecha_consignacion(String fecha_consignacion) {
		this.fecha_consignacion = fecha_consignacion;
	}
	public String getNumero_consignacion() {
		return numero_consignacion;
	}
	public void setNumero_consignacion(String numero_consignacion) {
		this.numero_consignacion = numero_consignacion;
	}
	public String getFranquicia() {
		return franquicia;
	}
	public void setFranquicia(String franquicia) {
		this.franquicia = franquicia;
	}
	public String getFecha_solicitud() {
		return fecha_solicitud;
	}
	public void setFecha_solicitud(String fecha_solicitud) {
		this.fecha_solicitud = fecha_solicitud;
	}
	public String getSolicitado_por() {
		return solicitado_por;
	}
	public void setSolicitado_por(String solicitado_por) {
		this.solicitado_por = solicitado_por;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDevol_cuenta_banco() {
		return devol_cuenta_banco;
	}
	public void setDevol_cuenta_banco(String devol_cuenta_banco) {
		this.devol_cuenta_banco = devol_cuenta_banco;
	}
	public String getDevol_tipo_cuenta() {
		return devol_tipo_cuenta;
	}
	public void setDevol_tipo_cuenta(String devol_tipo_cuenta) {
		this.devol_tipo_cuenta = devol_tipo_cuenta;
	}
	public String getDevol_banco() {
		return devol_banco;
	}
	public void setDevol_banco(String devol_banco) {
		this.devol_banco = devol_banco;
	}
	public String getDevol_ncuenta() {
		return devol_ncuenta;
	}
	public void setDevol_ncuenta(String devol_ncuenta) {
		this.devol_ncuenta = devol_ncuenta;
	}
	public String getIdentificacion_devol() {
		return identificacion_devol;
	}
	public void setIdentificacion_devol(String identificacion_devol) {
		this.identificacion_devol = identificacion_devol;
	}
	public String getFormulario_web() {
		return formulario_web;
	}
	public void setFormulario_web(String formulario_web) {
		this.formulario_web = formulario_web;
	}
	private int Siniestro;
	private String nombre;
	private String identificacion;
	private String numero;
	private int banco;
	private String vencimiento_mes;
	private String vencimiento_ano;
	private String codigo_seguridad;
	private String fecha_consignacion;
	private String numero_consignacion;
	private String franquicia;
	private String fecha_solicitud;
	private String solicitado_por;
	private String estado;
	private String valor;
	private String observaciones;
	private String email;
	private String devol_cuenta_banco;
	private String devol_tipo_cuenta;
	private String devol_banco;
	private String devol_ncuenta;
	private String identificacion_devol;
	private String formulario_web;
		
}
