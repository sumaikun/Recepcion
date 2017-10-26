<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


  
<style>
	#home{
		background-color: white;	
   		background-image: url("http://localhost:8080<c:url value="/resources/theme1/images/LogoAoa.png" />")	;	
		background-size: 95% 85%;
    	background-repeat: no-repeat;
    	background-repeat:no-repeatdisplay: compact;
    	background-position:center 75px;
    	background-attachment: fixed;
	}
	
	input[type=text] {
    background-color: #3CBC8D;
    color: white;
	}
	
	input[type=number] {
    background-color: #084B8A;
    color: white;
	}
	
	select {
	background-color: #045FB4;
    color: white;
	}
	
	label {
	 background-color: #2E2EFE !important;
	 color: black !important;
	 
	}	
</style>
<br>
<br>
<header id="home">
	 <div class="container">
         <div class="row">
             <div class="col-lg-12">             	                 
                 <div class="intro-text">
                     <div id="video_div" class="col-lg-6 col-md-6 col-sm-6">
						<video id="video" autoplay="autoplay"></video>	
					</div>
					<div id="canvas_div" class="col-lg-6 col-md-6 col-sm-6">
						<canvas id="canvas"></canvas>	
					</div>
					<div id="former" style="display:none;" class="col-lg-12 col-md-12 col-sm-12">
						<form:form id="Client_form" action="create_customer_data?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">					
							<div class="form-group">
								<label class="form-control">Numero de identificación</label>
								<input type="number" name="identificacion" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-control">Lugar de expedición</label>
								<input type="text" name="lugar_expedicion" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-control">Nombres</label>
								<input type="text" name="nombres" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-control">Apellidos</label>
								<input type="text" name="apellidos" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-control">Tipo de identificación</label>
								<select class="form-control" name="tipo_identificacion">
									<option value="">Seleccione una opción</option>
									<option value="CC">CEDULA DE CIUDADANIA</option>
									<option value="CE">CEDULA DE EXTRANJERIA</option>
									<option value="NIT">NIT</option>
									<option value="PAS">PASAPORTE</option>
									<option value="TI">TARJETA DE IDENTIDAD</option>
								</select>
							</div>
							<div class="form-group">
								<label class="form-control">Sexo</label>
								<select class="form-control" name="sexo">
									<option value="">Selecciona</option>
									<option value="M">Masculino</option>
									<option value="F">Femenino</option>
								</select>
							</div>
							<div class="form-group">
								<label class="form-control">Pais</label>
								<input type="text" class="form-control" name="pais">
							</div>
							<div class="form-group">
								<label class="form-control">Ciudad domicilio</label>
								<input type="number" class="form-control" name="ciudad">
							</div>
							<div class="form-group">
								<label class="form-control">Dirección domicilio</label>
								<input type="text" class="form-control" name="dir_domicilio">
							</div>
							<div class="form-group">
								<label class="form-control">Barrio</label>
								<input type="text" class="form-control" name="barrio">
							</div>
							<div class="form-group">
								<label class="form-control">Tel. oficina</label>
								<input type="number" class="form-control" name="tel_oficina">
							</div>
							<div class="form-group">
								<label class="form-control">Tel. vivienda</label>
								<input type="number" class="form-control" name="tel_vivienda">
							</div>
							<div class="form-group">
								<label class="form-control">Celular</label>
								<input type="number" class="form-control" name="celular">
							</div>
							<div class="form-group">
								<label class="form-control">Email</label>
								<input type="email" class="form-control" name="correo">
							</div>
						</form:form>
					</div>
                     <span id="text_foto" class="skills"><font color="#424242">¡Vamos a tomarnos una foto!</font></span>
                     <br>
                 	 <button id="snap_pic"  class="btn btn-primary btn-outline btn-lg" onclick="snap();"><span class="skills">TOMAR FOTO</span></button>
                 	 <button style="display:none;" id="show_button"  class="btn btn-success btn-outline btn-lg" onclick="show_form();"><span class="skills">Siguiente</span></button>	
                 	 <button style="display:none;" id="send_button"  class="btn btn-success btn-outline btn-lg" onclick="send_form();"><span class="skills">Enviar</span></button>	
                 </div>
                 
             </div>
         </div>
     </div>
</header> 

<!--  <button onclick="php_post_file_service()" class="btn btn-warning">Test servicio web con imagen</button>-->
<!--  
<form:form id="upload-file-form" action="ajaxtest.html?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
   <label for="upload-file-input">Upload your file:</label>
   <input id="upload-file-input" type="file" name="image" accept="*" />   
   <input type="submit" value="Probar" />
</form:form>
-->		
		
<script type="text/javascript">
	var video = document.getElementById('video');
	var canvas = document.getElementById('canvas');
	var context = canvas.getContext('2d');
	var videoStream = null;
	var preLog = document.getElementById('preLog');

	function log(text)
	{
		if (preLog) preLog.textContent += ('\n' + text);
		else alert(text);
	}
	
	function start()
	{
		if ((typeof window === 'undefined') || (typeof navigator === 'undefined')) log('This page needs a Web browser with the objects window.* and navigator.*!');
		else if (!(video && canvas)) log('HTML context error!');
		else
		{
			log('Get user media');
			if (navigator.getUserMedia) navigator.getUserMedia({video:true}, gotStream, noStream);
			else if (navigator.oGetUserMedia) navigator.oGetUserMedia({video:true}, gotStream, noStream);
			else if (navigator.mozGetUserMedia) navigator.mozGetUserMedia({video:true}, gotStream, noStream);
			else if (navigator.webkitGetUserMedia) navigator.webkitGetUserMedia({video:true}, gotStream, noStream);
			else if (navigator.msGetUserMedia) navigator.msGetUserMedia({video:true, audio:false}, gotStream, noStream);
			else log('getUserMedia() not available from your Web browser!');
		}
	}

	start();
	
	function stop()
	{
		/*var myButton = document.getElementById('buttonStop');
		if (myButton) myButton.disabled = true;
		myButton = document.getElementById('buttonSnap');
		if (myButton) myButton.disabled = true;*/
		if (videoStream)
		{
			if (videoStream.stop) videoStream.stop();
			else if (videoStream.msStop) videoStream.msStop();
			videoStream.onended = null;
			videoStream = null;
		}
		if (video)
		{
			video.onerror = null;
			video.pause();
			if (video.mozSrcObject)
				video.mozSrcObject = null;
			video.src = "";
		}
		/*myButton = document.getElementById('buttonStart');
		if (myButton) myButton.disabled = false;*/
	}

	//navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.oGetUserMedia || navigator.msGetUserMedia;

	/*if(navigator.getUserMedia){
		navigator.getUserMedia({video:true}, streamWebCam, throwError);
	}*/

	function gotStream(stream)
	{
		//var myButton = document.getElementById('buttonStart');
		//if (myButton) myButton.disabled = true;
		videoStream = stream;
		log('Got stream.');
		video.onerror = function ()
		{
			log('video.onerror');
			if (video) stop();
		};
		stream.onended = noStream;
		if (window.webkitURL) video.src = window.webkitURL.createObjectURL(stream);
		else if (video.mozSrcObject !== undefined)
		{//FF18a
			video.mozSrcObject = stream;
			video.play();
		}
		else if (navigator.mozGetUserMedia)
		{//FF16a, 17a
			video.src = stream;
			video.play();
		}
		else if (window.URL) video.src = window.URL.createObjectURL(stream);
		else video.src = stream;
		/*myButton = document.getElementById('buttonSnap');
		if (myButton) myButton.disabled = false;
		myButton = document.getElementById('buttonStop');
		if (myButton) myButton.disabled = false;*/
	}
	
	function noStream()
	{
		log('Access to camera was denied!');
	}

	function throwError (e) {
		alert(e.name);
	}

	function snap () {
		canvas.width = video.clientWidth;
		canvas.height = video.clientHeight;
		context.drawImage(video, 0, 0);
		$('#show_button').show();
	}
	
	function show_form()
	{
		$("#text_foto").hide();
		$("#video_div").hide();
		$("#canvas_div").hide();
		$('#show_button').hide();
		$('#snap_pic').hide();
		$('#former').show();
		$('#send_button').show();
	}

	function send_data(){
		var dataURL = canvas.toDataURL("image/png");
		var blobBin = atob(dataURL.split(',')[1]);
		var array = [];
		for(var i = 0; i < blobBin.length; i++) {
		    array.push(blobBin.charCodeAt(i));
		}
		var file=new Blob([new Uint8Array(array)], {type: 'image/png'});
		
		var formData = new FormData();
        formData.append('image', file, "FotoArribo.png");
		$.ajax({			 
			  url: "ajaxtest?${_csrf.parameterName}=${_csrf.token}",
			  data: formData,
			  processData : false,
              contentType : false,
              type : 'POST',
              success : function(data) {
                  alert(data);
              },
              error : function(err) {
                  alert(err);
              }
			 
			});
		//$.post("ajaxtest",{testpostdata:"postdata",${_csrf.parameterName}:"${_csrf.token}"}, function(data){});
	}
	
	function php_post_file_service()
	{
		var dataURL = canvas.toDataURL("image/png");
		var blobBin = atob(dataURL.split(',')[1]);
		var array = [];
		for(var i = 0; i < blobBin.length; i++) {
		    array.push(blobBin.charCodeAt(i));
		}
		var file=new Blob([new Uint8Array(array)], {type: 'image/png'});
		
		var formData = new FormData();
        formData.append('image', file, "FotoArribo.png");
        formData.append('idsiniestro', 1316868);
		$.ajax({			 
			  url: "http://app.aoacolombia.com/Control/operativo/controllers/RecepcionController.php",
			  data: formData,
			  processData : false,
              contentType : false,
              type : 'POST',
              success : function(data) {
                  alert(data);
              },
              error : function(err) {
                  alert(err);
              }
			 
			});
		
	}
	
	function send_form()
	{
		php_post_file_service();
		document.getElementById("Client_form").submit();
	}

</script>   