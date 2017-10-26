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
	
	.form-control{
		max-width:300px !important;
	}
	
	.col-centered{
	    margin: 0 auto !important;
	    float: none !important;
	}
	
</style>
 

<br>
<br>
<header id="home">
	 <div class="container">
         <div class="row">
             <div class="col-lg-12">                 
                 <div class="intro-text">
                 	<c:url var="addAction" value="BeginProcess.html" ></c:url>
                 	<form:form action="${addAction}" method="POST">
	                     <span class="name" ><font color="#424242">CAPTURA INFORMACION DE GARANTIA</font></span>
	                 	 <label><span class="skills"><font color="#424242">Placa Vehiculo Siniestrado</font></span></label>
	                 	 <input class="form-control col-centered" id="keyboard" type="text" name="placa" placeholder="JVX777" autocomplete="off" required>
	                 	 <label><span class="skills"><font color="#424242">Telefono registrado</font></span></label>
	                 	 <input class="form-control col-centered" id="num" type="number" placeholder="3006363777" name="declarante_celular" autocomplete="off" required>
	                 	 <button class="btn btn-primary btn-outline btn-lg"><span class="skills">CONTINUAR</span></span></button>	
                 	</form:form>
                 </div>
             </div>
         </div>
     </div>
</header>



 <script>
 $( document ).ready(function() {
	 var y = $(window).scrollTop();
	 //alert(y + ($(window).height())/4);
	 //console.log()
	 //$("html, body").animate({ scrollTop: y + ($(window).height())/4 }, 600);
	 $("html, body").animate({ scrollTop:  164.75}, 600);
	 //$('html,body').animate({ scrollTop: 5555 }, 'slow');
	 
	 $('#keyboard').keyboard({
			layout : 'spanish-qwerty',
			restrictInput : true, 
			preventPaste : true,  
			autoAccept : true
		});

	 $('#num').keyboard({
		layout : 'num',
		restrictInput : true, 
		preventPaste : true,  
		autoAccept : true
	});
	 	 
	
 });

 </script>

