package com.aoa.controller;

import java.util.Calendar;
import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;

import com.aoa.helpers.*;
import com.aoa.models.Bitacora;
import com.aoa.models.Siniestros;
import com.aoa.services.BitacoraService;
import com.aoa.services.CitasService;
import com.aoa.services.SiniestrosService;


@Controller
public class SiniestrosController {
	
	private SiniestrosService siniestrosService;	
	private CitasService citasService;
	private BitacoraService bitacoraService;
	
	@Autowired(required=true)
	@Qualifier(value="siniestrosService")
	public void setSiniestrosService(SiniestrosService sS){
		this.siniestrosService = sS;
	}
	
	@Autowired(required=true)
	@Qualifier(value="citasService")
	public void setCitasService(CitasService cS){
		this.citasService = cS;
	}
	
	@Autowired(required=true)
	@Qualifier(value="bitacoraService")
	public void setBitacoraService(BitacoraService bS){
		this.bitacoraService = bS;
	}
	
	
	@RequestMapping("/IngresoGarantia")
	public ModelAndView TestBd() {		
		return new ModelAndView("ingreso_garantia");
	}
	
	@RequestMapping(value = "/BeginProcess", method = RequestMethod.POST)
	public ModelAndView begin_process(@RequestParam("placa") String placa, @RequestParam("declarante_celular") String declarante_celular) throws UnknownHostException{
		String process = "";
		String message = "";
		System.out.println("Los parametros que vienen del form son "+placa+" y"+declarante_celular);
		Siniestros s = this.siniestrosService.begin_service(placa, declarante_celular);
		if(s != null)
		{
			System.out.println("id del siniestro "+s.getId());
			if(s.getEstado() == 3)
			{
				int cita_id = this.citasService.cita_arribo(s.getId());
				if(cita_id != 0)
				{
					System.out.println("aca guardo la bitacora");
					int year = Calendar.getInstance().get(Calendar.YEAR);
					int month = Calendar.getInstance().get(Calendar.MONTH);
					int day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
					int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
					int min = Calendar.getInstance().get(Calendar.MINUTE);
					int sec = Calendar.getInstance().get(Calendar.SECOND);
					
					Bitacora b = new Bitacora();
					b.setAno(String.valueOf(year));
					b.setMes(String.valueOf(month));
					b.setDia(String.valueOf(day));
					b.setHora(String.valueOf(hour));
					b.setMinuto(String.valueOf(min));
					b.setSegundo(String.valueOf(sec));
					b.setNick("Autoservicio");
					b.setNombre("Java_user");
					b.setTabla("cita_servicio");
					b.setAccion("M");
					b.setRegistro(cita_id);
					InetAddress IP=InetAddress.getLocalHost();
					b.setIp(IP.toString());
					b.setDetalle("Marca arribo asegurado"); 
					this.bitacoraService.create(b);				
				}
				else {
					System.out.println("ya existe el arribo");
				}					
				//process = "success";
				//message = "Siniestro encontrado con id "+s.getId();
				ModelAndView mv = new ModelAndView();
				mv.setViewName("test_camara");
				return mv;
			}
			if(s.getEstado() == 1)
			{
				process = "fail";
				message = "La placa "+placa+" se encuentra en estado NO ADJUDICADO";
			}
			if(s.getEstado() == 5)
			{
				process = "fail";
				message = "La placa "+placa+" se encuentra en estado PENDIENTE, no le ha sido adjudicado un servicio";
			}
			if(s.getEstado() == 7)
			{
				process = "fail";
				message = "La placa "+placa+" se encuentra en servicio no requiere garantia";
			}
			if(s.getEstado() == 8)
			{
				process = "fail";
				message = "La placa \"+placa+\" se encuentra en servicio concluido no requiere datos de garantia";
			}
			
		}
		else {
			process = "fail";
			message = "No hay un siniestro en el sistema con sus datos";
		}
		
		
		
		String prevurl = "IngresoGarantia";
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultados_volver");
		mv.addObject("process", process);
		mv.addObject("prevurl", prevurl);
		mv.addObject("message", message);
		return mv;
	}
}
