package pe.edu.vallegrande.app.test;

import pe.edu.vallegrande.app.model.Teacher;
import pe.edu.vallegrande.app.service.CrudTeacherService;

public class Select {
	public static void main(String[] args) {
		try {
			CrudTeacherService teacherService = new CrudTeacherService();
			Teacher bean = teacherService.getForId("3");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}