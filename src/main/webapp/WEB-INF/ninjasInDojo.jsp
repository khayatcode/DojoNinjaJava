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
<title>All Ninjas in Dojo</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-3">
		<div class="d-flex justify-content-around mb-3">
			<h1><c:out value="${dojo.name}"/> Location Ninjas: </h1>
			<div class="d-flex gap-3">
				<a href="/dojo/new" class="btn btn-success h-75">Create Dojo</a>
				<a href="/ninja/new" class="btn btn-info h-75">Create Ninja</a>
			</div>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Age</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ninja" items="${dojo.ninjas}">
					<tr>
						<td>
							<c:out value="${ninja.firstName}"/>
						</td>
						<td>
							<c:out value="${ninja.lastName}"/>
						</td>
						<td>
							<c:out value="${ninja.age}"/>
						</td>
					</tr>
				</c:forEach>
			</tbody>		
		</table>
	</div>
</body>
</html>