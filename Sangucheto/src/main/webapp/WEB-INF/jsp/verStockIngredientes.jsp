<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
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
			<li class="active"><a
				href="/sangucheto/stock/verStockIngredientes">Ver stock</a></li>
			<li><a href="/sangucheto/ingredientes/nuevoIngrediente">Agregar
					ingrediente</a></li>
		</ul>
	</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<legend>Ver stock ingredientes</legend>
				<div class="col-md-3"></div>
				
				<div class="col-md-6">
					<c:choose>
						<c:when test="${empty listaStockIngredientes}">
							<div class="alert alert-info">
								<strong>No hay ingredientes agregados para mostrar su
									stock disponible.</strong>
							</div>
						</c:when>
						<c:otherwise>
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Nombre</th>
										<th>Precio</th>
										<th>Tipo de ingrediente</th>
										<th>Stock</th>
										<th>Agregar stock</th>
										<th>Eliminar</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listaStockIngredientes}"
										var="stockIngrediente">
										<tr>
											<td>${stockIngrediente.key.nombre}</td>
											<td>${stockIngrediente.key.precio}</td>
											<td>${stockIngrediente.key.tipo}</td>
											<td>${stockIngrediente.value}</td>
											<td><form
													action="/sangucheto/stock/agregarStockIngrediente"
													method="POST">
													<input type="hidden" name="nombre"
														value="${stockIngrediente.key.nombre}"> <input
														class="btn btn-primary" type="submit"
														name="btnAgregarStock" value="Agregar stock" />
												</form></td>
											<td><form action="/sangucheto/stock/eliminarIngrediente"
													method="POST">
													<input type="hidden" name="nombre"
														value="${stockIngrediente.key.nombre}"> <input
														class="btn btn-danger" type="submit"
														name="btnEliminarIngrediente" value="Eliminar" />
												</form></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-3	"></div>
			</div>
		</div>
	</div>
</body>
</html>