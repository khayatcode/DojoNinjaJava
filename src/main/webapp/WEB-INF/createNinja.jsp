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
<title>Create Ninja</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-3">
		<div class="bg-secondary rounded p-3">
			<div class="d-flex justify-content-around mb-3">
				<h1 class="text-white">New Ninja:</h1>
				<div class="d-flex gap-3">
					<a href="/allDojos" class="btn btn-outline-light h-75">View Dojo's</a>
					<a href="/dojo/new" class="btn btn-outline-light h-75">Create Dojo</a>
				</div>
			</div>
			<form:form action="/createNinja" method="post" modelAttribute="ninja">
				<div class="mb-3">
					<form:label path="dojo" class="form-label text-white">Dojo:</form:label>
					<div class="mb-3">
						<form:errors path="dojo" class="text-danger"/>
					</div>
					<form:select path="dojo" class="form-select">
					<!-- Disables -->
						<option value="" disabled selected>--Select Dojo--</option>
						<c:forEach var="dojo" items="${dojos}">
							<option value="${dojo.id}">${dojo.name}</option>
						</c:forEach>
					</form:select>
				</div>
				<div class="mb-3">
					<form:label path="firstName" class="form-label text-white">First Name:</form:label>
					<div class="mb-3">
						<form:errors path="firstName" class="text-danger"/>
					</div>
					<form:input path="firstName" class="form-control"/>
				</div>
				<div class="mb-3">
					<form:label path="lastName" class="form-label text-white">Last Name:</form:label>
					<div class="mb-3">
						<form:errors path="lastName" class="text-danger"/>
					</div>
					<form:input path="lastName" class="form-control"/>
				</div>
				<div class="mb-3">
					<form:label path="age" class="form-label text-white">Age:</form:label>
					<div class="mb-3">
						<form:errors path="age" class="text-danger"/>
					</div>
					<form:input path="age" class="form-control" type="number"/>
				</div>
				<input type="submit" value="Submit" class="btn btn-primary"/>
			</form:form>
		</div>
	</div>
</body>
</html>