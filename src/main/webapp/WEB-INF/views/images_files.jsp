<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 
<script>
window.onload = function() {
    var canvas = document.getElementById("canvas");
    var context = canvas.getContext("2d");
    var imageObj = new Image();

    imageObj.onload = function() {
      context.drawImage(imageObj, 69, 50);
    };
    //imageObj.src = "file://C:\Users\JVega\Desktop\Imagenes_recepcion\Cedula_caraA.jpg";
    window.location.href = "file://../../../Desktop/Imagenes_recepcion/Cedula_caraA.jpg"
  };

</script>
  
<style>
	#home{
		background-color: white;	
   		background-image: url("http://localhost:8080<c:url value="/resources/theme1/images/LogoAoa.png" />")	;	
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
                  	
					<div id="canvas_div" class="col-lg-6 col-md-6 col-sm-6">
						<canvas id="canvas"></canvas>	
					</div>
				
                 </div>
             </div>
         </div>
     </div>
</header> 
<button onclick="php_post_file_service()" class="btn btn-warning">Test servicio web con imagen</button>

		
<script type="text/javascript">
	var video = document.getElementById('video');
	var canvas = document.getElementById('canvas');
	var context = canvas.getContext('2d');

	navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.oGetUserMedia || navigator.msGetUserMedia;



	function snap () {
		canvas.width = video.clientWidth;
		canvas.height = video.clientHeight;
		context.drawImage(video, 0, 0);
		$('#show_button').show();
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
