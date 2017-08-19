 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  
  
 <link href="<c:url value="/resources/theme1/css/login.css"/> " rel="stylesheet">
 
<c:if test="${ sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message == 'Bad credentials' }">
	<div class="alert alert-warning alert-dismissible" role="alert">
  		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  		<strong>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</strong>  
	</div> 
</c:if>

 <div class="wrapper">
 	<c:url var="addAction" value="/j_spring_security_check" ></c:url>
	<form:form action="${addAction}"  class="form-signin" method="POST">
		<h2 class="form-signin-heading">Please login</h2>
     	<input type="text" class="form-control" name="email" placeholder="Email Address" autofocus="" />
     	<input type="password" class="form-control" name="password" placeholder="Password" />      
     	<label class="checkbox">
       <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me
     	</label>
     	<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
     	<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>	
	</form:form>        
 </div>
