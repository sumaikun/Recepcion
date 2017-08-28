package com.aoa.controller;

import java.util.Calendar;
import java.util.List;
import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aoa.helpers.*;
import com.aoa.models.Client;
import com.aoa.models.Recepcion;
import com.aoa.services.ClientesService;
import com.aoa.services.RecepcionService;


@Controller
public class RecepcionController {
	
	private RecepcionService recepcionService;
	private ClientesService clientesService;	
	
	
	@Autowired(required=true)
	@Qualifier(value="recepcionService")
	public void setRecepcionService(RecepcionService rS){
		this.recepcionService = rS;
	}
	
	@Autowired(required=true)
	@Qualifier(value="clientesService")
	public void setClientService(ClientesService cS){
		this.clientesService = cS;
	}
	
	@RequestMapping(value="/TestBD2")
	@ResponseBody
	public String testBD2(){		
		Recepcion r = this.recepcionService.getRecepcionById(45);
		return r.getNombre();
	}
	
	@RequestMapping(value="/create_customer_data", method = RequestMethod.POST)
	
	public ModelAndView Cliente_recepcion(@RequestParam("identificacion") String identificacion
	,@RequestParam("lugar_expedicion") String lugar_expedicion
	,@RequestParam("nombres") String nombres
	,@RequestParam("apellidos") String apellidos
	,@RequestParam("tipo_identificacion") String tipo_identificacion
	,@RequestParam("pais") String pais
	,@RequestParam("ciudad") String ciudad
	,@RequestParam("barrio") String barrio
	,@RequestParam("dir_domicilio") String dir_domicilio
	,@RequestParam("tel_oficina") String tel_oficina
	,@RequestParam("tel_vivienda") String tel_vivienda
	,@RequestParam("celular") String celular
	,@RequestParam("correo") String correo
	,@RequestParam("sexo") String sexo)
	 {
		System.out.println("llegue al controller");
		String val;
		val = this.clientesService.getClientBycode(identificacion);
		if (val == null)
		{
			Client c = new Client();
			c.setNombre(nombres);
			c.setApellido(apellidos);
			c.setTipo_id(tipo_identificacion);
			c.setIdentificacion(identificacion);
			c.setLugar_expdoc(lugar_expedicion);
			c.setPais("CO");
			c.setCiudad("50001000");
			c.setDireccion(dir_domicilio);
			c.setBarrio(barrio);
			c.setTelefono_oficina(tel_oficina);
			c.setTelefono_casa(tel_vivienda);
			c.setCelular(celular);
			c.setEmail_e("correo");
			c.setSexo(sexo);
			this.clientesService.create(c);
			Recepcion r = new Recepcion();
			r.setNombre("nombres");
			r.setApellido("apellidos");
			Timestamp currentTime = new Timestamp(System.currentTimeMillis());
			String arribo = currentTime.toString();
			r.setFecha(arribo);
			r.setDescripcion("Autoservicio recepcion");
			r.setRegistrado_por("Java_app");
			r.setVisitado(1);
			r.setIdentificacion(identificacion);
			this.recepcionService.create(r);

		}	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultados_volver");
		return mv;
	}
	

}
