package com.aoa.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.net.Inet4Address;
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
import com.aoa.models.Aseguradoras;
import com.aoa.models.Autorizacion;
import com.aoa.models.Client;
import com.aoa.models.Franquicia;
import com.aoa.models.Recepcion;
import com.aoa.services.AseguradorasService;
import com.aoa.services.AutorizacionService;
import com.aoa.services.ClientesService;
import com.aoa.services.FranquiciasServiceImp;
import com.aoa.services.RecepcionService;


@Controller
public class RecepcionController {
	
	private RecepcionService recepcionService;
	private ClientesService clientesService;
	private AutorizacionService autorizacionService;
	private AseguradorasService aseguradorasService;
	private FranquiciasServiceImp franquiciasService;
	
	
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
	
	@Autowired(required=true)
	@Qualifier(value="aseguradorasService")
	public void setAseguradorasService(AseguradorasService asS){
		this.aseguradorasService = asS;
	}
	
	@Autowired(required=true)
	@Qualifier(value="franquiciasService")
	public void setFranquiciasService(FranquiciasServiceImp fS){
		this.franquiciasService = fS;
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
	,HttpSession session) throws UnknownHostException	
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
		String ipprivate = Inet4Address.getLocalHost().getHostAddress();
		Object val;
		val = this.clientesService.getClientBycode(identificacion);
		Object val2;
		int cita =  (int) session.getAttribute("id_cita");
		val2 = this.recepcionService.get_by_code(identificacion,cita);
		Client c = new Client();
		
		c.setNombre(nombres.toUpperCase());
		c.setApellido(apellidos.toUpperCase());
		c.setTipo_id(tipo_identificacion);
		c.setIdentificacion(identificacion);
		c.setLugar_expdoc(lugar_expedicion.toUpperCase());
		c.setPais("CO");
		c.setCiudad(ciudad);
		c.setDireccion(dir_domicilio.toUpperCase());
		c.setBarrio(barrio.toUpperCase());
		c.setTelefono_oficina(tel_oficina);
		c.setTelefono_casa(tel_vivienda);
		c.setCelular(celular);
		c.setEmail_e(correo);
		c.setSexo(sexo);
		
		session.setAttribute("nombre_usuario", c.getNombre()+c.getApellido());
		session.setAttribute("usuario_identificacion", c.getIdentificacion());
		session.setAttribute("correo", c.getEmail_e());
		
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
		
		int oficina = (int) session.getAttribute("usuario_oficina");
		int aseguradoraint = (int) session.getAttribute("usuario_aseguradora");
		String aseguradora = String.valueOf(aseguradoraint);
		List<Franquicia> franquicias = this.franquiciasService.get_franquicias(oficina, aseguradora);
		
		for(Franquicia f : franquicias)
		{
			System.out.println("franquicia "+f.getNombre());
			
			if(f.getId() == "10")
			{
				this.autorizacion_extra(session);
				mv.setViewName("documentos_scaner");
				mv.addObject("Siniestroid", siniestro);
				mv.addObject("Privateip", ipprivate);				
				return mv;
			}
		}
		
				
		if(franquicias.size()<1)
		{
			mv.setViewName("resultados_volver");
			mv.addObject("process", "fail");
			mv.addObject("prevurl", "home");
			mv.addObject("message", "Error 701 porfavor comuniquese con recepci�n");
			return mv;
		}
		
		int siniestro1 = (int) session.getAttribute("id_siniestro");
		Object val1 = this.autorizacionService.get_by_siniester(String.valueOf(siniestro1));
		
		Aseguradoras as = new Aseguradoras();
		as = this.aseguradorasService.getAseguradorasById((int) session.getAttribute("usuario_aseguradora"));
		session.setAttribute("nombre_aseguradora", as.getNombre());
		session.setAttribute("identificacion_aseguradora", as.getNit());
		System.out.println("pide autorizaci�n: "+as.getPide_autorizacion());
		
		if(val1 != null && as.getPide_autorizacion() == 1) {
			System.out.println("ya existe autorizaci�n");
			
			Autorizacion Au = (Autorizacion) val1;
			String estado = Au.getEstado();
			
			System.out.println("franquicia "+Au.getFranquicia());
			System.out.println("estado "+Au.getEstado());
			System.out.println("archivo "+Au.getConsignacion_f());			
			
			if(Integer.parseInt(Au.getFranquicia()) == 6)
			{
				session.setAttribute("img_consignacion", 1);
				session.setAttribute("consignacion_img",Au.getConsignacion_f());
				
			}
			else {
				session.setAttribute("img_consignacion", null);
			}
			
			mv.setViewName("documentos_scaner");
			mv.addObject("Privateip", ipprivate);
			mv.addObject("Siniestroid", siniestro);
			return mv;
			
			/*if(estado == "R")
			{
				mv.addObject("franquicias",franquicias);
				mv.addObject("valor_efectivo",as.getGarantia_consignada());
				mv.addObject("valor_riesgo",as.getValor_no_reembols());
				mv.addObject("valor_credito",as.getGarantia());
				mv.setViewName("tipos_garantia");
				return mv;
			}			
			
			
			if(estado == "E")
			{
				//if de si ya tiene documentos
				mv.setViewName("documentos_scaner");
				mv.addObject("Privateip", ipprivate);
				mv.addObject("Siniestroid", siniestro);
				return mv;
			}*/
			
		}
		else {
			int no_garantia = (int) session.getAttribute("no_garantia");
			if(no_garantia == 0)
			{
				mv.addObject("franquicias",franquicias);
				mv.addObject("valor_efectivo",as.getGarantia_consignada());
				mv.addObject("valor_riesgo",as.getValor_no_reembols());
				mv.addObject("valor_credito",as.getGarantia());
				mv.setViewName("tipos_garantia");
				return mv;
			}
		}
		
		this.autorizacion_extra(session);
		session.setAttribute("auto_autorizacion", 1);
		mv.setViewName("documentos_scaner");
		mv.addObject("Privateip", ipprivate);
		mv.addObject("Siniestroid", siniestro);
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
	public String garantia_efectivo(HttpSession session
			,@RequestParam("comprobante_consignacion") String comprobante_consignacion
			,@RequestParam("fecha_consignacion") String fecha_consignacion
			,@RequestParam("devol_cuenta_bancaria") String devol_cuenta_bancaria
			,@RequestParam("devol_tipo_cuenta") String devol_tipo_cuenta
			,@RequestParam("devol_banco") String devol_banco
			,@RequestParam("devol_nombre_titular") String devol_nombre_titular	
			,@RequestParam("devol_iden_titular") String devol_iden_titular
			,@RequestParam("valor_congelamiento") int valor_congelamiento) {
		session.setAttribute("img_consignacion", 1);
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());	
		String now = currentTime.toString();
		int siniestro = (int) session.getAttribute("id_siniestro");
		if(siniestro == 0)
		{ return "finish";}
		Object val = this.autorizacionService.get_by_siniester(String.valueOf(siniestro));
		Autorizacion au = new Autorizacion();
		au.setSiniestro((int) session.getAttribute("id_siniestro"));
		au.setNombre((String) session.getAttribute("nombre_usuario"));
		au.setIdentificacion((String) session.getAttribute("usuario_identificacion"));
		au.setFecha_consignacion(fecha_consignacion);
		au.setNumero_consignacion(comprobante_consignacion);
		au.setFranquicia("6");
		au.setFecha_solicitud(now);
		au.setSolicitado_por("autoservicio AOA");
		au.setEstado("E");	
	
		
		au.setValor(String.valueOf(valor_congelamiento));
		au.setEmail((String) session.getAttribute("correo"));
		au.setDevol_tipo_cuenta(devol_tipo_cuenta);
		au.setDevol_cuenta_banco(devol_cuenta_bancaria);
		au.setBanco(Integer.parseInt(devol_banco));
		au.setDevol_ncuenta(devol_nombre_titular);
		au.setIdentificacion_devol(devol_iden_titular);
		au.setFormulario_web("2");
		
		if(val == null) {
			this.autorizacionService.create(au);
		}
		else {
			Autorizacion pass = (Autorizacion) val;
			au.setId(pass.getId());
			this.autorizacionService.update(au);
		}
		return "got it";		
	}
	
	@RequestMapping(value="/garantia_credito", method = RequestMethod.POST)
	@ResponseBody
	public String garantia_credito(HttpSession session
			,@RequestParam("numero_tarjeta") String numero_tarjeta
			,@RequestParam("month_expi") String month_expi
			,@RequestParam("banco") String banco
			,@RequestParam("franquicia") String franquicia
			,@RequestParam("year_expi") String year_expi
			,@RequestParam("cvv") String cvv
			,@RequestParam("devol_tipo_cuenta") String devol_tipo_cuenta
			,@RequestParam("devol_cuenta_bancaria") String devol_cuenta_bancaria	
			,@RequestParam("devol_banco") String devol_banco
			,@RequestParam("devol_nombre_titular") String devol_nombre_titular
			,@RequestParam("valor_congelamiento") int valor_congelamiento
			,@RequestParam("devol_iden_titular") String devol_iden_titular) {
		
		session.setAttribute("img_credito", 1);		
		int siniestro = (int) session.getAttribute("id_siniestro");
		if(siniestro == 0)
		{ return "finish";}
		String siniestrotext = String.valueOf(siniestro);
		Object val = this.autorizacionService.get_by_siniester(siniestrotext);
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());	
		String now = currentTime.toString();		
		Autorizacion au = new Autorizacion();
		au.setSiniestro((int) session.getAttribute("id_siniestro"));
		au.setNombre((String) session.getAttribute("nombre_usuario"));
		au.setIdentificacion((String) session.getAttribute("usuario_identificacion"));
		au.setNumero(numero_tarjeta);
		au.setFranquicia(franquicia);
		au.setBanco(Integer.parseInt(banco));
		au.setVencimiento_mes(month_expi);
		au.setVencimiento_ano(year_expi);
		au.setCodigo_seguridad(cvv);
		au.setFecha_solicitud(now);
		au.setSolicitado_por("autoservicio AOA");
		au.setEstado("E");
		
		au.setValor(String.valueOf(valor_congelamiento));
		au.setEmail((String) session.getAttribute("correo"));
		au.setDevol_tipo_cuenta(devol_tipo_cuenta);
		au.setDevol_cuenta_banco(devol_cuenta_bancaria);
		au.setBanco(Integer.parseInt(devol_banco));
		au.setDevol_ncuenta(devol_nombre_titular);
		au.setIdentificacion_devol(devol_iden_titular);
		au.setFormulario_web("2");
		
		if(val == null) {
			this.autorizacionService.create(au);
		}
		else {
			Autorizacion pass = (Autorizacion) val;
			au.setId(pass.getId());
			this.autorizacionService.update(au);		
		}
		return "got it";
	}
	
	@RequestMapping(value="/garantia_riesgo", method = RequestMethod.POST)
	@ResponseBody
	public String garantia_riesgo(HttpSession session
			,@RequestParam("comprobante_consignacion") String comprobante_consignacion
			,@RequestParam("fecha_consignacion") String fecha_consignacion
			,@RequestParam("devol_tipo_cuenta") String devol_tipo_cuenta
			,@RequestParam("devol_cuenta_bancaria") String devol_cuenta_bancaria
			,@RequestParam("devol_banco") String devol_banco
			,@RequestParam("devol_nombre_titular") String devol_nombre_titular	
			,@RequestParam("devol_iden_titular") String devol_iden_titular
			,@RequestParam("valor_congelamiento") int valor_congelamiento) {
		session.setAttribute("img_consignacion", 1);
		int siniestro = (int) session.getAttribute("id_siniestro");
		if(siniestro == 0)
		{ return "finish";}
		String siniestrotext = String.valueOf(siniestro);
		Object val = this.autorizacionService.get_by_siniester(siniestrotext);
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());	
		String now = currentTime.toString();		
		
		Autorizacion au = new Autorizacion();
		au.setSiniestro((int) session.getAttribute("id_siniestro"));
		au.setNombre((String) session.getAttribute("nombre_usuario"));
		au.setIdentificacion((String) session.getAttribute("usuario_identificacion"));
		au.setFecha_consignacion(fecha_consignacion);
		au.setNumero_consignacion(comprobante_consignacion);
		au.setFranquicia("6");
		au.setFecha_solicitud(now);
		au.setSolicitado_por("autoservicio AOA");
		au.setEstado("E");	

		
		au.setValor(String.valueOf(valor_congelamiento));
		au.setEmail((String) session.getAttribute("correo"));
		au.setDevol_tipo_cuenta(devol_tipo_cuenta);
		au.setDevol_cuenta_banco(devol_cuenta_bancaria);
		au.setBanco(Integer.parseInt(devol_banco));
		au.setDevol_ncuenta(devol_nombre_titular);
		au.setIdentificacion_devol(devol_iden_titular);
		au.setFormulario_web("2");		
		
		
		if(val == null) {
			this.autorizacionService.create(au);
		}
		else {
			Autorizacion pass = (Autorizacion) val;
			au.setId(pass.getId());
			this.autorizacionService.update(au);		
		}
		
		return "got it";
	}
	
	public void autorizacion_extra(HttpSession session)
	{
		session.setAttribute("Autoriza_automaticamente","si");
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());	
		String now = currentTime.toString();
		int siniestro = (int) session.getAttribute("id_siniestro");
		Object val = this.autorizacionService.get_by_siniester(String.valueOf(siniestro));
		Autorizacion au = new Autorizacion();
		au.setSiniestro((int) session.getAttribute("id_siniestro"));
		au.setNombre((String) session.getAttribute("nombre_aseguradora"));
		au.setIdentificacion((String) session.getAttribute("identificacion_aseguradora"));

		au.setFranquicia("10");
		au.setFecha_solicitud(now);
		au.setSolicitado_por("autoservicio AOA");
		au.setEstado("E");	
	
		
		au.setValor(String.valueOf("0"));
		
		au.setDevol_tipo_cuenta("");
		au.setDevol_cuenta_banco("");
		au.setBanco(Integer.parseInt("0"));
		au.setDevol_ncuenta("");
		au.setIdentificacion_devol("0");
		
		au.setFormulario_web("2");
		
		if(val == null) {
			this.autorizacionService.create(au);
		}
		else {
			Autorizacion pass = (Autorizacion) val;
			au.setId(pass.getId());
			this.autorizacionService.update(au);
		}		
	}
	

	

}
