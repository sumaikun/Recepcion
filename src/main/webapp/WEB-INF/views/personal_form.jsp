<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<style>
	.modal{
   	overflow:auto !important;
	}
	#home{
		background-color: white;	
   		background-image: url("<c:url value="/resources/theme1/images/LogoAoa.png" />")	;	
		background-size: 95% 85%;
    	background-repeat: no-repeat;
    	background-repeat:no-repeatdisplay: compact;
    	background-position:center 75px;
    	background-attachment: fixed;
	}
	
	.ui-keyboard {
    text-align: center;
    padding: .5em;
    position: absolute;
    /* left: 0; */
    /* top: 0; */
    /* z-index: 16000; */
    -ms-touch-action: manipulation;
    touch-action: manipulation;
  }
	
	.ui-keyboard-button {
    height: 3.5em;
    min-width: 4em;
    margin: .1em;
    cursor: pointer;
    overflow: hidden;
    line-height: 2em;
    -moz-user-focus: ignore;
	}
	
	#formbutton{
		display:none;
	}
	
	input::-webkit-calendar-picker-indicator {
	  display: none;/* remove default arrow */
	}
	
	.myarrow:after {
	    content: url(http://s25.postimg.org/6k40u5hcr/arrow.png);
	    margin-left: -20px; 
	    padding: .1em;
	    pointer-events:none;
	}
	
	.qid:hover{
		background-color: yellow;
	}
	
	html {
	  height: 100%;
	}
	
	body {
	  min-height: 100%;
	}
	
</style> 
  
<link href="<c:url value="/resources/theme1/css/specialform.css"/> " rel="stylesheet">
<br>
<br>
 
<header id="home">
	 <div class="container">
         <div class="row">
             <div class="col-lg-12" style="margin-top:15% !important;">             	                 
                 <div class="intro-text">
                    
					<div id="former"  class="col-lg-12 col-md-12 col-sm-12">
					
						<div class="container-fluid bg-info" style="background: rgba(0,0,0,0);">
						    <div class="modal-dialog">
						      <div class="modal-content" >
						         <div class="modal-header">
						         	<span style="color:black; text-align: justify; margin-top:-2em !important;"><b>Los datos marcados con * son obligatorios</b></span>						            
						        </div>
						        <div class="modal-body" >
							          <div class="col-xs-3 col-xs-offset-5">
							               <div id="loadbar" style="display: none;">
							                  <div class="blockG" id="rotateG_01"></div>
							                  <div class="blockG" id="rotateG_02"></div>
							                  <div class="blockG" id="rotateG_03"></div>
							                  <div class="blockG" id="rotateG_04"></div>
							                  <div class="blockG" id="rotateG_05"></div>
							                  <div class="blockG" id="rotateG_06"></div>
							                  <div class="blockG" id="rotateG_07"></div>
							                  <div class="blockG" id="rotateG_08"></div>
							              </div>
							          </div>
						        	<div id="formcontent-2">
						        			<h3 style="color:black !important;">¡Vamos a verificar tus datos!</h3>
							       	  	  	<div class="form-group">
												<label class="form-control" onclick="asistant_focus('validate-identificacion')">*Ingrese su cedula</label>
												<input type="number" name="validate-identificacion" class="form-control num">												
											</div>
											<div class="form-group">
												<button class="btn btn-primary form-control" onclick="validate_cedula()">Consultar</button>
											</div>							       	  	  
							          </div>
							          <div id="formcontent-1" style="display:none;">
						        			<h3 style="color:black !important;" id="welcome-message">¡Bienvenido!</h3>
							       	  	  	
							       	  	  	<div class="form-group">
												<button class="btn btn-danger form-control" onclick="update_data()">Actualizar mis datos</button>
											</div>
											<div class="form-group">
												<button class="btn btn-success form-control" onclick="go_to_docs()">Continuar mi proceso</button>
											</div>								       	  	  
							          </div>
						        	<form:form action="create_customer_data"  method="post" id="Client_form" >   								 
						          <div class="quiz" id="quiz" data-toggle="buttons">						          
							       	 					 						       	
						       	  	  <div id="formcontent0" style="display:none;">						       	  	  	
							       	  	  	<div class="form-group">
							       	  	  	
												<label class="form-control" onclick="asistant_focus('tipo_identificacion')">*Tipo de identificación</label>
												<select class="form-control" name="tipo_identificacion" required>
													<option value="">Seleccione una opción</option>
													<option value="CC">CEDULA DE CIUDADANIA</option>
													<option value="CE">CEDULA DE EXTRANJERIA</option>
													<option value="NIT">NIT</option>
													<option value="PAS">PASAPORTE</option>
													<option value="TI">TARJETA DE IDENTIDAD</option>
												</select>
											</div>
							       	  	  	<div class="form-group">
												<label class="form-control" onclick="asistant_focus('identificacion')">*Numero de identificación</label>
												<input type="number" name="identificacion" class="form-control num" required>
											</div>
											<div class="form-group">
												<label class="form-control" onclick="asistant_focus('lugar_expedicion')">*Lugar de expedición</label>
												<input type="text" name="lugar_expedicion" class="form-control keyboard" required>
											</div>
							          </div>
						       	  	  <div id="formcontent1" style="display:none;">
							          		<div class="form-group">
												<label class="form-control" onclick="asistant_focus('sexo')">*Genero</label>
												<select class="form-control"  name="sexo" required>
													<option value="">Selecciona</option>
													<option value="M">Masculino</option>
													<option value="F">Femenino</option>
												</select>
											</div>
											<div class="form-group">
												<label class="form-control" onclick="asistant_focus('nombres')">*Nombres</label>
												<input type="text" name="nombres" class="form-control keyboard" required>
											</div>
											<div class="form-group">
												<label class="form-control" onclick="asistant_focus('apellidos')">*Apellidos</label>
												<input type="text" name="apellidos" class="form-control keyboard" required>
											</div>
							          </div>
						       	  	  <div id="formcontent2" style="display:none;">
						       	  	  		<div class="form-group">
												<label class="form-control" onclick="asistant_focus('departamento')">*Departamento</label>
												<select  class="form-control" name="departamento" required>
													<option>Selecciona</option>
													<c:forEach items="${listdepartamentos}" var="departamento">			
														<option value="${departamento}">${departamento}</option>							
													</c:forEach>
												</select>
											</div>
						       	  	  		<div class="form-group">
												<label class="form-control" onclick="open_modal('myModalCiudad')" >*Ciudad domicilio</label>
												<div class="input-group">
													<input class="form-control" id="ciudad" onclick="open_modal('myModalCiudad')"  name="ciudad" list="ciudades" disabled required>												
													<span class="input-group-btn">
													<button  onclick="open_modal('myModalCiudad')" id="btn-ciudad" class="btn btn-primary" disabled>Selecciona</button>
													</span>
												</div>        
												<input type="hidden" name="codigo_ciudad" value="none">
											</div>
											<div class="form-group">
												<label class="form-control" onclick="asistant_focus('dir_domicilio')">*Dirección domicilio</label>
												<!--<input type="text" class="form-control" onclick="open_modal('myModalDireccion')"  name="dir_domicilio" required>-->
												<input type="text" class="form-control colombian-address"   name="dir_domicilio" required>
											</div>
											<div class="form-group">
												<label class="form-control" onclick="asistant_focus('barrio')">*Barrio</label>
												<input type="text" class="form-control keyboard" name="barrio" required>
											</div>
							          </div>
							          <div id="formcontent3" style="display:none;">
						       	  	  		<div class="form-group">
												<label class="form-control" onclick="asistant_focus('tel_oficina')">Tel. oficina</label>
												<input type="number" class="form-control num" name="tel_oficina">
											</div>
											<div class="form-group">
												<label class="form-control" onclick="asistant_focus('tel_vivienda')">Tel. vivienda</label>
												<input type="number" class="form-control num" name="tel_vivienda">
											</div>
											<div class="form-group">
												<label class="form-control" onclick="asistant_focus('celular')">*Celular</label>
												<input type="number" class="form-control num" name="celular" required>
											</div>
											<div class="form-group">
												<label class="form-control" onclick="asistant_focus('correo')">*Email</label>
												<input type="email" class="form-control spanish-email" name="correo" required>
											</div>
											
							          </div>
							          	
						       	  </div>	
						       	  		<div class="form-group" style="height:0px; margin-top:-2em;">												
											<input type="submit" id="formbutton" class="btn btn-success" onclick="send_form()"  value="enviar y terminar">		
										</div>				       	   	
							       	 </form:form>						       	  
						   		</div>
								    <div class="modal-footer text-muted" style="text-align:center;">								    	
								    	<button onclick="form_pos_backward()" class="arrow" style="background: rgba(0,0,0,0); border:none;outline:none;display:none;"><h3><span class="label label-warning qid" >Anterior</span> </h3></button>
								    	<button onclick="form_pos_forward()" class="arrow"  style="background: rgba(0,0,0,0); border:none;outline:none;display:none;"><h3><span class="label label-warning qid" id="targetElement">Siguiente</span> </h3></button>							    	
										
									</div>
								</div>
							</div>
						</div>
					</div>
                     
                 	 
                 </div>
                 
             </div>
         </div>
     </div>
</header> 

<!-- Modal -->
<div id="myModal" class="modal fade" data-backdrop="static" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">      
      <div class="modal-body">
      	<br>
        <p style="text-align:center;">¿Es usted la persona titular del siniestro?</p>
        <p><i>La persona titular del siniestro es aquella que <b>NO</b> necesita una carta de autorización de parte del asegurado para hacer efectiva su garantia</i></p>
        <br>
        <br>
        <div style="text-align:center;">
        	<button data-dismiss="modal" style="width:95px !important; margin-right:25px;" onclick="inactive_tarh()" class="btn btn-lg btn-danger">Si</button>
        	<button onclick="open_modal('myModal4')"  data-dismiss="modal" style="width:95px !important; " class="btn btn-lg btn-primary">No</button>
        </div>
      </div>      
    </div>

  </div>
</div>

<!-- Modal -->
<div id="myModal2" class="modal fade" data-backdrop="static" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">      
      <div class="modal-body">
      	<br>
        <p style="text-align:center;">¿El asegurado vino con usted a hacer efectiva la garantia?</p>
        <p><i>De haber venido se le pedira una segunda foto correspondiente a usted o al asegurado de
        	acuerdo a quien se halla tomado una foto al inicio.</i></p>
        <br>
        <br>
        <div style="text-align:center;">
        	<button data-dismiss="modal" style="width:95px !important; margin-right:25px;" onclick="otro_ingreso_recepcion('myModal3')" class="btn btn-lg btn-danger">Si</button>
        	<button  data-dismiss="modal" style="width:95px !important; " class="btn btn-lg btn-primary">No</button>
        </div>
      </div>      
    </div>

  </div>
</div>

<div id="myModalPhoto" class="modal fade" data-backdrop="static" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">      
      <div class="modal-body">
      	<div style="text-align:center;"> 	
				<video id="video" style="width:50%;height:50%;"></video>	
		  
				<canvas id="canvas" style="width:70%;height:70%;"></canvas>				
           		<div class="row">
   					<div class="col-md-6 col-md-offset-3 text-center">
		            	<div style="max-width:500px;"> 
			            	<div class="form-group">
			            		 <label class="form-control text-center" onclick="asistant_focus('otro_rec_nombre')">NOMBRES:</label>
			            		<input type="text" name="otro_rec_nombre" class="form-control text-center keyboard">
			            	</div>
			            	<div class="form-group">
			            		 <label class="form-control text-center" onclick="asistant_focus('otro_rec_apellido')">APELLIDOS:</label>
			            		<input type="text" name="otro_rec_apellido" class="form-control text-center keyboard">
			            	</div>
			            	<div class="form-group">
			            		 <label class="form-control text-center" onclick="asistant_focus('otro_rec_identificacion')">NÚMERO DE IDENTIFICACIÓN:</label>
			            		<input type="text" name="otro_rec_identificacion" class="form-control text-center num">
			            	</div>
			             </div>
			           </div>
			       </div>    	
             <br>
          	 <button id="snap_pic"  class="btn btn-primary btn-outline btn-lg" onclick="snap();"><span class="skills">TOMAR FOTO</span></button>            	
          
          </div>	
        </div>      
      </div>      
    </div>

  </div>
</div>

<script>
	
	function otro_ingreso_recepcion()
	{
		start_video();
		$("#myModalPhoto").modal("show");
	}

</script>


<script>

var video = document.getElementById('video');
var canvas = document.getElementById('canvas');
var context = canvas.getContext('2d');
var localstream = null;

$("#canvas").hide();

function start_video()
{
	navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.oGetUserMedia || navigator.msGetUserMedia;

	if(navigator.getUserMedia){
		navigator.getUserMedia({video:true}, streamWebCam, throwError);
	}
}

function streamWebCam (stream) {
	localstream = stream;
	video.src = window.URL.createObjectURL(stream);
	video.play();
	
}

function throwError (e) {
	alert(e.name);
}

function snap () {	
	
	if($("input[name='otro_rec_nombre']").val() == "" ||  $("input[name='otro_rec_apellido']").val() == "" || $("input[name='otro_rec_identificacion']").val() == "" )
	{
		alert("Ingrese todos los datos para proceder");
		return false;
	}

	
	if(video.clientWidth < 201)
	{
		return alert("¡Por favor Acceda a la camara para tomar la foto!");
	}
	canvas.width = video.clientWidth*2;		
	canvas.height = video.clientHeight*2;
	context.drawImage(video, 0, 0);
	
	//$("#video").hide();
	//$("#canvas").show();
	
	localstream.getVideoTracks()[0].stop();
	php_post_file_service();
}

function php_post_file_service()
{
	var dataURL = canvas.toDataURL("image/png");
	var blobBin = atob(dataURL.split(',')[1]);
	var array = [];
	
	//alert(blobBin.length);
	
	if(blobBin.length<1500)
	{
		return alert("¡Por favor tómese una foto para continuar!");
	}
	
	for(var i = 0; i < blobBin.length; i++) {
	    array.push(blobBin.charCodeAt(i));
	}
	
	//alert(blobBin.length);
	
	var file=new Blob([new Uint8Array(array)], {type: 'image/png'});
	
	var formData = new FormData();
    formData.append('image', file, "FotoArribo");
    formData.append('idsiniestro', "${id_siniestro}");
    formData.append('otro_rec_nombre',$("input[name='otro_rec_nombre']").val());
    formData.append('otro_rec_apellido', $("input[name='otro_rec_apellido']").val());
    formData.append('otro_rec_identificacion', $("input[name='otro_rec_identificacion']").val());
    formData.append('otro_ingreso_recepcion', "1"); 
	$.ajax({			 
		  url: "http://app.aoacolombia.com/Control/operativo/controllers/RecepcionController.php",
		  data: formData,
		  processData : false,
          contentType : false,
          type : 'POST',
          success : function(data) {
              //alert(data);
              alert("Imagen subida con exito");
              $("#myModalPhoto").modal("hide");
             
          },
          error : function(err) {
              //alert(err);
          }
		 
		});
	
}


</script>


<!-- Modal -->
<div id="myModal4" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">      
      <div class="modal-body">
      	<br>
        <p style="text-align:center;">Si no se es titular de la gantaria necesita :</p>
        <ul>
        	<li>Los datos del asegurado.</li>
        	<li>Los datos del tarjetahabiente incluyendo su cedula</li>
        	<li>Tomarse una foto adicional que seria </li>         	
        </ul>
        <p style="text-align:center;">La información suministrada sera la utlizada durante este proceso.</p>
        <br>
        <br>
        <p style="text-align:center;">¿Desea continuar con este proceso?</p>
        <div style="text-align:center;">
        	<button data-dismiss="modal" data-dismiss="modal" onclick="open_modal('myModal')"   class="btn btn-lg btn-primary">No,Volver</button>
        	<button data-dismiss="modal" onclick="active_tarh()"  class="btn btn-lg btn-danger">Si,Continuar</button>        	
        </div>
      </div>      
    </div>

  </div>
</div>

<div id="myModalCiudad" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">      
      <div class="modal-body">
      	<div id="table-ajax" >
      	
      	</div>      		
        <div style="text-align:center;">
        	<button data-dismiss="modal"  class="btn btn-lg btn-success btn-xs">Cerrar</button>        	
        </div>
      </div>      
    </div>

  </div>
</div>

<div id="myModalDireccion" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-title">Asistente de dirección </div>
    <!-- Modal content-->
    <div class="modal-content">      
      <div class="modal-body">
      	</h3>Dirección:<span id="generate_address"></span></h3>
      	<table class="table">
      		<thead>
	      		<tr>
	      			<th>Nomenclatura</th>
	      			<th>Nombre</th>
	      		</tr>
      		</thead>
      		<tbody>
      			<tr>
      				<td>AC</td>
      				<td><button onclick="generate_address('AC')">Avenida Calle</button></td>
      			</tr>
      			<tr>
      				<td>AP</td>
      				<td><button onclick="generate_address('AP')">Apartamento</button></td>
      			</tr>
      			<tr>
      				<td>AUT</td>
      				<td><button onclick="generate_address('AUT')">Autopista</button></td>
      			</tr>
      			<tr>
      				<td>AV</td>
      				<td><button onclick="generate_address('AV')">Avenida</button></td>
      			</tr>
      			<tr>
      				<td>BIS</td>
      				<td><button onclick="generate_address('BIS')">BIS</button></td>
      			</tr>
      			<tr>
      				<td>CA</td>
      				<td><button onclick="generate_address('CA')">Casa</button></td>
      			</tr>
      			<tr>
      				<td>CR</td>
      				<td><button onclick="generate_address('CR')">Carrera</button></td>
      			</tr>
      			<tr>
      				<td>DG</td>
      				<td><button onclick="generate_address('DG')">Diagonal</button></td>
      			</tr>
      			<tr>
      				<td>KM</td>
      				<td><button onclick="generate_address('KM')">Kilometro</button></td>
      			</tr>
      			<tr>
      				<td>TO</td>
      				<td><button onclick="generate_address('TO')">Torre</button></td>
      			</tr>
      			<tr>
      				<td>SUR</td>
      				<td><button onclick="generate_address('SUR')">SUR</button></td>
      			</tr>
      			<tr>
      				<td>VDA</td>
      				<td><button onclick="generate_address('VDA')">Vereda</button></td>
      			</tr>
      			<tr>
      				<td>#</td>
      				<td><button onclick="generate_address('#')">Número</button></td>
      			</tr>
      			<tr>
      				<td>-</td>
      				<td><button onclick="generate_address('-')">Con</button></td>
      			</tr>
      		</tbody>	
      	</table>
      	<button class="btn btn-warning" onclick="reset_address()">Dirección Reset</button>     		
        <br>        
        <div style="text-align:center;">
        	<button data-dismiss="modal"  class="btn btn-lg btn-success btn-xs">Cerrar</button>        	
        </div>
      </div>      
    </div>

  </div>
</div>


<div id="myModalDireccionDatos" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-title">Asistente de dirección </div>
    <!-- Modal content-->
    <div class="modal-content">      
      <div class="modal-body">     	 
        <div class="form-group"> 
        	<label class="form-control">Nombre o numero</label>
        	<input type="text" class="form-control keyboard" id="address_data">
        	<br>
        	<button class="btn btn-primary" onclick="add_to_address_data()">Agregar</button>
      	</div>
      </div>      
    </div>

  </div>
</div>





<script>

function open_modal(modal)
{
	$("#"+modal).modal("show");
}

function asistant_focus(name)
{
	$("input[name='"+name+"']").focus();	
}

function dian_dir()
{
	console.log("clicked");
	$("#myModalDireccion").modal("show");
}

var normal_address = [];

var dian_address = [];


function reset_address()
{
	normal_address = [];

	dian_address = [];

}

function generate_address(symbol)
{	
	size = normal_address.length; 
	console.log(size);
	if(size == 0)
	{		
		normal_address.push(symbol);
	}
	else
	{
		if(normal_address.includes(symbol))
		{
			return alert("Este simbolo ya fue incluido");
		}
		else
		{
			normal_address.push(symbol);
		}
	}
	
	$('#myModalDireccionDatos').modal({
	    backdrop: 'static',  
	    keyboard: true       
	});
	
	$('#myModalDireccion').modal("hide");
	$("#address_data").val("");
	$('#myModalDireccionDatos').modal("show");
	console.log(normal_address);
}

function add_to_address_data()
{
	var data = $("#address_data").val();
	normal_address.push(data);
	$('#myModalDireccionDatos').modal("hide");
	$('#myModalDireccion').modal("show");
	console.log(normal_address);
	generating_address();	
}

function generating_address()
{
	var result = "";
	var result2 = "";
	for(var i = 0; i<normal_address.length; i++)
	{
		result += normal_address[i]+" ";
		if(normal_address[i]!="#" && normal_address[i]!="-")
		{
			result2 += normal_address[i]+" ";
		}
	}
	$("#generate_address").html(result);
	$("input[name='dir_domicilio']").val(result2);
}

function reset_address()
{
	normal_address = [];

	dian_address = [];
	
	$("#generate_address").empty();
	
	$("input[name='dir_domicilio']").val("");
}

$('html,body').animate({ scrollTop: 9999 }, 'slow');

function validate_cedula()
{
	 if($("input[name='validate-identificacion']" ).val()!= "" & $("input[name='validate-identificacion']" ).val().length>=6)
	 { 
		$.post("get_user_info",{documento:$("input[name='validate-identificacion']" ).val(),"${_csrf.parameterName}":"${_csrf.token}"}, function(data){
			if(data!="")
				{					
					$.post("get_by_code",{codigo:data.ciudad,"${_csrf.parameterName}":"${_csrf.token}"},
							function(data){
						$("select[name='departamento']").val(data.departamento);
						$("input[name='ciudad']").val(data.nombre);
					});
					console.log("in");
					$("select[name='tipo_identificacion']").val(data.tipo_id);
					$("input[name='identificacion']").val(data.identificacion);
					$("input[name='lugar_expedicion']").val(data.lugar_expdoc);
					$("select[name='sexo']").val(data.sexo);
					$("input[name='nombres']").val(data.nombre);
					$("input[name='apellidos']").val(data.apellido);
					$("select[name='departamento']").val(data.departamento);
					$("input[name='codigo_ciudad']").val(data.ciudad);
					$("input[name='dir_domicilio']").val(data.direccion);
					$("input[name='barrio']").val(data.barrio);
					$("input[name='tel_oficina']").val(data.telefono_oficina);
					$("input[name='tel_vivienda']").val(data.telefono_casa);
					$("input[name='celular']").val(data.celular);
					$("input[name='correo']").val(data.email_e);
					
					$("#formcontent-2").hide();
					$("#formcontent-1").show();
					$("#welcome-message").html(" ¡Bienvenido! "+data.nombre+" "+data.apellido);
					$("#formcontent").show();
					$("input[name='identificacion']").attr('readonly', true);
					//$(".arrow").show();
				}
			else{
				alert("Bienvenido proceda a ingresar sus datos");
				$("input[name='identificacion']").val($("input[name='validate-identificacion']" ).val());
				$("#formcontent-2").hide();
				$("#formcontent0").show();
				$(".modal-footer").show();
				$(".arrow").show();
				$("html, body").animate({ scrollTop:  164.75}, 600);
			}
		});
	 }
	 else{
		 alert("El valor de la cedula no puede ser vacio y debe ser mayor o igual a 6 digitos");
	 }
}

function update_data()
{	
	$("html, body").animate({ scrollTop:  164.75}, 600);
	$("#formcontent-1").hide();
	$(".arrow").show();
	$("#formcontent0").show();
	$(".modal-footer").show();
}
function go_to_docs()
{
	document.getElementById("Client_form").submit();
}


var pos = 0;

$(function(){
    var loading = $('#loadbar').hide();
    $(document)
    .ajaxStart(function () {
        loading.show();
    }).ajaxStop(function () {
    	loading.hide();
    });
    
    $("label.btn").on('click',function () {
    	var choice = $(this).find('input:radio').val();
    	$('#loadbar').show();
    	$('#quiz').fadeOut();
    	setTimeout(function(){
           $( "#answer" ).html(  $(this).checking(choice) );      
            $('#quiz').show();
            $('#loadbar').fadeOut();
           /* something else */
    	}, 1500);
    });

    $ans = 3;

    $.fn.checking = function(ck) {
        if (ck != $ans)
            return 'INCORRECT';
        else 
            return 'CORRECT';
    }; 
});	



function form_pos_forward()
{
	
	if(pos < 3){		
		$("#formcontent"+pos).hide();		
		pos = pos +1;
		$("#formcontent"+pos).show();
		//alert(pos);
		if(pos==3)
		 {
			$("#formbutton").show();
			//alert("triggered");
			$("html, body").animate({ scrollTop:  215.75}, 600);
			$( "#formbutton" ).position({
			  my: "center bottom left right",
			  at: "center bottom left right",
			  of: "#targetElement"
			});
			//$('#formbutton').copyCSS('#targetElement');
			
			
			//$("#targetElement").css("visibility","hidden");
		 }
		else{
			$("#formbutton").hide();
		}
	}
	//alert(pos);
	
}

function form_pos_backward()
{
	if(pos != 0){
		//$("#targetElement").css("visibility","visible");
		$("#formcontent"+pos).hide();
		pos = pos -1;
		$("#formcontent"+pos).show();
		$("#formbutton").hide();
	}
	else
	{		
		$("#formcontent0").hide();
		$(".modal-footer").hide();
		$("#formcontent-2").show();
	}
	
}

$( document ).ready(function() {
	 present_intro();
	 
	 $('.keyboard').keyboard({
			layout : 'spanish-qwerty-min',
			restrictInput : true, 
			preventPaste : true,  
			autoAccept : true
		});

	 $('.num').keyboard({
		layout : 'only-numbers',
		restrictInput : true, 
		preventPaste : true,  
		autoAccept : true
	});
	 
	$('.kemail').keyboard({
		layout : 'ipad-email',
		restrictInput : true, 
		preventPaste : true,  
		autoAccept : true
	});
	
	$('.spanish-email').keyboard({
		layout : 'spanish-email',
		restrictInput : true, 
		preventPaste : true,  
		autoAccept : true
	});
	
	$('.colombian-address').keyboard({
		layout : 'colombian-address',
		restrictInput : true, 
		preventPaste : true,  
		autoAccept : true
	});
});

function present_intro()
{
	$("#myModal").modal('show');
}



$("select[name='departamento']" ).change(function() {
	$('#ciudades').empty();
	$('input[name="ciudad"]').val("");
	$.post("get_ciudades",{departamento:$("select[name='departamento']").val(),"${_csrf.parameterName}":"${_csrf.token}"}, function(data){
		$('#table-ajax').empty();
		table = '<table class="table table-condensed  table-bordered" id="tableselect"><thead><th>Codigo Dane</th><th>Nombre ciudad</th><th>Opción</th></thead><tbody id="table_ciudades"></tbody></table>';
		$('#table-ajax').append(table);
		$.each(data,function() {
            cityOption = "<tr><td>"+this.codigo+"</td><td id='codigo"+this.codigo+"' >"+this.nombre+"<td><button class='btn btn-danger' onclick=select_ciudad('"+this.codigo+"')>Selecciona</button></td></tr>";
            $('#table_ciudades').append(cityOption);
        });
		$('#tableselect').DataTable({"language": {"url": "//cdn.datatables.net/plug-ins/1.10.13/i18n/Spanish.json"},"pageLength": 10, "aaSorting": [[1,'asc']] });
		$("#btn-ciudad").prop("disabled", false);
	});
});

$("input[name='identificacion']" ).change(function() {
	if($("input[name='identificacion']" ).val()!= "" & $("input[name='identificacion']" ).val().length>=6)
	 { 
		$.post("get_user_info",{documento:$("input[name='identificacion']" ).val(),"${_csrf.parameterName}":"${_csrf.token}"}, function(data){
			if(data!="")
				{
					
					$.post("get_by_code",{codigo:data.ciudad,"${_csrf.parameterName}":"${_csrf.token}"},
							function(data){
						$("select[name='departamento']").val(data.departamento);
						$("input[name='ciudad']").val(data.nombre);
					});
					console.log("in");
					$("select[name='tipo_identificacion']").val(data.tipo_id);
					$("input[name='identificacion']").val(data.identificacion);
					$("input[name='lugar_expedicion']").val(data.lugar_expdoc);
					$("select[name='sexo']").val(data.sexo);
					$("input[name='nombres']").val(data.nombre);
					$("input[name='apellidos']").val(data.apellido);
					$("select[name='departamento']").val(data.departamento);
					$("input[name='codigo_ciudad']").val(data.ciudad);
					$("input[name='dir_domicilio']").val(data.direccion);
					$("input[name='barrio']").val(data.barrio);
					$("input[name='tel_oficina']").val(data.telefono_oficina);
					$("input[name='tel_vivienda']").val(data.telefono_casa);
					$("input[name='celular']").val(data.celular);
					$("input[name='correo']").val(data.email_e);
				}
		});
	 }	
});

function select_ciudad(codigo)
{	
	$("#myModalCiudad").modal('hide');
	$("input[name='codigo_ciudad']").val(codigo);
	$("input[name='ciudad']").val($("#codigo"+codigo).text());
}

function active_tarh()
{
	$.post("active_tarh",{"${_csrf.parameterName}":"${_csrf.token}"},function(data){
		//alert(data);
		$("#myModal2").modal("show");
	});
}

function inactive_tarh()
{
	$.post("inactive_tarh",{"${_csrf.parameterName}":"${_csrf.token}"},function(data){
		//alert(data);
	});
}

/*function check_city()
{
	//console.log("checked");	
	var code = $("#ciudad").val();
	if(code != "")
	{
		console.log(code);
		var danecode = $("#ciudades [value='"+code+"']").data('value');
		if (danecode == undefined && $("input[name='codigo_ciudad']").val() == "none" ) {
		    alert("el nombre de la ciudad no es valido");
		    $("#ciudad").focus();
		}else{
			console.log(danecode);
			$("input[name='codigo_ciudad']").val(danecode);
			}
		
	}
	
}*/

function send_form()
{
	
	//alert("into class");
	console.log("find "+$("select[name='tipo_identificacion']").val() );
	
	if($("select[name='tipo_identificacion']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent0").show();
		$("#formbutton").hide();
		alert("Debe seleccionar un tipo de identificación");
		pos = 0;
		return false;
	}
	
	if($("select[name='identificacion']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent0").show();
		$("#formbutton").hide();
		alert("ponga un numero de identificación");
		pos = 0;
		return false;
	}
	
	if($("input[name='lugar_expedicion']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent0").show();
		$("#formbutton").hide();
		alert("Ingrese el lugar de expedición de la cedula");
		pos = 0;
		return false;
	}	
	
	if($("select[name='sexo']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent1").show();
		$("#formbutton").hide();
		alert("Seleccione su sexo");
		pos = 1;
		return false;
	}
	
	if($("input[name='nombres']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent1").show();
		$("#formbutton").hide();
		alert("Escriba sus nombres");
		pos = 1;
		return false;
	}
	
	if($("input[name='apellidos']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent1").show();
		$("#formbutton").hide();
		alert("Escriba sus apellidos");
		pos = 1;
		return false;
	}
	
	/*if($("input[name='codigo_ciudad']").val() == "none")
	{
		alert("Ingrese la ciudad en la que vive");
		return false;
	}*/	
	
	if($("select[name='departamento']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent2").show();
		$("#formbutton").hide();
		alert("Ingrese el departamento donde vive");
		pos = 2;
		return false;
	}
	
	if($("input[name='ciudad']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent2").show();
		$("#formbutton").hide();
		alert("Ingrese la ciudad donde vive");
		pos = 2;
		return false;
	}
	
	if($("input[name='dir_domicilio']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent2").show();
		$("#formbutton").hide();
		alert("Ingrese su dirección de domicilio");
		pos = 2;
		return false;
	}
	
	if($("input[name='barrio']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent2").show();
		$("#formbutton").hide();
		alert("Ingrese el barrio donde vive");
		pos = 2;
		return false;
	}
	
	if($("input[name='celular']").val() == "")
	{
		alert("Ingrese un numero celular");
		pos = 3;
		return false;
	}
	
	if($("input[name='correo']").val() == "")
	{
		alert("Ingrese el correo electrónico");
		pos = 3;
		return false;
	}
	
	
	//document.getElementById("Client_form").submit();
	return true;
	//
	
}

</script>
		

