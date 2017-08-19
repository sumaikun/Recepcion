<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<section id="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>ADMINISTRADOR</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 portfolio-item">
                    <a href="/app/admin/users" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>                        
                        <img src="<c:url value="/resources/theme1/images/admin/users.png"/>" class="img-responsive" alt="">
             		</a>
         		</div>
	         	<div class="col-sm-4 portfolio-item">
		             <a href="#portfolioModal2" class="portfolio-link" data-toggle="modal">
		                 <div class="caption">
		                     <div class="caption-content">
		                         <i class="fa fa-search-plus fa-3x"></i>
		                     </div>
		                 </div>
		                 <img src="<c:url value="/resources/theme1/images/portafolio/cake.png"/>" class="img-responsive" alt="">
		             </a>
	         	</div>
		         <div class="col-sm-4 portfolio-item">
		             <a href="#portfolioModal3" class="portfolio-link" data-toggle="modal">
		                 <div class="caption">
		                     <div class="caption-content">
		                         <i class="fa fa-search-plus fa-3x"></i>
		                     </div>
		                 </div>
		                 <img src="<c:url value="/resources/theme1/images/portafolio/circus.png"/>" class="img-responsive" alt="">
		             </a>
		         </div>
        	</div>
    	</div>
</section>


