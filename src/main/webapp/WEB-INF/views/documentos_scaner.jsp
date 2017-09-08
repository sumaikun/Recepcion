<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
	             	<div class="col-lg-4 col-md-4 " id="cedulaA"><img  src="http://app.aoacolombia.com/Control/operativo/${foto_cedulaA}" alt="Smiley face" height="300" width="300"></div>
	             	<div class="col-lg-4 col-md-4 " id="cedulaB"><img  src="http://app.aoacolombia.com/Control/operativo/${foto_cedulaB}" alt="Smiley face" height="300" width="300"></div>
	           	 	<div class="col-lg-4 col-md-4 " id="LicenciaA"><img  src="http://app.aoacolombia.com/Control/operativo/${foto_paseA}" alt="Smiley face" height="300" width="300"></div>         	 	
         	 </div>	
         	 
             <div class="row" >
             	 
	             	<div class="col-lg-4 col-md-4"><a href="CedulaCaraA:"><button onmouseover="beginsearch()" class="btn btn-primary btn-lg">Cedula parte adelante</button></a></div>	           	 
	           	 	<div class="col-lg-4 col-md-4"><a href="CedulaCaraB:"><button onmouseover="beginsearch2()" class="btn btn-primary btn-lg">Cedula respaldo</button></a></div>
	           	 	<div class="col-lg-4 col-md-4"><a href="LicenciaCaraA:"><button onmouseover="beginsearch3()"  class="btn btn-primary btn-lg">Licencia conducir parte adelante</button></a></div>
         	 	
         	 </div>
         	 <br>
         	 <div class="row" >
	             
	             	<div class="col-lg-4 col-md-4 " id="LicenciaB"><img src="http://app.aoacolombia.com/Control/operativo/${foto_paseB}"  alt="Smiley face" height="300" width="300"></div>	           	 
         	 	 	<c:if test="${ img_credito != null }">
         	 	 	<div class="col-lg-4 col-md-4 " id="Tcredito"><img  alt="Smiley face" height="300" width="300"></div>
	              	</c:if>
	              	<c:if test="${ img_consignacion != null }">
	              	<div class="col-lg-4 col-md-4 " id="Consignacion"><img src="http://app.aoacolombia.com/Control/operativo/${consignacion_img}"  alt="Smiley face" height="300" width="300"></div>
	             	</c:if>
         	 </div>	
         	 
             <div class="row" >
	              
	             	<div class="col-lg-4 col-md-4"><a href="LicenciaCaraB:"><button onmouseover="beginsearch4()" class="btn btn-primary btn-lg">Licencia de conducir respaldo</button></a></div>
	              	<c:if test="${ img_credito != null }">
	              	<div class="col-lg-4 col-md-4"><a href="Credito:"><button onmouseover="beginsearch5()" class="btn btn-primary btn-lg">Tarjeta de credito (frontal)</button></a></div>
	              	</c:if>	              	
	              	<c:if test="${ img_consignacion != null }">
	              	<div class="col-lg-4 col-md-4"><a href="Consignacion:"><button onmouseover="beginsearch6()" class="btn btn-primary btn-lg">Consignación realizada</button></a></div>
	              	</c:if>           	 
         	 </div>
         	 	
         </div>
         <br>
         <br>
         <input type="hidden" name="imagena" id="imagena">
         <input type="hidden" name="imagenb" id="imagenb">
         <input type="hidden" name="imagenc" id="imagenc">
         <input type="hidden" name="imagend" id="imagend">
         <input type="hidden" name="imagenf" id="imagenf">
         <button onclick="move_images_service()" style="height:200%; !important" class="btn btn-lg form-control btn-success">Enviar Imagenes</button>
         <br>
         <br>
         <button style="height:200%; !important" class="btn btn-lg form-control btn-danger">Terminar</button>
     </div>
</header>
  
<script>

	$(document).ready(function() {
		$.post("http://app.aoacolombia.com/Control/operativo/controllers/RecepcionController.php",
				{delete_all:1,priip:"${Privateip}"},
			function(res, sta){			
		});
	});

	var n = 0;
	
	var z = 0;
	
	var x = 0;
	
	var c = 0;
	
	var v = 0;
	
	var get64 = "";

	window.setInterval(function(){
		if(n!=0)
		{
			imagen_a();
		}
		if(z!=0)
		{
			imagen_b();
		}
		if(x!=0)
		{
			imagen_c();
		}
		if(c!=0)
		{
			imagen_d();
		}
		if(v!=0)
		{
			imagen_f();
		}
	}, 5000);
	
	function beginsearch()
	{
		console.log("in");
		n=1;
	}
	
	function beginsearch2()
	{
		console.log("in");
		z=1;
	}
	
	function beginsearch3()
	{
		console.log("in");
		x=1;
	}
	
	function beginsearch4()
	{
		console.log("in");
		c=1;
	}
	
	function beginsearch6()
	{
		console.log("in");
		v=1;
	}
    
		
	function imagen_a()
	{		
		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+"${Privateip}"+'/Cedula_caraA.png?' + new Date().getTime();
		var img = $("<img />").attr('src',url)
		.attr('id',"testimage")
		.attr('onerror',"add_image_to_form('imagena',0)")
	    .on('load', function() {
	        if (!this.complete) {
	            alert('broken image!');	            
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
		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+"${Privateip}"+'/Cedula_caraB.png?' + new Date().getTime();
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
		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+"${Privateip}"+'/Licencia_caraA.png?' + new Date().getTime();
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
		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+"${Privateip}"+'/Licencia_caraB.png?' + new Date().getTime();
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
	
	function imagen_f()
	{		
		
		var url = 'http://app.aoacolombia.com/Administrativo/images_java/'+"${Privateip}"+'/Consignacion.png?' + new Date().getTime();
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

	
	function try_miracle(Fname)
	{
		$.post("http://app.aoacolombia.com/Control/operativo/controllers/RecepcionController.php",{img_session:1,filename:Fname,priip:"${Privateip}"}, function(res, sta){
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
	
	function add_image_to_form(imageid,value)
	{
		$("#"+imageid).val(value);
	}
	
	function move_images_service()
	{
		$.post("http://app.aoacolombia.com/Control/operativo/controllers/RecepcionController.php",
				{img_move:1,siniestro:"${Siniestroid}",
			     priip:"${Privateip}",
			     Auid:"${AutorizacionId}",
			     imagena:$("#imagena").val(),
			     imagenb:$("#imagenb").val(),
			     imagenc:$("#imagenc").val(),
			     imagend:$("#imagend").val(),
			     imagenf:$("#imagenf").val()},
				function(res, sta){});
	}

</script>
