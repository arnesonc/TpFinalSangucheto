<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>Sanguchetto - Ingredientes disponibles</title>
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/sangucheto">Sanguchetto</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="/sangucheto/sanguchetto/armarSanguchetto">Armar
					Sanguchetto</a></li>
			<li><a
				href="/sangucheto/stock/verStockIngredientes">Ver stock</a></li>
			<li><a href="/sangucheto/ingredientes/nuevoIngrediente">Agregar
					ingrediente</a></li>
		</ul>
	</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<legend>Seleccionar ${tipoIngrediente.name().toLowerCase()}s para agregar a su
					Sanguchetto</legend>
				<div class="col-md-3"></div>

				<div class="col-md-6">
					<c:choose>
						<c:when test="${empty ingredientesDisponibles}">
							<div class="alert alert-info">
								<strong>No hay ${tipoIngrediente.name().toLowerCase()}s disponibles para agregar a
									su Sanguchetto.</strong>
							</div>
						</c:when>
						<c:otherwise>
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Nombre</th>
										<th>Tipo de ingrediente</th>
										<th>Precio</th>
										<th>Agregar</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ingredientesDisponibles}" var="ingrediente">
										<tr>
											<td>${ingrediente.key.nombre}</td>
											<td>${ingrediente.key.tipo}</td>
											<td>AR$ ${ingrediente.key.precio}</td>
											<td><form
													action="/sangucheto/sanguchetto/agregarCantidadIngrediente"
													method="POST">
													<input type="hidden" name="nombre"
														value="${ingrediente.key.nombre}"> <input
														class="btn btn-primary" type="submit"
														name="btnAgregarCantidadIngrediente" value="Agregar" />
												</form></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</div>
</body>
</html>