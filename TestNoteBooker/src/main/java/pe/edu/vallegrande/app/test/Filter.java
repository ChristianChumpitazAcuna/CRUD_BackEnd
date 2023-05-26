package pe.edu.vallegrande.app.test;

import java.util.List;

import pe.edu.vallegrande.app.model.Teacher;
import pe.edu.vallegrande.app.service.CrudTeacherService;

public class Filter {
	public static void main(String[] args) {
		try {
			// Datos
			Teacher bean = new Teacher();
			bean.setLast_name("Avila");
			bean.setName("");
			// Proceso
			CrudTeacherService teacherService = new CrudTeacherService();
			List<Teacher> lista = teacherService.get(bean);
			for (Teacher teacher : lista) {
				System.out.println(teacher);
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
