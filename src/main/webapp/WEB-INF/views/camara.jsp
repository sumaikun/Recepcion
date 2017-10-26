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
						<video id="video"></video>	
					</div>
					<div id="canvas_div" class="col-lg-6 col-md-6 col-sm-6">
						<canvas id="canvas"></canvas>	
					</div>					
                     <span id="text_foto" class="skills"><font color="#424242">¡Vamos a tomarnos una foto!</font></span>
                     <br>
                 	 <button id="snap_pic"  class="btn btn-primary btn-outline btn-lg" onclick="snap();"><span class="skills">TOMAR FOTO</span></button>
                 	 <button style="display:none;" id="show_button"  class="btn btn-success btn-outline btn-lg" onclick="send_form();"><span class="skills">Siguiente</span></button>	
                 	
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

	navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.oGetUserMedia || navigator.msGetUserMedia;

	if(navigator.getUserMedia){
		navigator.getUserMedia({video:true}, streamWebCam, throwError);
	}

	function streamWebCam (stream) {
		video.src = window.URL.createObjectURL(stream);
		video.play();
		$("html, body").animate({ scrollTop:  175.75}, 600);
	}

	function throwError (e) {
		alert(e.name);
	}

	function snap () {
		canvas.width = video.clientWidth;
		canvas.height = video.clientHeight;
		context.drawImage(video, 0, 0);
		$('#show_button').show();
		$("html, body").animate({ scrollTop:  225.75}, 600);
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
        formData.append('image', file, "FotoArribo");
        formData.append('idsiniestro', "${id_siniestro}");        
		$.ajax({			 
			  url: "http://app.aoacolombia.com/Control/operativo/controllers/RecepcionController.php",
			  data: formData,
			  processData : false,
              contentType : false,
              type : 'POST',
              success : function(data) {
                  //alert(data);
                  alert("Imagen subida con exito");
                  $.post("set_photo_url",{"${_csrf.parameterName}":"${_csrf.token}"}, function(data){
                	  window.location.href = 'personalForm';
                  });
              },
              error : function(err) {
                  //alert(err);
              }
			 
			});
		
	}
	
	function send_form()
	{
		php_post_file_service();
		//
	}

</script>   
