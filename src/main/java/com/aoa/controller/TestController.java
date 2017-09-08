package com.aoa.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.aoa.helpers.*;
import com.aoa.services.AutorizacionService;
import com.aoa.services.CiudadService;
import com.aoa.services.FranquiciasServiceImp;
import com.aoa.models.Autorizacion;
import com.aoa.models.Ciudad;
import com.aoa.models.Franquicia;
import com.aoa.models.Siniestros;
/**
 * Handles requests for the application home page.
 */
@Controller
public class TestController {
	
	private CiudadService ciudadService;
	private FranquiciasServiceImp franquiciasService;
	private AutorizacionService autorizacionService;
	
	@Autowired(required=true)
	@Qualifier(value="ciudadService")
	public void setCiudadService(CiudadService cS){
		this.ciudadService = cS;
	}
	
	@Autowired(required=true)
	@Qualifier(value="franquiciasService")
	public void setFranquiciasService(FranquiciasServiceImp fS){
		this.franquiciasService = fS;
	}
	
	@Autowired(required=true)
	@Qualifier(value="autorizacionService")
	public void setAutorizacionService(AutorizacionService aS){
		this.autorizacionService = aS;
	}
	
	@RequestMapping("/Testfileservice")
	public ModelAndView camera() {
		System.out.println("intento generar la vista de camara");
		String message = "Camera View";
		return new ModelAndView("test_camara", "message", message);
	}
	
	@RequestMapping("/DocumentosScaner")
	public ModelAndView documentos_scaner(HttpSession session) throws UnknownHostException {
		
		
		System.out.println("intento generar la vista de documentos");
		System.out.println(Inet4Address.getLocalHost().getHostAddress());
		String ipprivate = Inet4Address.getLocalHost().getHostAddress();
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("id_siniestro") == null) {
			
			mv.setViewName("resultados_volver");
			mv.addObject("process", "fail");
			mv.addObject("prevurl", "home");
			mv.addObject("message", "Ingreso no autorizado");
			return mv;
		}else {
			int siniestro = (int)session.getAttribute("id_siniestro");
			Autorizacion av = this.autorizacionService.get_by_siniester(String.valueOf(siniestro));
			session.setAttribute("AutorizacionId", av.getId());
		}
		
		String message = "Scanner View";
		/*String img_credito = (String) session.getAttribute("img_credito");
		mv.addObject("img_credito",img_credito);
		String img_debito = (String) session.getAttribute("img_debito");
		mv.addObject("img_debito",img_debito);*/
		mv.setViewName("documentos_scaner");
		mv.addObject("Privateip", ipprivate);
		int siniestro =  (int) session.getAttribute("id_siniestro");
		mv.addObject("Siniestroid", siniestro);
		return mv;		
	}
	
	@RequestMapping("/scanner")
	public ModelAndView scanner() {
		System.out.println("intento generar la vista de escaner");
		String message = "Scanner View";
		return new ModelAndView("test_scanner", "message", message);
	}
	
	@RequestMapping("/scanner2")
	public ModelAndView scanner2() {
		System.out.println("intento generar la vista de escaner2");
		String message = "Scanner View";
		return new ModelAndView("test_scanner2", "message", message);
	}
	
	@RequestMapping("/TestBD")
	public ModelAndView TestBd() {
		Siniestros s = methods.db_Test();
		
		System.out.println("Prueba de la bd");
		System.out.println(s.getNumero());
		return new ModelAndView("home");
	}
	
	@RequestMapping("/Tiposgarantia")
	public ModelAndView TiposGarantia(HttpSession session) {
		int oficina = (int) session.getAttribute("usuario_oficina");
		String aseguradora = (String) session.getAttribute("usuario_aseguradora");
		List<Franquicia> franquicias = this.franquiciasService.get_franquicias(oficina, aseguradora);
		return new ModelAndView("tipos_garantia");
	}
	
	@RequestMapping("/imagesFile")
	public ModelAndView imagesFile() {
		
		return new ModelAndView("images_files");
	}
	
	
	@RequestMapping("/personalForm")
	public ModelAndView personalform(HttpSession session) {
		System.out.println("foto url "+session.getAttribute("photo_url"));
		ModelAndView mv = new ModelAndView();
		//session.invalidate();
		System.out.println("id_siniestro "+session.getAttribute("id_siniestro"));
		if(session.getAttribute("id_siniestro") == null) {
			mv.setViewName("resultados_volver");
			mv.addObject("process", "fail");
			mv.addObject("prevurl", "home");
			mv.addObject("message", "Ingreso no autorizado");
			return mv;
		}
		List<Ciudad> listdepartamentos = this.ciudadService.listdepartamentos();
		 /*for (Object o : listdepartamentos ) { // ClassCastException?
	            System.out.println(o);
	        }*/
		 mv.setViewName("personal_form");
		 mv.addObject("listdepartamentos",listdepartamentos);
		return mv;
	}
	
	@RequestMapping(value="/get_ciudades", method = RequestMethod.POST)
	@ResponseBody
	public List<Ciudad> get_cities(@RequestParam("departamento") String departamento) {
		List<Ciudad> ciudades = this.ciudadService.listciudades(departamento);
		 /*for (Ciudad c : ciudades ) { // ClassCastException?
	            System.out.println(c.getNombre());
	        }*/	
		 return ciudades;
	}	

	@RequestMapping(value="/get_by_code", method = RequestMethod.POST)
	@ResponseBody
	public Ciudad get_by_code(@RequestParam("codigo") String citycode) {
		Ciudad c = this.ciudadService.get_by_code(citycode);
		 /*for (Ciudad c : ciudades ) { // ClassCastException?
	            System.out.println(c.getNombre());
	        }*/	
		 return c;
	}

	
	@RequestMapping(value="/ajaxtest", method = RequestMethod.POST)
	@ResponseBody
	public String Ajax(@RequestParam("image") MultipartFile file) throws IOException {
		//String nomFichier= file.getOriginalFilename();
		//byte[] bytes = file.getBytes();
		System.out.println("extensión: "+file.getOriginalFilename());
		String uploadsDir = "/uploads/";
		String ApplicationPath = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath(uploadsDir);
        System.out.println("soy el path "+ApplicationPath);
        if(! new File(ApplicationPath).exists())
        {
            new File(ApplicationPath).mkdir();
        }
        String orgName = file.getOriginalFilename();
        String filePath = ApplicationPath + orgName;
        File dest = new File(filePath);
        file.transferTo(dest);
		return "got it";
	}
	
	@RequestMapping(value="/set_photo_url", method = RequestMethod.POST)
	@ResponseBody
	public String set_photo_url(HttpSession session) throws IOException {
		String photourl = "ingreso_recepcion/Autoservicio/"+session.getAttribute("id_siniestro")+"/FotoArribo_"+session.getAttribute("id_siniestro")+".png";
		session.setAttribute("photo_url", photourl);
		return "got it";
	}
	
}
