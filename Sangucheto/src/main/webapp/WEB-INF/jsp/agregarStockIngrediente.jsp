<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>Sanguchetto - Agregar stock a ingrediente</title>
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
				<legend>Agregar stock a ingrediente</legend>
				<form:form class="form-horizontal" method="POST"
					action="/stock/guardarStockIngrediente" commandName="ingrediente">

					<div class="form-group">
						<label class="col-md-3 control-label" >Nombre</label>
						<div class="col-md-3">
							<input type="text" laceholder="Nombre"
								class="form-control input-md" value="${ ingrediente.nombre }" disabled="true" />
						</div>
						<div class="col-md-3"></div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">Precio</label>
						<div class="col-md-3">
							<input type="text" placeholder="Precio"
								class="form-control input-md" value="${ ingrediente.precio }" disabled="true" />
						</div>
						<div class="col-md-3"></div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">Tipo de ingrediente</label>
						<div class="col-md-3">
							<input type="text" placeholder="Tipo"
								class="form-control input-md" value="${ ingrediente.tipo }" disabled="true" />
						</div>
						<div class="col-md-3"></div>
					</div>
					
					<input type="hidden" name="nombre" value="${ingrediente.nombre}">
					
					<div class="form-group">
						<label class="col-md-3 control-label" >Cantidad</label>
						<div class="col-md-3">
							<input type="number" name="cantidad" placeholder="Cantidad"
								class="form-control input-md" />
						</div>
						<div class="col-md-3"></div>
					</div>

					<!-- Button -->
					<div class="form-group">
						<label class="col-md-3 control-label" for="btnGuardarStockIngrediente"></label>
						<div class="col-md-3">
							<input type="submit" name="btnGuardarStockIngrediente" class="btn btn-primary"
								value="Guardar" />
						</div>
						<div class="col-md-3"></div>
					</div>

				</form:form>
			</div>
		</div>
	</div>
</body>
</html>