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
							          <!--  <div>
								           <label class="element-animation1 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="1">1 One</label>
								           <label class="element-animation2 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="2">2 Two</label>
								           <label class="element-animation3 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="3">3 Three</label>
								           <label class="element-animation4 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="4">4 Four</label>
						       	  	  </div> -->
						       	  	  <div id="formcontent0">
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
												<label class="form-control">Numero de identificación</label>
												<input type="number" name="identificacion" class="form-control num">
											</div>
											<div class="form-group">
												<label class="form-control">Lugar de expedición</label>
												<input type="text" name="lugar_expedicion" class="form-control keyboard">
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
												<input type="number" class="form-control" name="departamento">
											</div>
						       	  	  		<div class="form-group">
												<label class="form-control">Ciudad domicilio</label>
												<input type="number" class="form-control" name="ciudad">
											</div>
											<div class="form-group">
												<label class="form-control">Dirección domicilio</label>
												<input type="text" class="form-control keyboard" name="dir_domicilio">
											</div>
											<div class="form-group">
												<label class="form-control">Barrio</label>
												<input type="text" class="form-control keyboard" name="barrio">
											</div>
							          </div>	
						       	  </div>
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
	$("#formcontent"+pos).hide();
	pos = pos +1;
	$("#formcontent"+pos).show();
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


</script>
		

