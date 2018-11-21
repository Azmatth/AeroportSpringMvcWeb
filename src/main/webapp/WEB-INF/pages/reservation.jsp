<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>listSalles</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<table class="table">
		<tr>
			<th>id</th>
			<th>Numéro de la réservation</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach var="salle" items="${reservations}">
			<tr>
				<td>${reservation.numeroReservation}</td>
				<td><fmt:formatDate value="${reservation.dateReservation}"
						pattern="dd/MM/yyyy" /></td>
				<td><a class="btn btn-warning"
					href="./edit?numeroReservation=${reservation.numeroReservation}">Edit</a></td>
				<td><a class="btn btn-danger"
					href="./deleteSalle?numeroReservation=${reservation.numeroReservation}">Delete</a></td>

			</tr>
		</c:forEach>
	</table>
	<a class="btn btn-success" href="./addSalle">New Salle</a>


</body>
</html>