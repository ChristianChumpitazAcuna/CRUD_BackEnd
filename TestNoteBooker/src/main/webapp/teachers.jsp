<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>CRUD</title>
</head>
<body>

	<jsp:include page="menu.jsp"></jsp:include>

	<div class="container">

		<h1>CRUD TEACHERS</h1>

		<!-- Card de datos de entrada -->
		<div class="card">
			<div class="card-header">Criterios de Búsqueda</div>
			<div class="card-body">
				<form method="post" action="TeacherBuscar">
					<div class="mb-3 row">

						<div class="col-sm-4">
							<input type="text" class="form-control" id="last_name"
								name="last_name" placeholder="Apellido">
						</div>

						<div class="col-sm-4">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="Nombre">
						</div>

						<div class="col-sm-2">
							<button type="submit" class="btn btn-primary mb-3" id="btnBuscar"
								name="btnBuscar">Buscar</button>
						</div>

						<div class="col-sm-2">
							<button type="submit" class="btn btn-primary mb-3" id="btnNuevo"
								name="btnNuevo">Nuevo</button>
						</div>

					</div>
				</form>
			</div>
		</div>

		<!-- Card de resultados -->
		<br />
		<c:if test="${ ! empty listado }">
			<div class="card">
				<div class="card-header">Resultado</div>
				<div class="card-body">

					<table class="table">
						<thead>
							<tr>
								<th>ID</th>
								<th>NOMBRE</th>
								<th>APELLIDO</th>
								<th>TIPO DE DOCUMENTO</th>
								<th>NÚMERO DE DOCUMENTO</th>
								<th>DIRECCIÓN</th>
								<th>DISTRITO</th>
								<th>FECHA DE NACIMIENTO</th>
								<th>NÚMERO DE CELULAR</th>
								<th>EMAIL</th>
								<th>ESTADO</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="r" items="${listado}">
								<tr>
									<td>${r.id}</td>
									<td>${r.name}</td>
									<td>${r.last_name}</td>
									<td>${r.document_type}</td>
									<td>${r.document_number}</td>
									<td>${r.adress}</td>
									<td>${r.district}</td>
									<td>${r.birthdate}</td>
									<td>${r.cell_phone}</td>
									<td>${r.email}</td>
									<td>${r.status}</td>
								</tr>

							</c:forEach>

						</tbody>
						
					</table>

				</div>
			</div>
		</c:if>

	</div>

	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>