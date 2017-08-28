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
		      <legend>Payment</legend> <span sytle="position:right;">$100.000.oo MTCE</span>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-holder-name">Name on Card</label>
		        <div class="col-sm-9">
		          <input type="text" class="form-control" name="card-holder-name" id="card-holder-name" placeholder="Card Holder's Name">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-number">Card Number</label>
		        <div class="col-sm-9">
		          <input type="text" class="form-control" name="card-number" id="card-number" placeholder="Debit/Credit Card Number">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="expiry-month">Expiration Date</label>
		        <div class="col-sm-9">
		          <div class="row">
		            <div class="col-xs-3">
		              <select class="form-control col-sm-2" name="expiry-month" id="expiry-month">
		                <option>Month</option>
		                <option value="01">Jan (01)</option>
		                <option value="02">Feb (02)</option>
		                <option value="03">Mar (03)</option>
		                <option value="04">Apr (04)</option>
		                <option value="05">May (05)</option>
		                <option value="06">June (06)</option>
		                <option value="07">July (07)</option>
		                <option value="08">Aug (08)</option>
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
		        <label class="col-sm-3 control-label" for="cvv">Card CVV</label>
		        <div class="col-sm-3">
		          <input type="text" class="form-control" name="cvv" id="cvv" placeholder="Security Code">
		           <img class="pull-right" src="http://www.domyownpestcontrol.com/images/securitycode.jpg" alt="Smiley face" height="42" width="42">
		        </div>
		      </div>
		      <div class="form-group">
		        <div class="col-sm-offset-3 col-sm-9">
		         
		        </div>
		      </div>
		    </fieldset>
		  </form>
		  
		  
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-success">Pay Now</button>
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
		      <legend>Valor de garantia</legend> <span sytle="position:right;">$300.000.oo MTCE</span>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-holder-name">Numero de comprobante de consignación</label>
		        <div class="col-sm-9">
		          <input type="text" class="form-control" name="card-holder-name" id="card-holder-name" placeholder="Comprobante de consignación">
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-3 control-label" for="card-number">Card Number</label>
		        <div class="col-sm-9">
		          <input type="text" class="form-control" name="card-number" id="card-number" placeholder="Debit/Credit Card Number">
		        </div>
		      </div>
		      
		      <div class="form-group">
		        <div class="col-sm-offset-3 col-sm-9">
		         
		        </div>
		      </div>
		    </fieldset>
		  </form>
      </div>
      <div class="modal-footer">
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
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
