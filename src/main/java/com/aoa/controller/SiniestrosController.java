package com.aoa.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import com.aoa.helpers.*;
import com.aoa.models.Autorizacion;
import com.aoa.models.Bitacora;
import com.aoa.models.Citas;
import com.aoa.models.Siniestros;
import com.aoa.services.AutorizacionService;
import com.aoa.services.BitacoraService;
import com.aoa.services.CitasService;
import com.aoa.services.SiniestrosService;


@Controller
public class SiniestrosController {	

	
	private SiniestrosService siniestrosService;	
	private CitasService citasService;
	private BitacoraService bitacoraService;
	private AutorizacionService autorizacionService;
	
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
	
	@Autowired(required=true)
	@Qualifier(value="autorizacionService")
	public void setAutorizacionService(AutorizacionService aS){
		this.autorizacionService = aS;
	}
	
	
	@RequestMapping("/IngresoGarantia")
	public ModelAndView TestBd(HttpSession session) {
		String Successmessage = (String) session.getAttribute("success");
		System.out.println("vista de garantia "+Successmessage);
		return new ModelAndView("ingreso_garantia");
	}
	
	@RequestMapping(value = "/BeginProcess", method = RequestMethod.POST)
	public @ResponseBody ModelAndView begin_process(@RequestParam("placa") String placa, @RequestParam("declarante_celular") String declarante_celular,HttpSession session) throws UnknownHostException{
		
		
		String process = "";
		String message = "";
		System.out.println("Los parametros que vienen del form son "+placa+" y"+declarante_celular);
		Siniestros s = this.siniestrosService.begin_service(placa, declarante_celular);		
		if(s != null)
		{
			session.setAttribute("id_siniestro" , s.getId());
			session.setAttribute("foto_cedulaA", s.getImg_cedula_f());
			session.setAttribute("foto_cedulaB", s.getImg_pase_f());
			System.out.println("test image :"+session.getAttribute("foto_cedulaB"));
			session.setAttribute("foto_paseA", s.getAdicional1_f());
			session.setAttribute("foto_paseB", s.getAdicional2_f());			
			session.setAttribute("no_garantia", s.getNo_garantia());
			
			System.out.println("id del siniestro "+s.getId());
			if(s.getEstado() == 3)
			{
				Citas c = this.citasService.cita_arribo(s.getId());				
				
				if(c == null)
				{
					System.out.println("No hay cita");
					ModelAndView mv = new ModelAndView();
					mv.setViewName("resultados_volver");
					mv.addObject("process", "fail");
					mv.addObject("prevurl", "home");
					mv.addObject("message", "Error 700  No hay cita pendiente! porfavor comuniquese con recepción");
					return mv;
				}
				
				if(c.getId() == 0)
				{
					ModelAndView mv = new ModelAndView();
					mv.setViewName("resultados_volver");
					mv.addObject("process", "fail");
					mv.addObject("prevurl", "home");
					mv.addObject("message", "Error 700  No hay cita pendiente! porfavor comuniquese con recepción");
					return mv;
				}
				
				session.setAttribute("id_cita" , c.getId());
				session.setAttribute("dias_servicio" , c.getDias_servicio());
				session.setAttribute("usuario_oficina" , c.getOficina());
				session.setAttribute("usuario_aseguradora" , s.getAseguradora());
				
				//System.out.println("id de la cita "+c.getId());
				System.out.println("arribo detectado "+c.getArribo());
				
				if(c.getArribo() == null || c.getArribo() == "0000-00-00 00:00:00")
				{	
					Timestamp currentTime = new Timestamp(System.currentTimeMillis());	
					String arribo = currentTime.toString();
					c.setArribo(arribo);
					session.setAttribute("arribo" , arribo);
					System.out.println("Si el arribo era null pasa a valer "+arribo);
					this.citasService.update(c);
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
					b.setRegistro(c.getId());
					InetAddress IP=InetAddress.getLocalHost();
					b.setIp(IP.toString());
					b.setDetalle("Marca arribo asegurado"); 
					this.bitacoraService.create(b);			
				}				
				else {
					session.setAttribute("arribo" , c.getArribo());
					System.out.println("ya existe el arribo");
				}			
				
				ModelAndView mv = new ModelAndView();
				mv.setViewName("camara");
				
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
				message = "La placa "+placa+" se encuentra en servicio concluido no requiere datos de garantia";
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
	
	@RequestMapping(value="/Procesofinalizado")
	
	public ModelAndView proceso_finalizado(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("id_siniestro") == null ) {
			
			mv.setViewName("resultados_volver");
			mv.addObject("process", "fail");
			mv.addObject("prevurl", "home");
			mv.addObject("message", "Ingreso no autorizado");
			return mv;
		}
		else {
			int id = (int) session.getAttribute("id_siniestro");
			Siniestros s = this.siniestrosService.getSiniestroByid(id);
			if(s.getImg_cedula_f() == null || s.getImg_pase_f() == null|| s.getAdicional1_f() == null || s.getAdicional2_f() == null)
			{				
				mv.setViewName("resultados_volver");
				mv.addObject("process", "fail");
				mv.addObject("prevurl", "IngresoGarantia");
				mv.addObject("message", "No estan las imagenes completas");
				return mv;
			}
			else {	
				String message = "Proceso terminado, Diríjase a autorizaciones, se verficaran sus documentos y sus datos";
				if(session.getAttribute("Autoriza_automaticamente")!=null)
				{
					Autorizacion au = this.autorizacionService.get_by_siniester(String.valueOf(s.getId()));
					au.setEstado("A");
					Timestamp currentTime = new Timestamp(System.currentTimeMillis());	
					String fecha_proceso = currentTime.toString();
					au.setFecha_proceso(fecha_proceso);
					this.autorizacionService.update(au);
					message = "Proceso autorizado, Diríjase a patio por su vehículo";
				}
				mv.setViewName("resultados_volver");
				mv.addObject("process", "success");
				mv.addObject("prevurl", "IngresoGarantia");
				mv.addObject("message", message);
				return mv;
			}
				
			
		}		
		
	}
}
