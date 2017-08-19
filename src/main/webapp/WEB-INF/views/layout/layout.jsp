<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel='stylesheet' href="<c:url value= "/webjars/bootstrap/3.3.7/css/bootstrap.min.css" />" rel="stylesheet">
     <!-- Theme CSS -->
    <link href="<c:url value="/resources/theme1/css/freelancer.min.css"/> " rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/theme1/css/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    
</head>
	<title><tiles:insertAttribute name="title" ignore="true" /></title>  
</head>
	<div><tiles:insertAttribute name="header" /></div>   
	<body>         
        <tiles:insertAttribute name="body" />        
	</body>
	<div style="clear:both"><tiles:insertAttribute name="footer" /></div>
	  
	<script type="text/javascript" src="<c:url value="/webjars/jquery/3.1.1/jquery.min.js"/>" ></script>
	<script type="text/javascript" src="<c:url value="/webjars/bootstrap/3.3.7/js/bootstrap.min.js"/>"></script>
	    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="<c:url value="/resources/theme1/js/jqBootstrapValidation.js"/>" ></script>
    <script src="<c:url value="/resources/theme1/js/contact_me.js"/>" ></script>

    <!-- Theme JavaScript -->
    <script src=<c:url value="/resources/theme1/js/freelancer.min.js"/> ></script>  
</html>  