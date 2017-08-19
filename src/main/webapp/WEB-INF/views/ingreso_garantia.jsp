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
	                 	 <input class="form-control" type="text" name="placa" required>
	                 	 <label><span class="skills"><font color="#424242">Telefono registrado</font></span></label>
	                 	 <input class="form-control" type="number" name="declarante_celular" required>
	                 	 <button class="btn btn-primary btn-outline btn-lg"><span class="skills">CONTINUAR</span></span></button>	
                 	</form:form>
                 </div>
             </div>
         </div>
     </div>
</header>
  

