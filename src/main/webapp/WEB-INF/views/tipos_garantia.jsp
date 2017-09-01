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
                     <span class="name" ><font color="#424242">Tipos de garantia</font></span>
                 	 <hr class="star-light">                	 
                 </div>
             </div>
             <div class="col-lg-4 col-md-4"><button data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-lg">Tarjeta de crédito</button></div>
           	 <div class="col-lg-4 col-md-4"><button data-toggle="modal" data-target="#myModal2" class="btn btn-primary btn-lg">Consignación en efectivo</button></div>
           	 <div class="col-lg-4 col-md-4"><button data-toggle="modal" data-target="#myModal3" class="btn btn-primary btn-lg">Todo riesgo no reembolsable</button></div>
         </div>
     </div>
</header>
  
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
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
		      <legend>Valor: 	$100,000</legend> 
		     
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-number">Numero de Tarjeta</label>
		        <div class="col-sm-9">
		          <input type="number" maxlength="10" class="form-control num" name="card-number" id="card-number" placeholder="Numero de tarjeta">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="expiry-month">Fecha de expiración</label>
		        <div class="col-sm-9">
		          <div class="row">
		            <div class="col-xs-3">
		              <select class="form-control col-sm-2" name="expiry-month" id="expiry-month">
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
		              <select class="form-control" name="expiry-year">
		                <option value="13">2013</option>
		                <option value="14">2014</option>
		                <option value="15">2015</option>
		                <option value="16">2016</option>
		                <option value="17">2017</option>
		                <option value="18">2018</option>
		                <option value="19">2019</option>
		                <option value="20">2020</option>
		                <option value="21">2021</option>
		                <option value="22">2022</option>
		                <option value="23">2023</option>
		              </select>
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="cvv">CVV</label>
		        <div class="col-sm-3">
		          <input type="number" maxlength="3" class="form-control num" name="cvv" id="cvv" placeholder="Security Code">		           
		        </div>
		      </div>
		       <img class="pull-right" src="http://www.domyownpestcontrol.com/images/securitycode.jpg" alt="Smiley face" height="150" width="150" style="margin-top:-110px;">
		    </fieldset>
		  </form>
		  
		 
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-success" onclick="devoluciones('credito')">Guardar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<!-- Modal -->
<div id="myModal2" class="modal fade" role="dialog">
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
		      <legend>Valor de garantia: 	$300,000</legend> 
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-holder-name">Numero de comprobante de consignación</label>
		        <div class="col-sm-9">
		          <input type="number" class="form-control num" name="card-holder-name" id="card-holder-name" placeholder="Comprobante de consignación">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-number">Fecha de consignación</label>
		        <div class="col-sm-9">
		          <input class="form-control" type="date">
		        </div>
		      </div>		     
		    </fieldset>
		  </form>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-success" onclick="devoluciones('efectivo')">Guardar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<!-- Modal -->
<div id="myModal3" class="modal fade" role="dialog">
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
		      <legend>Valor de garantia: $64,960,000</legend> 
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-holder-name">Numero de comprobante de consignación</label>
		        <div class="col-sm-9">
		          <input type="number" class="form-control num" name="card-holder-name" id="card-holder-name" placeholder="Comprobante de consignación">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-number">Fecha de consignación</label>
		        <div class="col-sm-9">
		          <input class="form-control" type="date">
		        </div>
		      </div>		     
		    </fieldset>
		  </form>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-success" onclick="devoluciones('riesgo')">Guardar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<!-- Modal -->
<div id="myModal4" class="modal fade" role="dialog">
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
		          <input type="number" class="form-control num" name="card-holder-name" id="card-holder-name" placeholder="Número de cuenta sin separadores">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-number">Tipo de cuenta</label>
		        <div class="col-sm-9">
		          <select name="devol_tipo_cuenta" class="form-control" id="tipo">
		          	<option value="">Selecciona</option>
		          	<option value="A">Ahoros</option>
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
		          <input type="text" class="form-control keyboard" name="card-holder-name"  placeholder="Nombre del titular">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-holder-name">Identificación</label>
		        <div class="col-sm-9">
		          <input type="number" class="form-control num" name="card-holder-name" id="card-holder-name" placeholder="Número de cuenta sin separadores">
		        </div>
		      </div>			     
		    </fieldset>
		  </form>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-success">Enviar información</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<script>
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

function devoluciones(tipo)
{
	
	$("#myModal4").modal('show');
}
</script>
