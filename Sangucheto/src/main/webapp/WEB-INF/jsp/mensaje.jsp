<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/sanguchetto.css" rel="stylesheet">
<title>Sanguchetto</title>
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/sangucheto">Sanguchetto</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/sangucheto/sanguchetto/armarSanguchetto">Armar
					Sanguchetto</a></li>
			<li><a href="/sangucheto/stock/verStockIngredientes">Ver
					stock</a></li>
			<li><a
				href="/sangucheto/ingredientes/nuevoIngrediente">Agregar
					ingrediente</a></li>
		</ul>
	</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<c:if test="${!empty mostrarVolver && mostrarVolver == true}">
						<input id="btnMensajeVolver" type="button" class="btn btn-default"
							value="Volver" />
					</c:if>
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="col-md-4"></div>

				<div class="col-md-4">
					<div class="alert alert-info marginTop">
						<strong>${mensaje}</strong>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../js/sanguchetto.js"></script>
</body>
</html>