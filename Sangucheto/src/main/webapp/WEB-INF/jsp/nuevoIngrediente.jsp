<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>Sanguchetto - Nuevo ingrediente</title>
<link href="css/sanguchetto.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/sangucheto">Sanguchetto</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/sangucheto/sanguchetto/armarSanguchetto">Armar Sanguchetto</a></li>
			<li><a href="/sangucheto/stock/verStockIngredientes">Ver stock</a></li>
			<li class="active"><a href="/sangucheto/ingredientes/nuevoIngrediente">Agregar
					ingrediente</a></li>
		</ul>
	</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<legend>Nuevo ingrediente</legend>
				<form:form class="form-horizontal" method="POST"
					action="/ingredientes/guardarIngrediente" commandName="ingrediente">

					<div class="form-group">
						<form:label class="col-md-4 control-label" path="nombre">Nombre</form:label>
						<div class="col-md-4">
							<form:input path="nombre" placeholder="Nombre"
								class="form-control input-md" />
						</div>
						<div class="col-md-4"></div>
					</div>

					<div class="form-group">
						<form:label class="col-md-4 control-label" path="precio">Precio</form:label>
						<div class="col-md-4">
							<form:input path="precio" placeholder="Precio"
								class="form-control input-md" />
						</div>
						<div class="col-md-4"></div>
					</div>

					<div class="form-group">
						<form:label class="col-md-4 control-label" path="tipo">Tipo de ingrediente</form:label>
						<div class="col-md-4">
							<form:select path="tipo" class="form-control">
								<form:options items="${TipoIngrediente}" />
							</form:select>
						</div>
						<div class="col-md-4"></div>
					</div>

					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="btnGuardar"></label>
						<div class="col-md-4">
							<input type="submit" name="btnGuardar" class="btn btn-primary"
								value="Guardar" />
						</div>
						<div class="col-md-4"></div>
					</div>

				</form:form>
			</div>
		</div>
	</div>
</body>
</html>