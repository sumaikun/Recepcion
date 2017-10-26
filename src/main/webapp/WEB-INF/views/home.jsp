<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<br>
<br>
<header id="home">
	 <div class="container">
         <div class="row">
             <div class="col-lg-12">
                 <img class="img-responsive" src="<c:url value="/resources/theme1/images/profile.png" />" alt="">
                 <div class="intro-text">
                     <span class="name" ><font color="#424242">Bienvenidos</font></span>
                     <hr class="star-light">
                     <span class="skills"><font color="#424242">Administración operativa Automotriz</font></span>
                     <br>
                 	 <a href="/app/IngresoGarantia" class="btn btn-primary btn-outline btn-lg"><span class="skills">INGRESAR</span></span></a>	
                 </div>
             </div>
         </div>
     </div>
</header>
<!--  
<a href="/app/TestBD2"><button class="btn btn-danger form-control">Test Data Base</button></a>
<a href="/app/Testfileservice"><button class="btn btn-warning form-control">Web service Test</button></a>
<button class="btn btn-warning form-control" onclick="phpservice2()">Web service Test2</button>
-->

<script>
	$( document ).ready(function() {
		$("html, body").animate({ scrollTop:  175.75}, 600);
	});
	
	function phpservice()
	{
		 $.get("http://app.aoacolombia.com/Control/operativo/controllers/RecepcionController.php", function(res, sta){
			 alert(res);
		 });
	}
	
	function phpservice2()
	{
		 $.post("http://app.aoacolombia.com/Control/operativo/controllers/RecepcionController.php",{check64:1}, function(res, sta){
			 console.log(res);
		 });
	}
</script>