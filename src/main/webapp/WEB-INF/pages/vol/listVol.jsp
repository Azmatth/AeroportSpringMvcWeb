<%@page import="javax.servlet.descriptor.TaglibDescriptor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste des personnes</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<table class="table">
		<tr>
			<th>id</th>
			<th><spring:message  code="personne.list.prenom"></spring:message></th>
			<th><spring:message  code="personne.list.nom"></spring:message></th>
			<th> Date de naissance</th>
			<th>cout</th>
			<th>Entreprise</th>
			<th>Salle</th>
			<th>Editer </th>
			<th> Supprimer</th>

		</tr>
		<c:forEach var="personne" items="${personnes}">
			<tr>
				<td>${personne.id }</td>
				<td>${personne.prenom }</td>
				<td>${personne.nom }</td>
				<td><fmt:formatDate value="${personne.dtNaiss}" pattern="dd/MM/yyyy"/></td> 
				
				<td><c:if test="${personne.getClass().name=='formation_model.Formateur'}">${personne.cout}</c:if>
				</td>
				<td><c:if test="${personne.getClass().simpleName=='Stagiaire'}"> ${personne.entreprise}</c:if>
				</td>
				<td>${personne.salle.numero }</td>
				<td><a class="btn btn-info" href="./edit?id=${personne.id }">Editer</a></td>
				<td><a class="btn btn-danger" href="./delete?id=${personne.id }">Supprimer</a></td>
				
				
				<!--  il ne faut afficher certaines parties de code qu'à certaines conditions : cout si formateur, ordi et entreprise si stagiaire... -->
			</tr>
		</c:forEach>
 
	</table>

	<a class="btn btn-success" href="addFormateur">New Formateur</a>
	<a class="btn btn-success" href="addStagiaire">New Stagiaire</a>

</body>
</html>