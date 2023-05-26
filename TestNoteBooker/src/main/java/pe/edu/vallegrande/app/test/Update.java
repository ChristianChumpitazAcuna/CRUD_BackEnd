package pe.edu.vallegrande.app.test;
import pe.edu.vallegrande.app.model.Teacher;
import pe.edu.vallegrande.app.service.CrudTeacherService;

public class Update {
	public static void main(String[] args) {
		try {
			// Datos
			Teacher bean = new Teacher(7,"Maria","Sanchez Perez","DNI", "88334817", "Av.Prados", "Asia", "12/12/2003", "990450230", "maria@gmail.com","A");
			// Proceso
			CrudTeacherService teacherService = new CrudTeacherService();
			teacherService.update(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
