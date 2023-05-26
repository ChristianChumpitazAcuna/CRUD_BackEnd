package pe.edu.vallegrande.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Teacher;
import pe.edu.vallegrande.app.service.spec.CrudServiceSpec;
import pe.edu.vallegrande.app.service.spec.RowMapper;

public class CrudTeacherService implements CrudServiceSpec<Teacher>, RowMapper<Teacher> {

	// Definiendo cosas
	private final String SQL_SELECT_BASE = "SELECT id, name, last_name, document_type, document_number, adress, district, birthdate, cell_phone, email, status  FROM teacher";
	private final String SQL_INSERT = "INSERT INTO teacher (name, last_name, document_type, document_number, adress, district, birthdate, cell_phone, email, status) VALUES(?,?,?,?,?,?,?,?,?,?)";
	private final String SQL_UPDATE = "UPDATE teacher SET name=?, last_name=?, document_type=?, document_number=?, adress=?, district=?, birthdate=?, cell_phone=?, email=?, status=? WHERE id=?";
	private final String SQL_DELETE = "DELETE FROM teacher WHERE id=?";

	@Override
	public Teacher mapRow(ResultSet rs) throws SQLException {
		Teacher bean = new Teacher();
		/*
		 * Columnas: id name, last_name, document_type, document_number, adress,
		 * district, birthdate, cell_phone, email, status
		 */
		bean.setId(rs.getInt("id"));
		bean.setName(rs.getString("name"));
		bean.setLast_name(rs.getString("last_name"));
		bean.setDocument_type(rs.getString("document_type"));
		bean.setDocument_number(rs.getString("document_number"));
		bean.setAdress(rs.getString("adress"));
		bean.setDistrict(rs.getString("district"));
		bean.setBirthdate(rs.getString("birthdate"));
		bean.setCell_phone(rs.getString("cell_phone"));
		bean.setEmail(rs.getString("email"));
		bean.setStatus(rs.getString("status"));

		return bean;
	}

	@Override
	public List<Teacher> getAll() {
		// Variables
		Connection cn = null;
		List<Teacher> lista = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Teacher bean;
		// Proceso
		try {
			cn = AccesoDB.getConnection();
			pstm = cn.prepareStatement(SQL_SELECT_BASE);
			rs = pstm.executeQuery();
			while (rs.next()) {
				bean = mapRow(rs);
				lista.add(bean);
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				cn.close();
			} catch (Exception e2) {

			}
		}
		return lista;
	}

	@Override
	public Teacher getForId(String id) {
		// Variables
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Teacher bean = null;
		String sql;
		// Proceso
		try {
			cn = AccesoDB.getConnection();
			sql = SQL_SELECT_BASE + " WHERE id=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, Integer.parseInt(id));
			rs = pstm.executeQuery();
			if (rs.next()) {
				bean = mapRow(rs);
			}
			rs.close();
			pstm.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				cn.close();
			} catch (Exception e2) {
			}
		}

		return bean;
	}

	/**
	 * Realiza la busqueda por apellido y nombre.
	 */
	@Override
	public List<Teacher> get(Teacher bean) {
		// Variables
		Connection cn = null;
		List<Teacher> lista = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Teacher item;
		String sql;
		String last_name;
		String name;
		// Preparar los datos
		last_name = "%" + UtilService.setStringVacio(bean.getLast_name() + "%");
		name = "%" + UtilService.setStringVacio(bean.getName() + "%");
		// Proceso
		try {
			// Conexion
			cn = AccesoDB.getConnection();
			// Consulta
			sql = SQL_SELECT_BASE + " WHERE last_name LIKE ? AND name LIKE ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, last_name);
			pstm.setString(2, name);
			rs = pstm.executeQuery();
			while (rs.next()) {
				item = mapRow(rs);
				lista.add(item);
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				cn.close();
			} catch (Exception e2) {

			}
		}
		return lista;
	}

	@Override
	public void insert(Teacher bean) {
		// Variables
		Connection cn = null;
		// String sql = null;
		PreparedStatement pstm = null;
		// ResultSet rs;
		// Integer id = 0;
		// Proceso
		try {
			// Iniciar la Tx
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);

			/*
			 * // Traer contador sql = "SELECT id FROM teacher WHERE id="; pstm =
			 * cn.prepareStatement(sql); rs = pstm.executeQuery(); if (!rs.next()) {
			 * rs.close(); pstm.close(); throw new
			 * SQLException("Contador de teacher no existe"); } id =
			 * Integer.parseInt(rs.getString("")); rs.close(); pstm.close(); // Actualizar
			 * contaodr id++; sql = "UPDATE teacher SET id = ? WHERE id='Teacher'"; pstm =
			 * cn.prepareStatement(sql); pstm.setString(1, id + ""); pstm.executeUpdate();
			 * pstm.close();
			 */

			// Insertar nuevo teacher
			pstm = cn.prepareStatement(SQL_INSERT);
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getLast_name());
			pstm.setString(3, bean.getDocument_type());
			pstm.setString(4, bean.getDocument_number());
			pstm.setString(5, bean.getAdress());
			pstm.setString(6, bean.getDistrict());
			pstm.setString(7, bean.getBirthdate());
			pstm.setString(8, bean.getCell_phone());
			pstm.setString(9, bean.getEmail());
			pstm.setString(10, bean.getStatus());
			pstm.executeUpdate();
			pstm.close();
			// Fin de Tx
			// bean.setId(id);
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
				cn.close();
			} catch (Exception e2) {
			}
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				cn.close();
			} catch (Exception e2) {
			}
		}

	}

	@Override
	public void update(Teacher bean) {
		// Variables
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas;
		// Proceso
		try {
			// Iniciar la Tx
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			// Actualizar el registro
			pstm = cn.prepareStatement(SQL_UPDATE);
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getLast_name());
			pstm.setString(3, bean.getDocument_type());
			pstm.setString(4, bean.getDocument_number());
			pstm.setString(5, bean.getAdress());
			pstm.setString(6, bean.getDistrict());
			pstm.setString(7, bean.getBirthdate());
			pstm.setString(8, bean.getCell_phone());
			pstm.setString(9, bean.getEmail());
			pstm.setString(10, bean.getStatus());
			pstm.setInt(11, bean.getId());
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas != 1) {
				throw new SQLException("Error, verifique sus datos e intentelo nuevamente");
			}
			// Fin de Tx
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
				cn.close();
			} catch (Exception e2) {
			}
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				cn.close();
			} catch (Exception e2) {
			}
		}

	}

	@Override
	public void delete(String id) {
		// Variables
		Connection cn = null;
		PreparedStatement pstm = null;
		// ResultSet rs = null;
		int filas = 0;
		// String sql;
		// Proceso
		try {
			// Inicio de Tx
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			// Validar
			/*
			 * sql = "SELECT count(1) filas FROM usuario WHERE id=?"; pstm =
			 * cn.prepareStatement(sql); pstm.setInt(1, Integer.parseInt(id)); rs =
			 * pstm.executeQuery(); rs.next(); filas = rs.getInt("filas"); rs.close();
			 * pstm.close(); if (filas > 0) { throw new
			 * SQLException("ERROR, no se puede eliminar, tienes registros relacionados.");
			 * }
			 */
			// Proceso
			pstm = cn.prepareStatement(SQL_DELETE);
			pstm.setInt(1, Integer.parseInt(id));
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas != 1) {
				throw new SQLException("No se pudo eliminar el empleado.");
			}
			// Confirmar Tx
			cn.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				cn.close();
			} catch (Exception e2) {
			}
		}

	}

}
