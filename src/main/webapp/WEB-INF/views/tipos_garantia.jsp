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
	
	html {
	  height: 100%;
	}
	body {
	  min-height: 100%;
	}
	
</style>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  -->

<script>
    /*$(function(){
         // Find any date inputs and override their functionality
         if (navigator.userAgent.indexOf("Firefox") > 0) {
                //alert("ff");
                $('input[type="date"]').datepicker();
            }
        	 
         
        
    });*/
    Array.prototype.contains = function(obj) {
        var i = this.length;
        while (i--) {
            if (this[i] === obj) {
                return true;
            }
        }
        return false;
    }
</script>
<br>
<br>
<header id="home">
	 <div class="container">
         <div class="row">
             <div class="col-lg-12" style="margin-top:20% !important;">                 
                 <div class="intro-text">                 	
                     <span class="name" ><font color="#424242">Tipos de garantia</font></span>
                 	 <hr class="star-light">                	 
                 </div>
             </div>
             <c:if test="${ valor_credito > 0 }">
             <div class="col-lg-4 col-md-4"><button data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-lg">Tarjeta de crédito</button></div>
           	 </c:if>           	
           	 <c:if test="${ valor_riesgo > 0 }">
           	 	<div class="col-lg-4 col-md-4"><!--<button data-toggle="modal" data-target="#myModal3" class="btn btn-primary btn-lg">Todo riesgo no reembolsable</button>--></div>
         	</c:if>
         	 <c:if test="${ valor_efectivo > 0 }">
           	 	<div class="col-lg-4 col-md-4"><button data-toggle="modal" data-target="#myModal2" class="btn btn-primary btn-lg">Consignación en efectivo</button></div>
           	 </c:if>
         </div>
     </div>
</header>

<c:if test="${ valor_credito > 0 }">  
<!-- Modal -->
<div id="myModal" data-backdrop="static" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Garantia por tarjeta de credito</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form">
		    <fieldset>
		      <legend>Valor: $ ${valor_credito}</legend> 
		      
		      <input name="valor_credito"  type="hidden" value="${valor_credito}">
		      
		      <div class="form-group">
		      	<label class="col-sm-3 control-label" for="card-number">Franquicia</label>
		       	<div class="col-sm-9">
		       		<select class="form-control" id="franquicia" name="franquicia">
		       			<option value="">Selecciona</option>
		       			<c:forEach items="${franquicias}" var="franquicia">			
							<option value="${franquicia.id}">${franquicia.nombre}</option>							
						</c:forEach>
		       		</select>
		       	</div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-number">Numero de Tarjeta</label>
		        <div class="col-sm-9">
		          <input type="text"   class="form-control numero_tarjeta num" name="numero_tarjeta" id="card-number" maxlength="16"  placeholder="Numero de tarjeta" >
		        </div>		    
		      </div> 	
		      <div class="form-group">
		      	<label class="col-sm-3 control-label" for="card-number">Banco</label>
		       	<div class="col-sm-9">
			       	<select name="banco" class="form-control" id="banco" style="">
			       			<option value="">Seleccione una opción</option>
							<option value="1">ABN AMRO</option>
							<option value="3">AGRARIO</option>
							<option value="4">AV VILLAS</option>
							<option value="2">BANCAFE (GRANBANCO)</option>
							<option value="97">BANCO MUNDO MUJER</option>
							<option value="5">BANCOLOMBIA</option>
							<option value="15">BANCOOMEVA</option>
							<option value="6">BANITSMO (HSBC)</option>
							<option value="7">BANK BOSTON</option>
							<option value="8">BBVA</option>
							<option value="9">BOGOTA</option>
							<option value="10">CAJA SOCIAL</option>
							<option value="11">CITIBANK</option>
							<option value="12">COLMENA</option>
							<option value="13">COLPATRIA</option>
							<option value="14">CONFIAR</option>
							<option value="89">CORPBANCA</option>
							<option value="17">DAVIVIENDA</option>
							<option value="65">FALABELLA</option>
							<option value="22">GNB SUDAMERIS</option>
							<option value="16">HELM BANK (CREDITO)</option>
							<option value="90">JURISCOOP</option>
							<option value="94">MACROFINANCIERA</option>
							<option value="18">MEGABANCO</option>
							<option value="19">OCCIDENTE</option>
							<option value="82">PICHINCHA</option>
							<option value="20">POPULAR</option>
							<option value="21">SANTANDER</option>
							<option value="24">THE ROYAL BANK OF SCOTLAND (COLOMBIA) S.A. (RBS) </option>
							<option value="23">UNION</option>
						</select>
					</div>
				 </div>		
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="expiry-month">Fecha de expiración</label>
		        <div class="col-sm-9">
		          <div class="row">
		            <div class="col-xs-3">
		              <select class="form-control col-sm-2" name="month_expi" id="expiry-month">
		                <option>Month</option>
		                <option value="01">Ene (01)</option>
		                <option value="02">Feb (02)</option>
		                <option value="03">Mar (03)</option>
		                <option value="04">Abr (04)</option>
		                <option value="05">May (05)</option>
		                <option value="06">Juni (06)</option>
		                <option value="07">Juli (07)</option>
		                <option value="08">Ago (08)</option>
		                <option value="09">Sep (09)</option>
		                <option value="10">Oct (10)</option>
		                <option value="11">Nov (11)</option>
		                <option value="12">Dec (12)</option>
		              </select>
		            </div>
		            <div class="col-xs-3">
		              <select class="form-control" name="year_expi">
		                <option value="2017">2017</option>
		                <option value="2018">2018</option>
		                <option value="2018">2019</option>
		                <option value="2020">2020</option>
		                <option value="2021">2021</option>
		                <option value="2022">2022</option>
		                <option value="2023">2023</option>
		                <option value="2024">2024</option>
		                <option value="2025">2025</option>
		                <option value="2026">2026</option>
		                <option value="2027">2027</option>
		                <option value="2028">2028</option>
		                <option value="2029">2029</option>
		                <option value="2030">2030</option>
		                <option value="2031">2031</option>
		              </select>
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="cvv">CVV</label>
		        <div class="col-sm-3">
		          <input type="number" style="width:150px;" maxlength="3" class="form-control num" name="cvv" id="cvv" placeholder="Security Code">		           
		        </div>
		      </div>
		       <img class="pull-right" src="http://www.domyownpestcontrol.com/images/securitycode.jpg" alt="Smiley face" height="150" width="150" style="margin-top:-110px;">
		    </fieldset>
		  </form>
		  <div class="form-group">
		  	<button type="button" class="btn btn-success form-control"  onclick="devoluciones('credito')">CONTINUAR</button>
		  </div>		 
      </div>
      <div class="modal-footer">      	
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</c:if>

<c:if test="${ valor_efectivo > 0 }">
<!-- Modal -->
<div id="myModal2" data-backdrop="static" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Consignación en efectivo</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form">
		    <fieldset>
		      <input name="valor_efectivo"  type="hidden" value="${valor_efectivo}">
		      <legend>Valor de garantia: $ ${valor_efectivo}</legend> 
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-holder-name">Numero de comprobante de consignación</label>
		        <div class="col-sm-9">
		          <input type="text" class="form-control num" name="comprobante_consignacion" id="card-holder-name" placeholder="Comprobante de consignación">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-number">Fecha de consignación</label>
		        <div class="col-sm-9">
		          <input class="form-control" name="fecha_consignacion" id="fecha1" type="date">
		        </div>
		      </div>		     
		    </fieldset>
		  </form>
		  <div class="form-group">
		  	<button type="button" class="btn btn-success form-control"  onclick="devoluciones('efectivo')">CONTINUAR</button>
		  </div>
      </div>
      <div class="modal-footer">      	
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</c:if>


<c:if test="${ valor_riesgo > 0 }">
<!-- Modal -->
<div id="myModal3" data-backdrop="static" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Todo riesgo no reembolsable</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form">
		    <fieldset>
		    <input name="valor_credito"  type="hidden" value="${valor_riesgo}">
		      <legend>Valor de garantia: $ ${valor_riesgo*dias_servicio} , días de servicio ${dias_servicio}</legend> 
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-holder-name">Numero de comprobante de consignación</label>
		        <div class="col-sm-9">
		          <input type="text" class="form-control num" name="riesgo_consignacion" id="card-holder-name" placeholder="Comprobante de consignación">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-number">Fecha de consignación</label>
		        <div class="col-sm-9">
		          <input class="form-control" id="fecha2" name="riesgo_fecha" type="date">
		        </div>
		      </div>
		      <input type='hidden' name='riesgo_valor' value='${valor_riesgo*dias_servicio}'>		     
		    </fieldset>
		  </form>
		  <div class="form-group">
		  	<button type="button" class="btn btn-success form-control"  onclick="devoluciones('riesgo')">CONTINUAR</button>
		  </div>
      </div>
      <div class="modal-footer">      	
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</c:if>

<!-- Modal -->
<div id="myModal4" class="modal fade" data-backdrop="static" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Datos financieros para devoluciones</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form">
		    <fieldset>
		      <legend></legend> 
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-holder-name">Número de cuenta bancaria</label>
		        <div class="col-sm-9">
		          <input type="text" class="form-control num" name="devol_cuenta_bancaria" id="card-holder-name" placeholder="Número de cuenta sin separadores">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-number">Tipo de cuenta</label>
		        <div class="col-sm-9">
		          <select name="devol_tipo_cuenta" class="form-control" id="tipo">
		          	<option value="">Selecciona</option>
		          	<option value="A">Ahorros</option>
		          	<option value="C">Corriente</option>
	          	 </select>
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-number">Banco</label>
		        <div class="col-sm-9">
		          <select name="devol_banco" class="form-control" id="devol_banco" style=""><option value="">Seleccione una opción</option>
						<option value="1">ABN AMRO</option>
						<option value="3">AGRARIO</option>
						<option value="4">AV VILLAS</option>
						<option value="2">BANCAFE (GRANBANCO)</option>
						<option value="97">BANCO MUNDO MUJER</option>
						<option value="5">BANCOLOMBIA</option>
						<option value="15">BANCOOMEVA</option>
						<option value="6">BANITSMO (HSBC)</option>
						<option value="7">BANK BOSTON</option>
						<option value="8">BBVA</option>
						<option value="9">BOGOTA</option>
						<option value="10">CAJA SOCIAL</option>
						<option value="11">CITIBANK</option>
						<option value="12">COLMENA</option>
						<option value="13">COLPATRIA</option>
						<option value="14">CONFIAR</option>
						<option value="89">CORPBANCA</option>
						<option value="17">DAVIVIENDA</option>
						<option value="65">FALABELLA</option>
						<option value="22">GNB SUDAMERIS</option>
						<option value="16">HELM BANK (CREDITO)</option>
						<option value="90">JURISCOOP</option>
						<option value="94">MACROFINANCIERA</option>
						<option value="18">MEGABANCO</option>
						<option value="19">OCCIDENTE</option>
						<option value="82">PICHINCHA</option>
						<option value="20">POPULAR</option>
						<option value="21">SANTANDER</option>
						<option value="24">THE ROYAL BANK OF SCOTLAND (COLOMBIA) S.A. (RBS) </option>
						<option value="23">UNION</option>
					</select>
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-holder-name">Nombre del titular</label>
		        <div class="col-sm-9">
		          <input type="text" class="form-control keyboard" name="devol_nombre_titular"  placeholder="Nombre del titular">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-holder-name">Identificación</label>
		        <div class="col-sm-9">
		          <input type="number" class="form-control num" name="devol_iden_titular" id="card-holder-name" placeholder="Número de cuenta sin separadores">
		        </div>
		      </div>			     
		    </fieldset>
		  </form>
		  <div class="form-group">
		  	<button type="button" onclick="finish_finan_data()" class="btn btn-success form-control">Enviar información</button>
		  </div>
      </div>
      <div class="modal-footer">      	
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<script>
var tipo_garantia;

$( document ).ready(function() {
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
	 
	 var today = new Date();
	 var dd = today.getDate();
	 var mm = today.getMonth()+1; //January is 0!
	 var yyyy = today.getFullYear();
	  if(dd<10){
	         dd='0'+dd
	     } 
	     if(mm<10){
	         mm='0'+mm
	     } 

	 today = yyyy+'-'+mm+'-'+dd;
	 $("#fecha1").attr("max", today);
	 $("#fecha2").attr("max", today);
});



$("#franquicia").change(function(){
	
	if($("input[name='numero_tarjeta']").val().length != "" ){
	
		var num = $("input[name='numero_tarjeta']").val();
		if(event.target.value == 1 & num[0] !=4)
		{
			alert("El numero de la tarjeta no corresponde a la franquicia");
			event.target.value = "";
		}
		if(event.target.value == 2 & num[0] !=5)
		{
			alert("El numero de la tarjeta no corresponde a la franquicia");
			event.target.value = "";
		}
		
		if((event.target.value == 3 || event.target.value == 4) & num[0] !=3)
		{
			alert("El numero de la tarjeta no corresponde a la franquicia");
			event.target.value = "";
		}
		//alert(num[0]);
		//alert(event.target.value);		
	}
	
});

$("input[name='numero_tarjeta']").change(function(){
	var num = $("input[name='numero_tarjeta']").val();
	if(num != "")
	{
		if($("#franquicia").val() == 1 & num[0] !=4)
		{
			alert("El numero de la tarjeta no corresponde a la franquicia");			
			$("input[name='numero_tarjeta']").val("");
		}
		if($("#franquicia").val() == 2 & num[0] !=5)
		{
			alert("El numero de la tarjeta no corresponde a la franquicia");
			$("input[name='numero_tarjeta']").val("");
		}
		
		if(($("#franquicia").val() == 3 || $("#franquicia").val() == 4) & num[0] !=3)
		{
			alert("El numero de la tarjeta no corresponde a la franquicia");
			$("input[name='numero_tarjeta']").val("");
		}	
	}

});

$("input[name='numero_tarjeta']").click(function(){
	
	$(".ui-keyboard").hide();
	
	if($("#franquicia").val() == "")
	{		
		alert("Selecciona primero la franquicia");
	}
	else
	{
		$(".ui-keyboard").show();
		
	}
	
	 
});

function devoluciones(tipo)
{	
	if(tipo == "credito")
	{
		var d = new Date();
		var y = d.getFullYear();
		var m = d.getMonth();
		
		if($("select[name='year_expi']").val() == y)
		{
				if($("select[name='month_expi']").val()<=m)
				{
					alert("fecha de vencimiento invalida");
					return false;
				}
		}
		
		if($("select[name='year_expi']").val() < y)
		{
			alert("El año de vencimiento ya paso");
			return false;
		}
		
		if($("select[name='franquicia']").val() == "")
		{
			alert("Seleccione la franquicia de la tarjeta de credito");
			return false;
		}
		
		if($("input[name='numero_tarjeta']").val().length < 15)
		{
			alert("El numero de la tarjeta debe tener mas dígitos");
			return false;
		}
		
		if($("input[name='numero_tarjeta']").val().length > 16)
		{
			alert("El número de tarjeta no puede tener mas de 16 dígitos");
			return false;
		}
		
		if($("input[name='numero_tarjeta']").val().length < 16 && [1,2].contains(parseInt($("select[name='franquicia']").val()))   )
		{
			//console.log($("input[name='numero_tarjeta']").val().length);
			alert("El numero de la tarjeta no debe ser mayor o menor de 16 dígitos");
			return false;
		}
		
		if($("input[name='numero_tarjeta']").val().length < 15 && [3,4].contains(parseInt($("select[name='franquicia']").val())))
		{
			//console.log($("input[name='numero_tarjeta']").val().length);
			alert("El numero de la tarjeta para esta franquisía debe tener al menos 15 dígitos");
			return false;
		}
		
		if($("input[name='cvv']").val().length < 3 )
		{
			alert("El cvv debe tener al menos tres dígitos");
			return false;
		}
		
		var selected_franq = $("select[name='franquicia']").val();		
		
		if($("input[name='cvv']").val().length != 3 && [1,2].contains(parseInt($("select[name='franquicia']").val())))
		{
			alert("El cvv debe tener tres dígitos");
			return false;
		}
		
		if($("input[name='cvv']").val().length < 3 && [3,4].contains(parseInt($("select[name='franquicia']").val())))
		{
			alert("El cvv puede contener hasta cuatro dígitos");
			return false;
		}
		
		if($("select[name='banco']").val() == "")
		{
			alert("Seleccione el banco de la tarjeta de credito");
			return false;
		}
		
		
		
		if($("select[name='year_expi']").val() == "")
		{
			alert("Seleccione el mes de año de la tarjeta de credito");
			return false;
		}	
		
		if($("select[name='month_expi']").val() == "")
		{
			alert("Seleccione el mes de expiración de la tarjeta de credito");
			return false;
		}		
		
		 $.post("garantia_credito",{
			 "${_csrf.parameterName}":"${_csrf.token}",
			 numero_tarjeta:$("input[name='numero_tarjeta']").val(),
			 banco:$("select[name='banco']").val(),
			 franquicia:$("select[name='franquicia']").val(),
			 month_expi:$("select[name='month_expi']").val(),
			 year_expi:$("select[name='year_expi']").val(),
			 cvv:$("input[name='cvv']").val(),
			 devol_tipo_cuenta:$("select[name='devol_tipo_cuenta']").val(),
			 devol_cuenta_bancaria:$("input[name='devol_cuenta_bancaria']").val(),
			 devol_banco:$("select[name='devol_banco']").val(),
			 devol_nombre_titular:$("input[name='devol_nombre_titular']").val(),
			 devol_iden_titular:$("input[name='devol_iden_titular']").val(),
			 valor_congelamiento:$("input[name='valor_credito']").val()
			 }, function(res, sta){
			 console.log(res);
			 window.location.href = 'DocumentosScaner';  
		 });
	}
	if(tipo == "efectivo")
	{
		if($("input[name='comprobante_consignacion']").val().length < 7 || $("input[name='comprobante_consignacion']").val().length > 15){
			alert("El comprobante de consignación debe tener entre 7 a 15 dígitos");
			return false;
		}
		if($("input[name='fecha_consignacion']").val() == ""){
			alert("Debe agregar una fecha de consignación");
			return false;
		}
		$("#myModal2").modal('hide');
		$("#myModal4").modal('show');
		tipo_garantia = tipo;
	}
	if(tipo == "riesgo")
	{
		if($("input[name='riesgo_consignacion']").val().length < 7 || $("input[name='riesgo_consignacion']").val().length > 15){
			alert("El comprobante de consignación debe tener entre 7 a 15 dígitos");			
			return false;
		}
		if($("input[name='riesgo_fecha']").val() == ""){
			alert("Debe agregar una fecha de consignación");
			return false;
		}	
		//alert("cerrar el tercer modal");
		$("#myModal3").modal('hide');
		
		 $.post("garantia_riesgo",{
			 "${_csrf.parameterName}":"${_csrf.token}",
			 comprobante_consignacion:$("input[name='riesgo_consignacion']").val(),
			 fecha_consignacion:$("input[name='riesgo_fecha']").val(),
			 devol_tipo_cuenta:$("select[name='devol_tipo_cuenta']").val(),
			 devol_cuenta_bancaria:$("input[name='devol_cuenta_bancaria']").val(),
			 devol_banco:$("select[name='devol_banco']").val(),
			 devol_nombre_titular:$("input[name='devol_nombre_titular']").val(),
			 devol_iden_titular:$("input[name='devol_iden_titular']").val(),
			 valor:$("input[name='riesgo_valor']").val()
			 }, function(res, sta){
			 console.log(res);
			 window.location.href = 'DocumentosScaner';
		 });
		
	}
	
	return true;
}

function finish_finan_data()
{
	if($("input[name='devol_cuenta_bancaria']").val() == "")
	{
		alert("Ingrese el numero de cuenta bancaria de devoluciones");
		return false;
	}
	if($("input[name='devol_cuenta_bancaria']").val().length<7 || $("input[name='numero_tarjeta']").length>16)
	{
		console.log($("input[name='devol_cuenta_bancaria']").val());
		alert("El numero de la cuenta no debe ser mayor de 16 dígitos o menor de 7 dígitos");
		return false;
	}	
	
	if($("select[name='devol_banco']").val() == "")
	{
		alert("Seleccione el banco de devolucion");
		return false;
	}
	
	if($("input[name='devol_nombre_titular']").val() == "")
	{
		alert("Ingrese el nombre de titular de devolución");
		return false;
	}
	
	if($("input[name='devol_iden_titular']").val() == "")
	{
		alert("Ingrese el documento de identidad de titular de devolución");
		return false;
	}
	
	if($("input[name='devol_iden_titular']").val().length<7 || $("input[name='numero_tarjeta']").length>10)
	{
		alert("El numero del documento de identidad debe estar entre los 7 a 10 dígitos");
		return false;
	}
	
	
	
	if(tipo_garantia == "efectivo")
	{			
		 $.post("garantia_efectivo",{
			 "${_csrf.parameterName}":"${_csrf.token}",
			 comprobante_consignacion:$("input[name='comprobante_consignacion']").val(),
			 fecha_consignacion:$("input[name='fecha_consignacion']").val(),
			 devol_tipo_cuenta:$("select[name='devol_tipo_cuenta']").val(),
			 devol_cuenta_bancaria:$("input[name='devol_cuenta_bancaria']").val(),
			 devol_banco:$("select[name='devol_banco']").val(),
			 devol_nombre_titular:$("input[name='devol_nombre_titular']").val(),
			 devol_iden_titular:$("input[name='devol_iden_titular']").val(),
			 valor_congelamiento:$("input[name='valor_efectivo']").val()
			 }, function(res, sta){
			 console.log(res);
			 window.location.href = 'DocumentosScaner';
		 });
	}
	
	
}
</script>
