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
<title>Sanguchetto - Resumen</title>
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
			<li><a href="/sangucheto/ingredientes/nuevoIngrediente">Agregar
					ingrediente</a></li>
		</ul>
	</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>Gracias por comprar en Sanguchetto!</h2>
			</div>
			<div class="col-md-6 text-right">
				<h2>Total: AR$ ${total}</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-6">
					<h4>Ingredientes del Sanguchetto</h4>
					<table class="table table-striped table-bordered marginTop">
						<thead>
							<tr>
								<th>Nombre</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listaIngredientes}" var="ingrediente">
								<tr>
									<td>${ingrediente.nombre}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-md-6">
					<h4>Condimentos del Sanguchetto</h4>
					<table class="table table-striped table-bordered marginTop">
						<thead>
							<tr>
								<th>Nombre</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listaCondimentos}" var="condimento">
								<tr>
									<td>${condimento.nombre}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>