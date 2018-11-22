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
    <div class="container">
        <fieldset>
            <legend>Connexion</legend> 
            <form:form action="connexion" method="get" modelAttribute="client">   
                  
                <div class="form-group">
                    <form:label path="mail">mail</form:label>
                    <form:input path="mail" cssClass="form-control" />
                    <form:errors path="mail"></form:errors>
                </div> 
                <div class="form-group">
                    <form:label path="adresse.codePostal">code postal</form:label>
                    <form:input path="adresse.codePostal" cssClass="form-control" />
                    <form:errors path="adresse.codePostal"></form:errors>
                </div>   
                <div>
                    <button class="btn btn-success" type="submit">enregistrer</button>
                    <a class="btn btn-warning" href="./">annuler</a>
                </div>
            </form:form>
        </fieldset>
    </div>
</body>
</html>