package com.aoa.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="users")
public class User {
	
	
	@Id
	@Column(name="id")	
	private int id;	
	private String username;
	private String password;
	private String email;
	private String creation;
	private int rol;
	
	public int getRol() {
		return rol;
	}
	public void setRol(int rol) {
		this.rol = rol;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCreation() {
		return creation;
	}
	public void setCreation(String created) {
		this.creation = created;
	}
	
	public String toString(){
		return "id= "+id+" username "+username+" password "+password+" email "+email+" created "+creation+" rol "+rol;
	}
	
}
