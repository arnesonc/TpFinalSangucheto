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
			<li class="active"><a
				href="/sangucheto/sanguchetto/armarSanguchetto">Armar
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
			<div class="col-md-12">
				<legend>Armar Sanguchetto</legend>

				<div class="col-md-6">
					<h4>Ingredientes del Sanguchetto</h4>
					<div>
						<form action="/sangucheto/sanguchetto/nuevoIngredienteSanguchetto"
							method="POST">
							<input type="hidden" name="tipo" value="ingrediente"> <input
								class="btn btn-primary" type="submit"
								name="btnAgregarIngrediente" value="Agregar ingrediente" />
						</form>
					</div>
					<c:choose>
						<c:when test="${empty ingredientesAgregados}">
							<div class="alert alert-info marginTop">
								<strong>Aún hay ingredientes de tipo ingrediente
									agregados a su Sanguchetto.</strong>
							</div>
						</c:when>
						<c:otherwise>
							<table class="table table-striped table-bordered marginTop">
								<thead>
									<tr>
										<th>Nombre</th>
										<th>Tipo de ingrediente</th>
										<th>Precio</th>
										<th>Unidades</th>
										<th>Precio final</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ingredientesAgregados}"
										var="stockIngrediente">
										<tr>
											<td>${stockIngrediente.key.nombre}</td>
											<td>${stockIngrediente.key.tipo}</td>
											<td>AR$ ${stockIngrediente.key.precio}</td>
											<td>${stockIngrediente.value}</td>
											<td>AR$ ${stockIngrediente.value * stockIngrediente.key.precio}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-6">
					<h4>Condimentos del Sanguchetto</h4>
					<div>
						<form action="/sangucheto/sanguchetto/nuevoIngredienteSanguchetto"
							method="POST">
							<input type="hidden" name="tipo" value="condimento"> <input
								class="btn btn-primary" type="submit"
								name="btnAgregarIngrediente" value="Agregar condimento" />
						</form>
					</div>
					<c:choose>
						<c:when test="${empty condimentosAgregados}">
							<div class="alert alert-info marginTop">
								<strong>Aún hay ingredientes de tipo condimento
									agregados a su Sanguchetto.</strong>
							</div>
						</c:when>
						<c:otherwise>
							<table class="table table-striped table-bordered marginTop">
								<thead>
									<tr>
										<th>Nombre</th>
										<th>Tipo de ingrediente</th>
										<th>AR$ Precio</th>
										<th>Unidades</th>
										<th>Precio final</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${condimentosAgregados}"
										var="stockIngrediente">
										<tr>
											<td>${stockIngrediente.key.nombre}</td>
											<td>${stockIngrediente.key.tipo}</td>
											<td>${stockIngrediente.key.precio}</td>
											<td>${stockIngrediente.value}</td>
											<td>AR$ ${stockIngrediente.value * stockIngrediente.key.precio}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="row marginTop">
			<div class="col-md-12 text-right marginTop">
				<div class="col-md-9"></div>
				<div class="col-md-3 total"><h3>Total: AR$ ${total}</h3></div>
			</div>
		</div>
		<div class="row marginTop">
			<div class="col-md-12 text-right">
				<div class="col-md-9"></div>
				<div class="col-md-3">
					<a href="/sangucheto/sanguchetto/comprarSanguchetto" class="btn btn-success">Comprar</a>
					<a href="/sangucheto/sanguchetto/cancelarSanguchetto" class="btn btn-default marginLeft">Cancelar</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>