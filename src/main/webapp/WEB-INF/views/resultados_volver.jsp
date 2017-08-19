 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  
  
<br>
<br>
 <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
  <script src="https://use.fontawesome.com/ba7765318c.js"></script>

<section class="content">
<c:if test="${ process == 'success' }">
<div class="jumbotron">
  <div class="container text-center">
    <h1><span class="text-success">Operación exitosa! </span> <i class="fa fa-check-circle"></i></h1>
    <p><strong>${message}</strong></p>
    <p><a href="${prevurl}" class="btn btn-primary btn-lg" role="button"> <i class="fa fa-reply-all"></i> <strong>Volver</strong></a></p>
  </div>
</div>
</c:if>

<c:if test="${ process != 'success' }">
<div class="jumbotron">
  <div class="container text-center">
    <h1><span class="text-danger">hoo! Tenemos un problema </span> <i class="fa fa-times"></i></h1>
    <p><strong>${message}</strong></p>
    <p><a href="${prevurl}" class="btn btn-primary btn-lg" role="button"> <i class="fa fa-reply-all"></i> <strong>Volver</strong></a></p>
  </div>
</div>
</c:if>

</section>