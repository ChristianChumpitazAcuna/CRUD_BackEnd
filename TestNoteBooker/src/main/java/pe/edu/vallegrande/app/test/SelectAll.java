package pe.edu.vallegrande.app.test;

import java.util.List;

import pe.edu.vallegrande.app.model.Teacher;
import pe.edu.vallegrande.app.service.CrudTeacherService;

public class SelectAll {
	public static void main(String[] args) {
		try {
			CrudTeacherService teacherService = new CrudTeacherService();
			List<Teacher> lista = teacherService.getAll();
			for (Teacher teacher : lista) {
				System.err.println(teacher);
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
