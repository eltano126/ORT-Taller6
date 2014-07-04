package ort.t6.Managers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ort.t6.Entities.Medico;
import ort.t6.BD.BaseDeDatos;

public class ManagerMedico {
	
	public Medico[] getAll() {
		
		ArrayList<Medico> lista = new ArrayList<Medico>();
		try {
			Statement sql = BaseDeDatos.getConnection().createStatement();
			ResultSet rs = sql.executeQuery("select * from Medico");
			while (rs.next()) {
				Medico m = new Medico();
				m.setMe_matricula(rs.getInt(1));
				m.setMe_usuario(rs.getString(2));
				m.setMe_pass(rs.getString(3));
				m.setMe_nombre(rs.getString(4));
				m.setMe_apellido(rs.getString(5));
				lista.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista.toArray(new Medico[lista.size()]);
		
	}
	
public Medico getById(int id) {
		
		Medico _medico = new Medico();
		try {
			Statement sql = BaseDeDatos.getConnection().createStatement();
			ResultSet rs = sql.executeQuery("select * from Medico where me_matricula="+id);
			while (rs.next()) {
				_medico.setMe_matricula(rs.getInt(1));
				_medico.setMe_usuario(rs.getString(2));
				_medico.setMe_pass(rs.getString(3));
				_medico.setMe_nombre(rs.getString(4));
				_medico.setMe_apellido(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return _medico;
	}
	
	public boolean insert(int matricula, String nombre, String apellido, String usuario, String pass) {
		
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("insert into Medico(me_matricula,me_usuario,me_pass,me_nombre,me_apellido) values (?,?,?,?,?)");
			sql.setInt(1, matricula);
			sql.setString(2, nombre);
			sql.setString(3, apellido);
			sql.setString(4, usuario);
			sql.setString(5, pass);
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public boolean update(int matricula, String nombre, String apellido, String usuario, String pass) {
		
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("update Medico set me_nombre=?,"
					+ "me_apellido=?,"
					+ "me_usuario=?,"
					+ "me_pass=?"
					+ "where me_matricula=?");
			sql.setString(1, nombre);
			sql.setString(2, apellido);
			sql.setString(3, usuario);
			sql.setString(4, pass);
			sql.setInt(5, matricula);
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public boolean delete(int matricula) {
		
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("delete from Medico where me_matricula=?");
			sql.setInt(1, matricula);
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}

}
