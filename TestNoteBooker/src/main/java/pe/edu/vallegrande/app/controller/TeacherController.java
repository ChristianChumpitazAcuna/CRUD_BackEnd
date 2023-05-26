package pe.edu.vallegrande.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import pe.edu.vallegrande.app.model.Teacher;
import pe.edu.vallegrande.app.service.CrudTeacherService;

@WebServlet({ "/TeacherBuscar", "/TeacherBuscar2", "/TeacherProcesar" })
public class TeacherController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CrudTeacherService service = new CrudTeacherService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/TeacherBuscar":
			buscar(request, response);
			break;
		case "/TeacherBuscar2":
			buscar2(request, response);
			break;

		case "/TeacherProcesar":
			procesar(request, response);
			break;
		}

	}

	private void procesar(HttpServletRequest request, HttpServletResponse response) {
		// Datos
		String accion = request.getParameter("accion");
		Teacher bean = new Teacher();
		bean.setId(Integer.parseInt(request.getParameter("id")));
		bean.setName(request.getParameter("name"));
		bean.setLast_name(request.getParameter("last_name"));
		bean.setDocument_type(request.getParameter("document_type"));
		bean.setDocument_number(request.getParameter("document_number"));
		bean.setAdress(request.getParameter("adress"));
		bean.setDistrict(request.getParameter("district"));
		bean.setBirthdate(request.getParameter("birthdate"));
		bean.setCell_phone(request.getParameter("cell_phone"));
		bean.setEmail(request.getParameter("email"));
		bean.setStatus(request.getParameter("status"));
		// Proceso
		try {
			switch (accion) {
			case ControllerUtil.CRUD_NUEVO:
				service.insert(bean);
				break;

			case ControllerUtil.CRUD_EDITAR:
				service.update(bean);
				break;

			case ControllerUtil.CRUD_ELIMINAR:
				service.delete(bean.getId().toString());
				break;

			default:
				throw new IllegalArgumentException("Unexpected value: " + accion);
			}
			ControllerUtil.responseJson(response, "Proceso Ok");

		} catch (Exception e) {
			ControllerUtil.responseJson(response, e.getMessage());
		}
	}

	private void buscar2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// Datos
		String last_name = request.getParameter("last_name");
		String name = request.getParameter("name");
		// Proceso
		Teacher bean = new Teacher();
		bean.setLast_name(last_name);
		bean.setName(name);
		List<Teacher> lista = service.get(bean);
		// Preparando el JSON
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		// Reporte
		ControllerUtil.responseJson(response, data);

	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Datos
		String last_name = request.getParameter("last_name");
		String name = request.getParameter("name");
		// Proceso
		Teacher bean = new Teacher();
		bean.setLast_name(last_name);
		bean.setName(name);
		List<Teacher> lista = service.get(bean);
		// Reporte
		request.setAttribute("listado", lista);
		RequestDispatcher rd = request.getRequestDispatcher("teachers.jsp");
		rd.forward(request, response);
	}

}
