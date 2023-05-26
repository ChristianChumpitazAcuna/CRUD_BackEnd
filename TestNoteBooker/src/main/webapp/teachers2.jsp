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
	
<style type="text/css">
	th{
		font-size: 12px;
		text-align: center;
	}
	
	td{
		font-size:smaller;
	}
</style>

<link rel="stylesheet" src="style.css">

<title>CRUD</title>
</head>

<body>

	<jsp:include page="menu.jsp"></jsp:include>

	<div class="container">

		<h1>CRUD TEACHERS</h1>

		<!-- Card de datos de entrada -->
		<div class="card">
			<div class="card-header">Criterios de Busqueda</div>
			<div class="card-body">
				<form method="post" action="TeacherBuscar2">
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
							<button type="button" class="btn btn-primary mb-3" id="btnBuscar"
								name="btnBuscar">Buscar</button>
						</div>

						<div class="col-sm-2">
							<button type="button" class="btn btn-primary mb-3" id="btnNuevo"
								name="btnNuevo">Nuevo</button>
						</div>

					</div>
				</form>
			</div>
		</div>

		<!-- Card de resultados -->
		<br />

		<div class="card" id="divResultado">
			<div class="card-header">Resultado</div>
			<div class="card-body">

				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>NOMBRE</th>
							<th>APELLIDO</th>
							<th>TIPO DE DOCUMENTO</th>
							<th>NUMERO DE DOCUMENTO</th>
							<th>DIRECCION</th>
							<th>DISTRITO</th>
							<th>FECHA DE NACIMIENTO</th>
							<th>NUMERO DE CELULAR</th>
							<th>EMAIL</th>
							<th>ESTADO</th>
							<th></th>
						</tr>
					</thead>

					<tbody id="detalleTabla">
					</tbody>

				</table>

			</div>
		</div>

		<br />
		<!-- Formulario de edición de registro -->
		<div class="card" id="divRegistro" style="display: none;">
			<div class="card-header" id="tituloRegistro">{accion} NUEVO
				TEACHER</div>
			<div class="card-body">

				<form>
					<input type="hidden" id="accion" name="accion">

					<div class="row mb-3">
						<label for="frmId" class="col-sm-2 col-form-label">ID</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="frmId"
								disabled="disabled" value="0">
						</div>
					</div>

					<div class="row mb-3">
						<label for="frmNombre" class="col-sm-2 col-form-label">Nombre</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="frmNombre">
						</div>
					</div>

					<div class="row mb-3">
						<label for="frmApellido" class="col-sm-2 col-form-label">Apellido</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="frmApellido">
						</div>
					</div>

					<div class="row mb-3">
						<label for="frmTipoDocumento" class="col-sm-2 col-form-label">Tipo
							de documento</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="frmTipoDocumento">
						</div>
					</div>

					<div class="row mb-3">
						<label for="frmNumeroDocumento" class="col-sm-2 col-form-label">Numero
							de documento</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="frmNumeroDocumento">
						</div>
					</div>

					<div class="row mb-3">
						<label for="frmDireccion" class="col-sm-2 col-form-label">Direccion</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="frmDireccion">
						</div>
					</div>

					<div class="row mb-3">
						<label for="frmDistrito" class="col-sm-2 col-form-label">Distrito</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="frmDistrito">
						</div>
					</div>

					<div class="row mb-3">
						<label for="frmFechaNacimiento" class="col-sm-2 col-form-label">Fecha
							de nacimiento</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="frmFechaNacimiento">
						</div>
					</div>

					<div class="row mb-3">
						<label for="frmNumeroCelular" class="col-sm-2 col-form-label">Numero
							de celular</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="frmNumeroCelular">
						</div>
					</div>

					<div class="row mb-3">
						<label for="frmEmail" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="frmEmail">
						</div>
					</div>

					<div class="row mb-3">
						<label for="frmEstado" class="col-sm-2 col-form-label">Estado</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="frmEstado">
						</div>
					</div>

					<button type="button" class="btn btn-primary" id="btnProcesar">Procesar</button>

				</form>

			</div>
		</div>

	</div>

	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<script>
		//Constantes del CRUD
		const ACCION_NUEVO = "NUEVO";
		const ACCION_EDITAR = "EDITAR";
		const ACCION_ELIMINAR = "ELIMINAR";

		//Arreglo de registros
		let arreglo = [];
		
		// Acceder a los controles
		let btnBuscar = document.getElementById("btnBuscar");
		let btnNuevo = document.getElementById("btnNuevo");
		let btnProcesar = document.getElementById("btnProcesar");

		// Programar los controles
		btnBuscar.addEventListener("click", fnBtnBuscar);
		btnNuevo.addEventListener("click", fnBtnNuevo);
		btnProcesar.addEventListener("click", fnBtnProcesar);

		// funcion Editar
		function fnEditar(id) {
			//Preparando el for mulario
			document.getElementById("tituloRegistro").innerHTML = ACCION_EDITAR
					+ " REGISTRO";
			document.getElementById("accion").value = ACCION_EDITAR;
			fnCargarForm(id);
			// Mostrar Formulario
			document.getElementById("divResultado").style.display = "none";
			document.getElementById("divRegistro").style.display = "block";

		}

		// funcion Eliminar
		function fnEliminar(id) {
			//Preparando el formulario
			document.getElementById("tituloRegistro").innerHTML = ACCION_ELIMINAR
					+ " REGISTRO";
			document.getElementById("accion").value = ACCION_ELIMINAR;
			fnCargarForm(id);
			// Mostrar Formulario
			document.getElementById("divResultado").style.display = "none";
			document.getElementById("divRegistro").style.display = "block";

		}

		//funcion fnBtnProcesar
		function fnBtnProcesar() {
			//Preparar los datos
			let datos = "accion=" + document.getElementById("accion").value;
			datos += "&id=" + document.getElementById("frmId").value;
			datos += "&name=" + document.getElementById("frmNombre").value;
			datos += "&last_name="
					+ document.getElementById("frmApellido").value;
			datos += "&document_type="
					+ document.getElementById("frmTipoDocumento").value;
			datos += "&document_number="
					+ document.getElementById("frmNumeroDocumento").value;
			datos += "&adress=" + document.getElementById("frmDireccion").value;
			datos += "&district="
					+ document.getElementById("frmDistrito").value;
			datos += "&birthdate="
					+ document.getElementById("frmFechaNacimiento").value;
			datos += "&cell_phone="
					+ document.getElementById("frmNumeroCelular").value;
			datos += "&email=" + document.getElementById("frmEmail").value;
			datos += "&status=" + document.getElementById("frmEstado").value;

			// Envio con AJAX
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "TeacherProcesar", true);
			xhr.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					// La solicitud se completó correctamente
					console.log(xhr.responseText);
					alert(xhr.responseText);
				}
			};
			xhr.send(datos);
		}

		// Funcion fnBtnNuevo
		function fnBtnNuevo() {
			//Preparando el formulario
			document.getElementById("tituloRegistro").innerHTML = ACCION_NUEVO
					+ " REGISTRO";
			document.getElementById("accion").value = ACCION_NUEVO;
			// Mostrar Formulario
			document.getElementById("divResultado").style.display = "none";
			document.getElementById("divRegistro").style.display = "block";

		}

		// Funcion fnBtnBuscar
		function fnBtnBuscar() {
			// Datos
			let last_name = document.getElementById("last_name").value;
			let name = document.getElementById("name").value;
			let url = "TeacherBuscar2?last_name=" + last_name + "&name=" + name;
			// La llama AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", url, true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					let detalleTabla = "";
					arreglo
							.forEach(function(item) {
								detalleTabla += "<tr>";
								detalleTabla += "<td>" + item.id + "</td>";
								detalleTabla += "<td>" + item.name + "</td>";
								detalleTabla += "<td>" + item.last_name
										+ "</td>";
								detalleTabla += "<td>" + item.document_type
										+ "</td>";
								detalleTabla += "<td>" + item.document_number
										+ "</td>";
								detalleTabla += "<td>" + item.adress + "</td>";
								detalleTabla += "<td>" + item.district
										+ "</td>";
								detalleTabla += "<td>" + item.birthdate
										+ "</td>";
								detalleTabla += "<td>" + item.cell_phone
										+ "</td>";
								detalleTabla += "<td>" + item.email + "</td>";
								detalleTabla += "<td>" + item.status + "</td>";
								detalleTabla += "<td>";
								detalleTabla += "<a href='javascript: fnEditar("
										+ item.id + ");'>Editar</a> ";
								detalleTabla += "<a href='javascript: fnEliminar("
										+ item.id + ");'>Eliminar</a>";
								detalleTabla + "</td>";
								detalleTabla += "</tr>";
							});
					document.getElementById("detalleTabla").innerHTML = detalleTabla;
					document.getElementById("divResultado").style.display = "block";
					document.getElementById("divRegistro").style.display = "none";
				}
			};
			xhttp.send();

		}
		
		function fnCargarForm(id){
			arreglo.forEach(function(item){
				if (item.id == id) {
					document.getElementById("frmId").value = item.id;
					document.getElementById("frmNombre").value = item.name;
					document.getElementById("frmApellido").value = item.last_name;
					document.getElementById("frmTipoDocumento").value = item.document_type;
					document.getElementById("frmNumeroDocumento").value = item.document_number;
					document.getElementById("frmDireccion").value = item.adress;
					document.getElementById("frmDistrito").value = item.district;
					document.getElementById("frmFechaNacimiento").value = item.birthdate;
					document.getElementById("frmNumeroCelular").value = item.cell_phone;
					document.getElementById("frmEmail").value = item.email;
					document.getElementById("frmEstado").value= item.status;
				}
			});
			
		}
	</script>

</body>

</html>