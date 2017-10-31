<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<style>
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
	
	#qid:hover{
		background-color: yellow;
	}
</style> 
  
<link href="<c:url value="/resources/theme1/css/specialform.css"/> " rel="stylesheet">
<br>
<br>
 
<header id="home">
	 <div class="container">
         <div class="row">
             <div class="col-lg-12">             	                 
                 <div class="intro-text">
                    
					<div id="former"  class="col-lg-12 col-md-12 col-sm-12">
					
						<div class="container-fluid bg-info" style="background: rgba(0,0,0,0);">
						    <div class="modal-dialog">
						      <div class="modal-content" >
						         <div class="modal-header">
						         							            
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
						        			<h3 style="color:black !important;">�Vamos a verificar tus datos!</h3>
							       	  	  	<div class="form-group">
												<label class="form-control ">Ingrese su cedula</label>
												<input type="number" name="validate-identificacion" class="form-control num">												
											</div>
											<div class="form-group">
												<button class="btn btn-primary form-control" onclick="validate_cedula()">Consultar</button>
											</div>							       	  	  
							          </div>
							          <div id="formcontent-1" style="display:none;">
						        			<h3 style="color:black !important;" id="welcome-message">�Bienvenido!</h3>
							       	  	  	<span style="color:black !important;">�Por favor seleccione una de la siguientes opciones!</span>
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
												<label class="form-control ">Tipo de identificaci�n</label>
												<select class="form-control" name="tipo_identificacion" required>
													<option value="">Seleccione una opci�n</option>
													<option value="CC">CEDULA DE CIUDADANIA</option>
													<option value="CE">CEDULA DE EXTRANJERIA</option>
													<option value="NIT">NIT</option>
													<option value="PAS">PASAPORTE</option>
													<option value="TI">TARJETA DE IDENTIDAD</option>
												</select>
											</div>
							       	  	  	<div class="form-group">
												<label class="form-control">Numero de identificaci�n</label>
												<input type="number" name="identificacion" class="form-control num" required>
											</div>
											<div class="form-group">
												<label class="form-control">Lugar de expedici�n</label>
												<input type="text" name="lugar_expedicion" class="form-control keyboard" required>
											</div>
							          </div>
						       	  	  <div id="formcontent1" style="display:none;">
							          		<div class="form-group">
												<label class="form-control">Sexo</label>
												<select class="form-control"  name="sexo" required>
													<option value="">Selecciona</option>
													<option value="M">Masculino</option>
													<option value="F">Femenino</option>
												</select>
											</div>
											<div class="form-group">
												<label class="form-control">Nombres</label>
												<input type="text" name="nombres" class="form-control keyboard" required>
											</div>
											<div class="form-group">
												<label class="form-control">Apellidos</label>
												<input type="text" name="apellidos" class="form-control keyboard" required>
											</div>
							          </div>
						       	  	  <div id="formcontent2" style="display:none;">
						       	  	  		<div class="form-group">
												<label class="form-control">Departamento</label>
												<select  class="form-control" name="departamento" required>
													<option>Selecciona</option>
													<c:forEach items="${listdepartamentos}" var="departamento">			
														<option value="${departamento}">${departamento}</option>							
													</c:forEach>
												</select>
											</div>
						       	  	  		<div class="form-group">
												<label class="form-control">Ciudad domicilio</label>
												<div class="input-group">
													<input class="form-control" id="ciudad"  name="ciudad" list="ciudades" disabled required>												
													<span class="input-group-btn">
													<button  data-toggle="modal" data-target="#myModalCiudad" id="btn-ciudad" class="btn btn-primary" disabled>Selecciona</button>
													</span>
												</div>        
												<input type="hidden" name="codigo_ciudad" value="none">
											</div>
											<div class="form-group">
												<label class="form-control">Direcci�n domicilio</label>
												<input type="text" class="form-control keyboard"  name="dir_domicilio" required>
											</div>
											<div class="form-group">
												<label class="form-control">Barrio</label>
												<input type="text" class="form-control keyboard" name="barrio" required>
											</div>
							          </div>
							          <div id="formcontent3" style="display:none;">
						       	  	  		<div class="form-group">
												<label class="form-control">Tel. oficina</label>
												<input type="number" class="form-control num" name="tel_oficina">
											</div>
											<div class="form-group">
												<label class="form-control">Tel. vivienda</label>
												<input type="number" class="form-control num" name="tel_vivienda">
											</div>
											<div class="form-group">
												<label class="form-control">Celular</label>
												<input type="number" class="form-control num" name="celular" required>
											</div>
											<div class="form-group">
												<label class="form-control">Email</label>
												<input type="email" class="form-control kemail" name="correo" required>
											</div>
											
							          </div>
							          	
						       	  </div>	
						       	  		<div class="form-group">												
												<input type="submit" id="formbutton" class="btn btn-success" onclick="send_form()"  value="enviar y terminar">
										</div>				       	   	
							       	 </form:form>						       	  
						   		</div>
								    <div class="modal-footer text-muted" style="text-align:center;">								    	
								    	<button onclick="form_pos_backward()" class="arrow" style="background: rgba(0,0,0,0); border: none; display:none;"><h3><span class="label label-warning" id="qid">Anterior</span> </h3></button>
								    	<button onclick="form_pos_forward()" class="arrow" style="background: rgba(0,0,0,0); border: none; display:none;"><h3><span class="label label-warning" id="qid">Siguiente</span> </h3></button>							    	
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
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">      
      <div class="modal-body">
      	<br>
        <p style="text-align:center;">�Es usted la persona que va a constituir la garantia?</p>
        <br>
        <br>
        <div style="text-align:center;">
        	<button data-dismiss="modal" style="width:95px !important; margin-right:25px;" class="btn btn-lg btn-danger">Si</button>
        	<button onclick="validate2()"  data-dismiss="modal" style="width:95px !important; " class="btn btn-lg btn-primary">No</button>
        </div>
      </div>      
    </div>

  </div>
</div>

<!-- Modal -->
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">      
      <div class="modal-body">
      	<br>
        <p style="text-align:center;">Esta informaci�n debe ser diligenciada por la persona que va a constituir la garantia siendo:</p>
        <ul>
        	<li>Los datos del asegurado.</li>
        	<li>Los datos del tarjetahabiente (si aplica).</li>        	
        </ul>
        <p style="text-align:center;">La informaci�n suministrada sera la utlizada durante este proceso.</p>
        <br>
        <br>
        <div style="text-align:center;">
        	<button data-dismiss="modal"  class="btn btn-lg btn-danger">Continuar</button>        	
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

<script>

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
					$("#welcome-message").append(" "+data.nombre+" "+data.apellido);
					$("#formcontent").show();
					$("input[name='identificacion']").attr('readonly', true);
					//$(".arrow").show();
				}
			else{
				alert("Bienvenido proceda a ingresar sus datos");
				$("input[name='identificacion']").val($("input[name='validate-identificacion']" ).val());
				$("#formcontent-2").hide();
				$("#formcontent0").show();
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
	}
	if(pos==3)
	 {
		$("html, body").animate({ scrollTop:  215.75}, 600);
		$("#formbutton").show();
	 }
	else{
		$("#formbutton").hide();
	}
}

function form_pos_backward()
{
	if(pos != 0){
		$("#formcontent"+pos).hide();
		pos = pos -1;
		$("#formcontent"+pos).show();
		$("#formbutton").hide();
	}
	
}

$( document ).ready(function() {
	 present_intro();
	 
	 $('.keyboard').keyboard({
			layout : 'spanish-qwerty',
			restrictInput : true, 
			preventPaste : true,  
			autoAccept : true
		});

	 $('.num').keyboard({
		layout : 'num',
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
});

function present_intro()
{
	$("#myModal").modal('show');
}

function validate2()
{
	$("#myModal2").modal('show');
}

$("select[name='departamento']" ).change(function() {
	$('#ciudades').empty();
	$('input[name="ciudad"]').val("");
	$.post("get_ciudades",{departamento:$("select[name='departamento']").val(),"${_csrf.parameterName}":"${_csrf.token}"}, function(data){
		$('#table-ajax').empty();
		table = '<table class="table table-condensed  table-bordered" id="tableselect"><thead><th>Codigo Dane</th><th>Nombre ciudad</th><th>Opci�n</th></thead><tbody id="table_ciudades"></tbody></table>';
		$('#table-ajax').append(table);
		$.each(data,function() {
            cityOption = "<tr><td>"+this.codigo+"</td><td>"+this.nombre+"<td><button class='btn btn-danger' onclick=select_ciudad('"+this.codigo+"','"+this.nombre+"')>Selecciona</button></td></tr>";
            $('#table_ciudades').append(cityOption);
        });
		$('#tableselect').DataTable({"language": {"url": "//cdn.datatables.net/plug-ins/1.10.13/i18n/Spanish.json"},"pageLength": 10});
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

function select_ciudad(codigo,nombre)
{	
	$("#myModalCiudad").modal('hide');
	$("input[name='codigo_ciudad']").val(codigo);
	$("input[name='ciudad']").val(nombre)
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
		alert("Debe seleccionar un tipo de identificaci�n");
		pos = 0;
		return false;
	}
	
	if($("select[name='identificacion']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent0").show();
		$("#formbutton").hide();
		alert("ponga un numero de identificaci�n");
		pos = 0;
		return false;
	}
	
	if($("input[name='lugar_expedicion']").val() == "")
	{
		$("#formcontent3").hide();
		$("#formcontent0").show();
		$("#formbutton").hide();
		alert("Ingrese el lugar de expedici�n de la cedula");
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
		alert("Ingrese su direcci�n de domicilio");
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
		alert("Ingrese el correo electr�nico");
		pos = 3;
		return false;
	}
	
	
	//document.getElementById("Client_form").submit();
	return true;
	//
	
}

</script>
		

