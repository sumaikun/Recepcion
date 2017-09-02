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
    	background-position:center 75px;
    	background-attachment: fixed;
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
						            <button onclick="form_pos_forward()" style="background: rgba(0,0,0,0); border: none;"><h3><span class="label label-warning" id="qid">Siguiente</span> </h3></button>
						        </div>
						        <div class="modal-body" >
						        	<form:form action="create_customer_data" method="post" id="Client_form" >
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
								 
						          <div class="quiz" id="quiz" data-toggle="buttons">
						          
							       								 						       	
						       	  	  <div id="formcontent0">
							       	  	  	<div class="form-group">
												<label class="form-control">Tipo de identificación</label>
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
												<label class="form-control">Numero de identificación</label>
												<input type="number" name="identificacion" class="form-control num" required>
											</div>
											<div class="form-group">
												<label class="form-control">Lugar de expedición</label>
												<input type="text" name="lugar_expedicion" class="form-control keyboard" required>
											</div>
							          </div>
						       	  	  <div id="formcontent1" style="display:none;">
							          		<div class="form-group">
												<label class="form-control">Sexo</label>
												<select class="form-control"  name="sexo">
													<option value="">Selecciona</option>
													<option value="M">Masculino</option>
													<option value="F">Femenino</option>
												</select>
											</div>
											<div class="form-group">
												<label class="form-control">Nombres</label>
												<input type="text" name="nombres" class="form-control keyboard">
											</div>
											<div class="form-group">
												<label class="form-control">Apellidos</label>
												<input type="text" name="apellidos" class="form-control keyboard">
											</div>
							          </div>
						       	  	  <div id="formcontent2" style="display:none;">
						       	  	  		<div class="form-group">
												<label class="form-control">Departamento</label>
												<select  class="form-control" name="departamento">
													<option>Selecciona</option>
													<c:forEach items="${listdepartamentos}" var="departamento">			
														<option value="${departamento}">${departamento}</option>							
													</c:forEach>
												</select>
											</div>
						       	  	  		<div class="form-group">
												<label class="form-control">Ciudad domicilio</label>
												<input class="form-control keyboard" id="ciudad"  name="ciudad" list="ciudades">  
												<datalist  id="ciudades">												
													
												</datalist>
												<input type="hidden" name="codigo_ciudad" value="none">
											</div>
											<div onmouseover="check_city()" class="form-group">
												<label class="form-control">Dirección domicilio</label>
												<input type="text" class="form-control keyboard"  name="dir_domicilio">
											</div>
											<div onmouseover="check_city()" class="form-group">
												<label class="form-control">Barrio</label>
												<input type="text" class="form-control keyboard" name="barrio">
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
												<input type="number" class="form-control num" name="celular">
											</div>
											<div class="form-group">
												<label class="form-control">Email</label>
												<input type="email" class="form-control" name="correo">
											</div>
											
							          </div>
							          	
						       	  </div>	
						       	  		<div class="form-group">												
												<input type="submit"  class="btn btn-success" onclick="send_form()" value="enviar y terminar">
										</div>				       	   	
							       	 </form:form>						       	  
						   		</div>
								    <div class="modal-footer text-muted" style="text-align:center;">
								    	<button onclick="form_pos_backward()" style="background: rgba(0,0,0,0); border: none;"><h3><span class="label label-warning" id="qid">Anterior</span> </h3></button>								    	
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

<script>
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
}

function form_pos_backward()
{
	if(pos != 0){
		$("#formcontent"+pos).hide();
		pos = pos -1;
		$("#formcontent"+pos).show();
	}
	
}

$( document ).ready(function() {
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
});

$("select[name='departamento']" ).change(function() {
	$('#ciudades').empty();
	$('input[name="ciudad"]').val("");
	$.post("get_ciudades",{departamento:$("select[name='departamento']").val(),"${_csrf.parameterName}":"${_csrf.token}"}, function(data){
	
		$.each(data,function() {
            cityOption = "<option  data-value='"+this.codigo+"' value='"+this.nombre+"' \>" + this.codigo + "</option>";
            $('#ciudades').append(cityOption);
        });
	});
});

$("input[name='identificacion']" ).change(function() {
	$.post("get_user_info",{documento:$("input[name='identificacion']" ).val(),"${_csrf.parameterName}":"${_csrf.token}"}, function(data){
		if(data!=null)
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
});

function check_city()
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
	
}

function send_form()
{
	if($("select[name='tipo_identificacion']").val() == "")
	{
		return alert("Debe seleccionar un tipo de identificación");
	}
	
	if($("select[name='identificacion']").val() == "")
	{
		return alert("ponga un numero de identificación");
	}
	
	if($("input[name='lugar_expedicion']").val() == "")
	{
		return alert("Ingrese el lugar de expedición de la cedula");
	}	
	
	if($("select[name='sexo']").val() == "")
	{
		return alert("Seleccione su sexo");
	}
	
	if($("input[name='nombres']").val() == "")
	{
		return alert("Escriba sus nombres");
	}
	
	if($("input[name='apellidos']").val() == "")
	{
		return alert("Escriba sus apellidos");
	}
	
	if($("input[name='codigo_ciudad']").val() == "none")
	{
		return alert("Ingrese la ciudad en la que vive");
	}
	
	if($("input[name='dir_domicilio']").val() == "none")
	{
		return alert("Ingrese su dirección de domicilio");
	}
	
	if($("input[name='celular']").val() == "none")
	{
		return alert("Ingrese un numero celular");
	}
	//document.getElementById("Client_form").submit();
}
</script>
		

