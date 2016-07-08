<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Test</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sanguchetto.css" rel="stylesheet">
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
	<div class="container" role="main">
		<div class="row marginTop">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="jumbotron marginTop">
					<div class="container">
						<h2>Bienvenido a Sanguchetto!</h2>
						<p>
							Para comenzar a armar su Sanguchetto diríjase al menú superior y seleccione la opción <strong>Armar Sanguchetto</strong>.
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>

	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.3.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>