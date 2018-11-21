<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>	

	<c:choose>
		<c:when test="${personne.getClass().simpleName=='Formateur' }">
			<c:url value="saveFormateur" var="action"></c:url>
		</c:when>

		<c:otherwise>
			<c:url value="saveStagiaire" var="action"></c:url>
		</c:otherwise>
	</c:choose>



	<div class="container">
		<fieldset>
			<legend> edition de personne</legend>
			<form:form action="${action}" method="get" modelAttribute="personne">
				<form:hidden path="version" readonly="readonly" />
				<div class="form-group">
					<form:label path="id">id</form:label>
					<form:input path="id" readonly="true" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<form:label path="titre">titre : </form:label>
					<form:select path="titre" items="${titres}" itemLabel="titre"
						cssClass="form-control"></form:select>
				</div>
				<div class="form-group">
					<form:label path="prenom">prenom : </form:label>
					<form:input path="prenom" cssClass="form-control" />
					<form:errors path="prenom"></form:errors>
				</div>
				<div class="form-group">
					<form:label path="nom">Nom : </form:label>
					<form:input path="nom" cssClass="form-control" />
					<form:errors path="nom"></form:errors>
				</div>
				<div class="form-group">
					<form:label path="dtNaiss">Date de naissance : </form:label>
					<form:input type="date" path="dtNaiss" cssClass="form-control" />
					<form:errors path="dtNaiss"></form:errors>
				</div>
				<div class="form-group">
					<c:choose>
						<c:when test="${personne.getClass().simpleName=='Formateur' }">
							<form:label path="cout"> Cout : </form:label>
							<form:input path="cout" cssClass="form-control"></form:input>
							<form:errors path="cout"></form:errors>
						</c:when>
						<c:otherwise>
							<form:label path="entreprise"> entreprise : </form:label> 
							<form:input path="entreprise" cssClass="form-control"></form:input> 
							<form:errors path="salle"></form:errors>

						</c:otherwise>

					</c:choose>
				</div>
				<div class="form-group">
					<form:label path="salle.numero">Numero de salle : </form:label>
							<form:select path="salle.numero" cssClass="form-control">
								<form:option value="">Pas de salle</form:option>
								<form:options items="${salles}" itemLabel="nom" itemValue="numero"  />
							</form:select>
					<form:errors path="salle.numero"></form:errors>
				</div>
				<div>
					<button class="btn btn-success" type="submit">Sauvegarder</button>
					<a class="btn btn-danger" href="./">Annuler</a>
					<!-- Remonte d'une page si annulation  -->
				</div>
				<!-- 			<div class="form-group"> -->
				<%-- 				 <form:label path="adresse.numero">Numero : </form:label>  --%>
				<%-- 				 <form:input type="Number" path ="adresse.numero" cssClass="form-control" />  --%>
				<%-- 				 <form:errors path="adresse.numero"></form:errors>  --%>
				<!-- 			</div>  -->

				<!-- 			<div class="form-group"> -->
				<%-- 				 <form:label path="adresse.rue">rue : </form:label>  --%>
				<%-- 				 <form:input path ="adresse.rue" cssClass="form-control" />  --%>
				<%-- 				 <form:errors path="adresse.rue"></form:errors>  --%>
				<!-- 			</div>  -->
				<!-- 			<div class="form-group"> -->
				<%-- 				 <form:label path="adresse.codePostal">Code Postal : </form:label>  --%>
				<%-- 				 <form:input type="Number" path ="adresse.codePostal" cssClass="form-control" />  --%>
				<%-- 				 <form:errors path="adresse.codePostal"></form:errors>  --%>
				<!-- 			</div>  -->
				<!-- 			<div class="form-group"> -->
				<%-- 				 <form:label path="adresse.ville"> ville : </form:label>  --%>
				<%-- 				 <form:input  path ="adresse.ville" cssClass="form-control" />  --%>
				<%-- 				 <form:errors path="adresse.ville"></form:errors>  --%>
				<!-- 			</div>  -->
			</form:form>
		</fieldset>
	</div>

 
</body>
</html>