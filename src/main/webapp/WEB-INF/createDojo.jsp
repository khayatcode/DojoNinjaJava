<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Dojo</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-3">
		<div class="bg-secondary rounded p-3">
			<div class="d-flex justify-content-around mb-3">
				<h1 class="text-white">Create New Dojo:</h1>
				<div class="d-flex gap-3">
					<a href="/allDojos" class="btn btn-outline-light h-75">View Dojo's</a>
					<a href="/ninja/new" class="btn btn-outline-light h-75">Create Ninja</a>
				</div>
			</div>
			
			<form:form action="/createDojo" method="post" modelAttribute="dojo">
				<div class="mb-3">
					<form:label path="name" class="form-label text-white">Name:</form:label>
					<div class="mb-3">
						<form:errors path="name" class="text-danger"/>
					</div>
					<form:input path="name" class="form-control"/>
				</div>
				<input type="submit" value="Submit" class="btn btn-primary"/>		
			</form:form>
		</div>
	</div>
</body>
</html>