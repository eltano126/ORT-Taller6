package ort.t6.Managers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ort.t6.Entities.Tratamiento;
import ort.t6.BD.BaseDeDatos;

public class ManagerTratamiento {
		
	public Tratamiento[] getAll() {
		ArrayList<Tratamiento> lista = new ArrayList<Tratamiento>();
		try {
			Statement sql = BaseDeDatos.getConnection().createStatement();
			ResultSet rs = sql.executeQuery("select * from tratamiento");
			while (rs.next()) {
				Tratamiento p = new Tratamiento();
				p.setTr_id(rs.getInt(1));
				p.setTr_nombre(rs.getString(2));
				p.setTr_descripcion(rs.getString(3));
				p.setTr_duracion(rs.getInt(4));
				lista.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista.toArray(new Tratamiento[lista.size()]);
	}

	public Tratamiento getById(int id) {
		Tratamiento _tratamiento = new Tratamiento();
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("select * from tratamiento where tr_id=?");
			sql.setInt(1, id);
			ResultSet rs = sql.executeQuery();
			while (rs.next()) {
				_tratamiento.setTr_id(rs.getInt(1));
				_tratamiento.setTr_nombre(rs.getString(2));
				_tratamiento.setTr_descripcion(rs.getString(3));
				_tratamiento.setTr_duracion(rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return _tratamiento;
	}
	
	public boolean insert(String nombre, String descripcion, int duracion) {
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("insert into tratamiento(tr_nombre,tr_descripcion,tr_duracion) values (?,?,?)");
			sql.setString(1, nombre);
			sql.setString(2, descripcion);
			sql.setInt(3, duracion);
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean update(int id, String nombre, String descripcion, int duracion) {
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("update tratamiento set tr_nombre=?,tr_descripcion=?,tr_duracion=? where tr_id=?");
			sql.setString(1, nombre);
			sql.setString(2, descripcion);
			sql.setInt(3, duracion);
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean delete(int id) {
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("delete from tratamiento where tr_id=?");
			sql.setInt(1, id);
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

}
