package pe.edu.vallegrande.app.test;

import pe.edu.vallegrande.app.service.CrudTeacherService;

public class Delete {
	public static void main(String[] args) {
		try {
			// Datos
			String id = "6";
			// Proceso
			CrudTeacherService teacherService = new CrudTeacherService();
			teacherService.delete(id);
			System.out.println("Registro eliminado");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
