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
 <script>
	 var time = new Date().getTime();
	 $(document.body).bind("mousemove keypress", function(e) {
		 console.log("Move");
	     time = new Date().getTime();
	 });
	
	 function refresh() {
	     if(new Date().getTime() - time >= 420000)
	    	 window.location.href = "/app";
	         //window.location.reload(true);
	     else 
	         setTimeout(refresh, 10000);
	 }
	
	 setTimeout(refresh, 10000);
 	 
	 
	 $(window).resize(function() {
	       if(screen.width == window.innerWidth){
	           console.log("you are on normal page with 100% zoom");
	       } else if(screen.width > window.innerWidth){
	    	   //screen.width = window.innerWidth;
	    	   console.log("you have zoomed in the page i.e more than 100%");
	       } else {
	    	   //screen.width = window.innerWidth;
	    	   console.log("you have zoomed out i.e less than 100%")
	       }
    });
	
	 $(window).bind('mousewheel DOMMouseScroll', function (event) {
	       if (event.ctrlKey == true) {
	       event.preventDefault();
	       }
	});
	 
	 window.addEventListener('touchmove', ev => {		 
		    ev.preventDefault();
		    ev.stopImmediatePropagation();
		 
		}, { passive: false });
	 
	 
</script>