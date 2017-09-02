package com.aoa.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.aoa.services.AutorizacionService;
import com.aoa.services.ClientesService;
import com.aoa.services.RecepcionService;


@Controller
public class RecepcionController {
	
	private RecepcionService recepcionService;
	private ClientesService clientesService;
	private AutorizacionService autorizacionService;
	
	
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
	
	@Autowired(required=true)
	@Qualifier(value="autorizacionService")
	public void setAutorizacionService(AutorizacionService aS){
		this.autorizacionService = aS;
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
	,@RequestParam("codigo_ciudad") String ciudad
	,@RequestParam("barrio") String barrio
	,@RequestParam("dir_domicilio") String dir_domicilio
	,@RequestParam("tel_oficina") String tel_oficina
	,@RequestParam("tel_vivienda") String tel_vivienda
	,@RequestParam("celular") String celular
	,@RequestParam("correo") String correo
	,@RequestParam("sexo") String sexo
	,HttpSession session)	
	 {
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("id_siniestro") == null || session.getAttribute("id_cita") == null)
		{
			mv.setViewName("resultados_volver");
			mv.addObject("process", "fail");
			mv.addObject("prevurl", "home");
			mv.addObject("message", "Debe reiniciar el proceso");
			return mv;
		}
		
		//System.out.println("llegue al controller");
		Object val;
		val = this.clientesService.getClientBycode(identificacion);
		Object val2;
		int cita =  (int) session.getAttribute("id_cita");
		val2 = this.recepcionService.get_by_code(identificacion,cita);
		Client c = new Client();
		
		c.setNombre(nombres);
		c.setApellido(apellidos);
		c.setTipo_id(tipo_identificacion);
		c.setIdentificacion(identificacion);
		c.setLugar_expdoc(lugar_expedicion);
		c.setPais("CO");
		c.setCiudad(ciudad);
		c.setDireccion(dir_domicilio);
		c.setBarrio(barrio);
		c.setTelefono_oficina(tel_oficina);
		c.setTelefono_casa(tel_vivienda);
		c.setCelular(celular);
		c.setEmail_e(correo);
		c.setSexo(sexo);
		
		Recepcion r = new Recepcion();
		r.setNombre("nombres");
		r.setApellido("apellidos");
		String arribo = (String) session.getAttribute("arribo");
		r.setFecha(arribo);
		r.setDescripcion("Autoservicio recepcion");
		r.setRegistrado_por("Java_app");
		r.setVisitado(1);
		r.setIdentificacion(identificacion);
		String url = (String) session.getAttribute("photo_url");
		r.setFoto_f(url);		
		r.setCita(cita);
		int siniestro =  (int) session.getAttribute("id_siniestro");
		r.setSiniestro(siniestro); 
		
		if (val == null)
		{			
			this.clientesService.create(c);		
		}
		else {
			Client pass = (Client) val;	
			c.setId(pass.getId());
			System.out.println("ya existe el cliente");
			this.clientesService.update(c);	
		}
		
		if (val2 == null)
		{			
			this.recepcionService.create(r);
		}
		else {
			Recepcion pass = (Recepcion) val2;	
			r.setId(pass.getId());
			System.out.println("ya existe el ingreso a recepcion "+r.getId());
			this.recepcionService.update(r);	
		}	
		
		mv.setViewName("tipos_garantia");
		return mv;
	}
	
	@RequestMapping(value="/get_user_info", method = RequestMethod.POST)
	@ResponseBody
	public Client get_user_info(@RequestParam("documento") String documento) {
		System.out.println(documento);
		Object val;
		val = this.clientesService.getClientBycode(documento);
		return (Client) val;
	}
	
	@RequestMapping(value="/garantia_efectivo", method = RequestMethod.POST)
	@ResponseBody
	public String garantia_efectivo(HttpSession session) {
		String siniestro = (String) session.getAttribute("id_siniestro");
		Object val = this.autorizacionService.get_by_siniester(siniestro);
		return "got it";		
	}
	
	@RequestMapping(value="/garantia_credito", method = RequestMethod.POST)
	@ResponseBody
	public String garantia_credito(HttpSession session) {
		int siniestro = (int) session.getAttribute("id_siniestro");
		String siniestrotext = String.valueOf(siniestro);
		Object val = this.autorizacionService.get_by_siniester(siniestrotext);
		return "got it";
	}
	
	@RequestMapping(value="/garantia_riesgo", method = RequestMethod.POST)
	@ResponseBody
	public String garantia_riesgo(HttpSession session) {
		
		return "got it";
	}
	

}
