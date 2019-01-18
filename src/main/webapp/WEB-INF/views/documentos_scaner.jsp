<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<script>
function add_image_to_form(imageid,value)
{
	$("#"+imageid).val(value);
}

</script>

   <input type="hidden" name="imagena" id="imagena">
   <input type="hidden" name="imagenb" id="imagenb">
   <input type="hidden" name="imagenc" id="imagenc">
   <input type="hidden" name="imagend" id="imagend">
   <input type="hidden" name="imagene" id="imagene">
   <input type="hidden" name="imagenf" id="imagenf">
   <input type="hidden" name="imagenf" id="imageng">
   <input type="hidden" name="imagenf" id="imagenh">
 
  <style>
	#home{
		background-color: white;	
   		background-image: url("<c:url value="/resources/theme1/images/LogoAoa.png" />")	;	
		background-size: 95% 85%;
    	background-repeat: no-repeat;
    	background-repeat:no-repeatdisplay: compact;
    	background-position:center 105px;
    	background-attachment: fixed;
	}
	
	input[type=text] {
    background-color: #3CBC8D;
    color: white;
	}
</style>
<br>
<br>
<header id="home">
	 <div class="container">
         <div class="row">
             <div class="col-lg-12">                 
                 <div class="intro-text">                 	
                     <span class="name" ><font color="#424242">Documentos</font></span>
                 	 <hr class="star-light">                	 
                 </div>
             </div>
             <div class="row" >             	
	             	<div class="col-lg-3 col-md-3 " id="cedulaA"><img onload="add_image_to_form('imagena',2)"  src="http://app.aoacolombia.com/Control/operativo/${foto_cedulaA}" alt="aoa" height="300" width="300"></div>
	             	<div class="col-lg-3 col-md-3 " id="cedulaB"><img  onload="add_image_to_form('imagenb',2)" src="http://app.aoacolombia.com/Control/operativo/${foto_cedulaB}" alt="aoa" height="300" width="300"></div>
	           	 	<div class="col-lg-3 col-md-3 " id="LicenciaA"><img  onload="add_image_to_form('imagenc',2)" src="http://app.aoacolombia.com/Control/operativo/${foto_paseA}" alt="aoa" height="300" width="300"></div>         	 	
         	 		<div class="col-lg-3 col-md-3 " id="LicenciaB"><img onload="add_image_to_form('imagend',2)" src="http://app.aoacolombia.com/Control/operativo/${foto_paseB}"  alt="aoa" height="300" width="300"></div>
         	 </div>	
         	 
             <div class="row" >
             	 
	             	<div class="col-lg-3 col-md-3"><a href="CedulaCaraA:"><button onclick="beginsearch()" class="btn btn-primary btn-lg">Cedula parte adelante</button></a></div>	           	 
	           	 	<div class="col-lg-3 col-md-3"><a href="CedulaCaraB:"><button onclick="beginsearch2()" class="btn btn-primary btn-lg">Cedula respaldo</button></a></div>
	           	 	<div class="col-lg-3 col-md-3"><a href="LicenciaCaraA:"><button onclick="beginsearch3()"  class="btn btn-primary btn-lg">Licencia conducir parte adelante</button></a></div>
         	 		<div class="col-lg-3 col-md-3"><a href="LicenciaCaraB:"><button onclick="beginsearch4()" class="btn btn-primary btn-lg">Licencia de conducir respaldo</button></a></div>
         	 </div>
         	 <br>
         	 <div class="row" >
         	 		<c:if test="${ active_tarh == 1 }">         	 	 	
         	 	 		<div class="col-lg-3 col-md-3 " id="Tarh_frontal"><img onload="add_image_to_form('imageng',2)" src="http://app.aoacolombia.com/Control/operativo/${Tarh_frontal}" alt="aoa" height="300" width="300"></div>	              	
	              		<div class="col-lg-3 col-md-3 " id="Tarh_trasera"><img onload="add_image_to_form('imagenh',2)" src="http://app.aoacolombia.com/Control/operativo/${Tarh_trasera}" alt="aoa" height="300" width="300"></div> 
	              	</c:if>      	 	 	         	 	 	
         	 	 	<c:if test="${ img_credito == 1 }">         	 	 	
         	 	 		<div class="col-lg-3 col-md-3 " id="Tcredito"><img  alt="aoa" height="300" width="300"></div>	              	
	              	</c:if>	              	
	              	<c:if test="${ img_consignacion == 1 }">
	              		<div class="col-lg-3 col-md-3 " id="Consignacion"><img onload="add_image_to_form('imagenf',2)"  src="http://app.aoacolombia.com/Control/operativo/${consignacion_img}"  alt="aoa" height="300" width="300"></div>
	             	</c:if>
         	 </div>	
         	 
             <div class="row" >
             		<c:if test="${ active_tarh == 1 }">         	 	 	
         	 	 		<div class="col-lg-3 col-md-3 "><a href="Tarhfrontal:"><button onclick="beginsearch7()" class="btn btn-primary btn-lg">Cedula tarjetahaviente (frontal)</button></a>
         	 	 		</div>	              	
	              		<div class="col-lg-3 col-md-3 "><a href="Tarhtrasera:"><button onclick="beginsearch8()" class="btn btn-primary btn-lg">Cedula tarjetahaviente (trasera)</button></a>
	              		</div>
	              	</c:if>          	
	              	<c:if test="${ img_credito == 1 }">	              	
	              	<div class="col-lg-3 col-md-3"><a href="TarjetaCredito:"><button onclick="beginsearch5()" class="btn btn-primary btn-lg">Tarjeta de credito (frontal)</button></a></div>	              	
	              	</c:if>	              	
	              	<c:if test="${ img_consignacion == 1 }">
	              	<div class="col-lg-3 col-md-3"><a href="Consignacion:"><button onclick="beginsearch6()" class="btn btn-primary btn-lg">Consignación realizada</button></a></div>
	              	</c:if>           	 
         	 </div>
         	 	
         </div>
         <br>
         <br>
      
         <button onclick="move_images_service()" style="height:200%; !important" class="btn btn-lg form-control btn-success">Enviar Imagenes</button>
         <br>
         <br>
         <!--<button style="height:200%; !important" onclick="finish_process()" class="btn btn-lg form-control btn-danger">Terminar</button>-->
     </div>
</header>
  
<script>

	$(document).ready(function() {
		$("html, body").animate({ scrollTop:  194.75}, 600);
		$.post("http://app.aoacolombia.com/Control/operativo/controllers/RecepcionController.php",
				{delete_all:1,priip:"${Privateip}"},
			function(res, sta){			
		});
	});

	var a = 0;
	
	var b = 0;
	
	var c = 0;
	
	var d = 0;
	
	var e = 0;
	
	var f = 0;
	
	var g = 0;
	
	var h = 0;
	
	var get64 = "";

	window.setInterval(function(){
		if(a!=0)
		{
			imagen_a();
		}
		if(b!=0)
		{
			imagen_b();
		}
		if(c!=0)
		{
			imagen_c();
		}
		if(d!=0)
		{
			imagen_d();
		}
		if(e!=0)
		{
			imagen_e();
		}
		if(f!=0)
		{
			imagen_f();
		}
		if(g!=0)
		{
			imagen_g();
		}
		if(h!=0)
		{
			imagen_h();
		}
		
	}, 10000);
	
	function beginsearch()
	{
		console.log("in");
		a=1;
	}
	
	function beginsearch2()
	{
		console.log("in");
		b=1;
	}
	
	function beginsearch3()
	{
		console.log("in");
		c=1;
	}
	
	function beginsearch4()
	{
		console.log("in");
		d=1;
	}
	
	function beginsearch5()
	{
		console.log("in");
		e=1;
	}
	
	function beginsearch6()
	{
		console.log("in");
		f=1;
	}
	
	function beginsearch7()
	{
		console.log("in");
		g=1;
	}
	
	function beginsearch8()
	{
		console.log("in");
		h=1;
	}
    
	method = "server";
	
	if(method = "server")
	{
		window.RTCPeerConnection = window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection;   //compatibility for firefox and chrome
	    var pc = new RTCPeerConnection({iceServers:[]}), noop = function(){};      
	    pc.createDataChannel("");    //create a bogus data channel
	    pc.createOffer(pc.setLocalDescription.bind(pc), noop);    // create offer and set local description
	    pc.onicecandidate = function(ice){  //listen for candidate events
	        if(!ice || !ice.candidate || !ice.candidate.candidate)  return;
	        var myIP = /([0-9]{1,3}(\.[0-9]{1,3}){3}|[a-f0-9]{1,4}(:[a-f0-9]{1,4}){7})/.exec(ice.candidate.candidate)[1];
	        console.log('my IP: ', myIP); 
	        Ipprivate = myIP;
	        pc.onicecandidate = noop;
	    };
	    //alert(Ipprivate);
	}
	else{
		Ipprivate = "${Privateip}";		
		//alert(Ipprivate);
	}
	
	
	function imagen_a()
	{		
		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+Ipprivate+'/Cedula_caraA.png?' + new Date().getTime();
		var img = $("<img />").attr('src',url)
		.attr('id',"testimage")
		.attr('onerror',"add_image_to_form('imagena',0)")
	    .on('load', function() {
	        if (!this.complete) {
	            alert('broken image!');
	            return "";
	            //console.log("no found");
	        } else {
	        	//console.log("found");
	        	add_image_to_form("imagena",1);
	        	img.width(300).height(300);
	        	$("#cedulaA").empty();
	            $("#cedulaA").append(img);
	            var  img_validation  = try_miracle("Cedula_caraA.png");
	            if(img_validation == "diferentes")
            	{	            	
	            	img.width(300).height(300);
		            $("#cedulaA").append(img);
            	}
	        }
	    });		
	}
	
	function imagen_b()
	{		
		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+Ipprivate+'/Cedula_caraB.png?' + new Date().getTime();
		var img = $("<img />").attr('src',url)
		.attr('id',"testimage")		
	    .attr('onerror',"add_image_to_form('imagenb',0)")
		.on('load', function() {
	        if (!this.complete) {
	            alert('broken image!');
	            add_image_to_form("imagenb",0);
	        } else {
	        	add_image_to_form("imagenb",1);
	        	img.width(300).height(300);
	        	$("#cedulaB").empty();
	            $("#cedulaB").append(img);
	            var  img_validation  = try_miracle("Cedula_caraB.png");
	            if(img_validation == "diferentes")
            	{	            	
	            	img.width(300).height(300);
		            $("#cedulaB").append(img);
            	}
	        }
	    });		
	}
	
	function imagen_c()
	{		
		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+Ipprivate+'/Licencia_caraA.png?' + new Date().getTime();
		var img = $("<img />").attr('src',url)
		.attr('id',"testimage")		
	    .attr('onerror',"add_image_to_form('imagenc',0)")
		.on('load', function() {
	        if (!this.complete) {
	            alert('broken image!');
	            add_image_to_form("imagenc",0);
	        } else {
	        	add_image_to_form("imagenc",1);
	        	img.width(300).height(300);
	        	$("#LicenciaA").empty();
	            $("#LicenciaA").append(img);
	            var  img_validation  = try_miracle("Licencia_caraA.png");
	            if(img_validation == "diferentes")
            	{	            	
	            	img.width(300).height(300);
		            $("#LicenciaA").append(img);
            	}
	        }
	    });		
	}
	
	function imagen_d()
	{		
		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+Ipprivate+'/Licencia_caraB.png?' + new Date().getTime();
		var img = $("<img />").attr('src',url)
		.attr('id',"testimage")		
	    .attr('onerror',"add_image_to_form('imagend',0)")
		.on('load', function() {
	        if (!this.complete) {
	            alert('broken image!');
	            add_image_to_form("imagend",0);
	        } else {
	        	add_image_to_form("imagend",1);
	        	img.width(300).height(300);
	        	$("#LicenciaB").empty();
	            $("#LicenciaB").append(img);
	            var  img_validation  = try_miracle("Licencia_caraB.png");
	            if(img_validation == "diferentes")
            	{	            	
	            	img.width(300).height(300);
		            $("#LicenciaB").append(img);
            	}
	        }
	    });		
	}
	
	function imagen_e()
	{		
		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+Ipprivate+'/Tarjeta_credito.png?' + new Date().getTime();
		var img = $("<img />").attr('src',url)
		.attr('id',"testimage")		
	    .attr('onerror',"add_image_to_form('imagend',0)")
		.on('load', function() {
	        if (!this.complete) {
	            alert('broken image!');
	            add_image_to_form("imagene",0);
	        } else {
	        	add_image_to_form("imagene",1);
	        	img.width(300).height(300);
	        	$("#Tcredito").empty();
	            $("#Tcredito").append(img);
	            var  img_validation  = try_miracle("Tarjeta_credito.png");
	            if(img_validation == "diferentes")
            	{	            	
	            	img.width(300).height(300);
		            $("#Tcredito").append(img);
            	}
	        }
	    });		
	}
	
	function imagen_f()
	{		
		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+Ipprivate+'/Consignacion.png?' + new Date().getTime();
		var img = $("<img />").attr('src',url)
		.attr('id',"testimage")		
	    .attr('onerror',"add_image_to_form('imagenf',0)")
		.on('load', function() {
	        if (!this.complete) {
	            alert('broken image!');
	    
	        } else {
	        	add_image_to_form("imagenf",1);
	        	img.width(300).height(300);
	        	$("#Consignacion").empty();
	            $("#Consignacion").append(img);
	            var  img_validation  = try_miracle("Consignacion.png");
	            if(img_validation == "diferentes")
            	{	            	
	            	img.width(300).height(300);
		            $("#Consignacion").append(img);
            	}
	        }
	    });		
	}
	
	function imagen_g()
	{		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+Ipprivate+'/Tarh_frontal.png?' + new Date().getTime();
		var img = $("<img />").attr('src',url)
		.attr('id',"testimage")		
	    .attr('onerror',"add_image_to_form('imageng',0)")
		.on('load', function() {
	        if (!this.complete) {
	            alert('broken image!');
	    
	        } else {
	        	add_image_to_form("imageng",1);
	        	img.width(300).height(300);
	        	$("#Tarh_frontal").empty();
	            $("#Tarh_frontal").append(img);
	            var  img_validation  = try_miracle("Tarh_frontal.png");
	            if(img_validation == "diferentes")
            	{	            	
	            	img.width(300).height(300);
		            $("#Tarh_frontal").append(img);
            	}
	        }
	    });		
	}
	
	function imagen_h()
	{		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+Ipprivate+'/Tarh_trasera.png?' + new Date().getTime();
		var img = $("<img />").attr('src',url)
		.attr('id',"testimage")		
	    .attr('onerror',"add_image_to_form('imagenh',0)")
		.on('load', function() {
	        if (!this.complete) {
	            alert('broken image!');
	    
	        } else {
	        	add_image_to_form("imagenh",1);
	        	img.width(300).height(300);
	        	$("#Tarh_trasera").empty();
	            $("#Tarh_trasera").append(img);
	            var  img_validation  = try_miracle("Tarh_trasera.png");
	            if(img_validation == "diferentes")
            	{	            	
	            	img.width(300).height(300);
		            $("#Tarh_frontal").append(img);
            	}
	        }
	    });		
	}

	
	function try_miracle(Fname)
	{
		$.post("http://app.aoacolombia.com/Control/operativo/controllers/RecepcionController.php",{img_session:1,filename:Fname,priip:Ipprivate}, function(res, sta){
			 //console.log(res);
			 if(get64 == "")
			 {
				 get64 = res;
				 console.log("diferentes");
				 return "iguales";
			 }
			 else{
				 if(get64==res && get64 != "none")
				 {
					console.log("iguales"); 
				 	return "iguales";
				 }
				 else{
					 console.log("diferentes");
					 return "diferentes";
				 }
			 }
		 });
	}	
	
	
	function move_images_service()
	{
		$.post("http://app.aoacolombia.com/Control/operativo/controllers/RecepcionController.php",
				{img_move:1,siniestro:"${Siniestroid}",
			     priip:Ipprivate,
			     Auid:"${AutorizacionId}",
			     imagena:$("#imagena").val(),
			     imagenb:$("#imagenb").val(),
			     imagenc:$("#imagenc").val(),
			     imagend:$("#imagend").val(),
			     imagene:$("#imagene").val(),
			     imagenf:$("#imagenf").val(),
			     imageng:$("#imageng").val(),
			     imagenh:$("#imagenh").val()},
				function(res, sta){
			     	 if($("#imagena").val() == ""){
			    		return alert("Falta la imagen de la cedula frontal");
			    	 }
			    	 if($("#imagenb").val() == ""){
			    		 return alert("Falta la imagen de la cedula respaldo");
			    	 }
			    	 if($("#imagenc").val() == ""){
			    		 return alert("Falta la imagen de la licencia de conducir frontal");
			    	 }
			    	 if($("#imagend").val() == ""){
			    		 return alert("Falta la imagen de la licencia de conducir respaldo");
			    	 }
			    	 
			    	 <!--<c:if test="${ img_consignacion == 1 }">-->
				    	 //if($("#imagenf").val() == ""){
				    	 //return	 alert("Falta la imagen de la consignación");
				    	 //}
		    	 	 <!--</c:if>-->
		    	 	
		    	 	<c:if test="${ img_credito == 1 }">
		    	 		if($("#imagene").val() == ""){
				    	 	return	 alert("Falta la imagen de la tarjeta");
				    	 }
		    	 	</c:if>
		    	 	
		    	 	
		    	 	<c:if test="${ active_tarh == 1 }">
		    	 	if($("#imageng").val() == ""){
			    	 	return	 alert("Falta la imagen frontal de la cedula del tarjetahaviente");
			    	 }
		    	 	if($("#imagenh").val() == ""){
			    	 	return	 alert("Falta la imagen trasera de la cedula del tarjetahaviente");
			    	 }
		    	 	</c:if>
		    	 	 
		    	 	return finish_process_success();
		    	 	 
			     });
		
	}
	
	function finish_process()
	{
		confirm("¿Desea interrumpir el proceso de recepcion?, todo progreso adelantado sera guardado en el sistema");
		window.location.href = '/app/IngresoGarantia';  
	}
	
	function finish_process_success()
	{
		alert("proceso finalizado");
		window.location.href = '/app/Procesofinalizado';  
	}

</script>
