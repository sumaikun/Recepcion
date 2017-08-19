 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <!-- Navigation -->
 <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
     <div class="container">
         <!-- Brand and toggle get grouped for better mobile display -->
         <div class="navbar-header page-scroll">
             <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                 <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
             </button>
             <a class="navbar-brand" href="/app/home">Aoa Colombia</a>
         </div>
		
		<!-- Auth instance -->
		  <sec:authorize access="isAuthenticated()">
              <c:set var="authenticated" value="${true}"/>   						
		  </sec:authorize>
         <!-- Collect the nav links, forms, and other content for toggling -->
         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
             <ul class="nav navbar-nav navbar-right">
                 <li class="hidden">
                     <a href="#page-top"></a>
                 </li>
                 <li class="page-scroll">
                 	<c:if test="${authenticated}">
                     	<a href="/app/admin/panel">ADMINISTRADOR</a>
                     </c:if>
                     <!--  
                 	<c:if test="${!authenticated}">
                     	<!--<a href="#portfolio">Camara</a>-->
                     	<!--<a href="/app/camera">Camara</a>
                     </c:if>
                     -->
                 </li>
                 <!--
                 <li class="page-scroll">
                 	<c:if test="${!authenticated}">
                     	<!-- <a href="#about">Scanner</a> -->
                     	<!--<a href="/app/scanner">Scanner</a>
                    </c:if> 
                 </li>
                 <li class="page-scroll">
                 	<c:if test="${!authenticated}">
                     	<!-- <a href="#about">Scanner</a> -->
                     	<!--<a href="/app/scanner2">Scanner2</a>
                    </c:if> 
                 </li>
                 <li class="page-scroll">
                     <c:if test="${!authenticated}">
                     	<a href="#contact">Formularios</a>
                     </c:if>	
                 </li>
                 <li class="page-scroll">                   
					 <c:if test="${authenticated}">
						<a href="<c:url value="/logout"/>">Logout</a>
					</c:if>
					
					<c:if test="${!authenticated}">
						<a href="/app/login">Login</a>
					</c:if>
                 </li>-->
             </ul>
         </div>
         <!-- /.navbar-collapse -->
     </div>
     <!-- /.container-fluid -->
 </nav>

 <!-- Header -->
 <header>
    <br> <br>
 </header>