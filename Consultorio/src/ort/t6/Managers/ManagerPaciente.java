package ort.t6.Managers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ort.t6.Entities.Paciente;
import ort.t6.BD.BaseDeDatos;

public class ManagerPaciente {
	
	public Paciente[] getAll() {
		ArrayList<Paciente> lista = new ArrayList<Paciente>();
		try {
			Statement sql = BaseDeDatos.getConnection().createStatement();
			ResultSet rs = sql.executeQuery("select * from Paciente");
			while (rs.next()) {
				Paciente p = new Paciente();
				p.setPa_dni(rs.getInt(1));
				p.setPa_nombre(rs.getString(2));
				p.setPa_apellido(rs.getString(3));
				p.setPa_sexo(rs.getString(4));
				p.setPa_nacimiento(rs.getString(5));
				p.setPa_direccion(rs.getString(6));
				p.setPa_telefono(rs.getInt(7));
				p.setPa_celular(rs.getInt(8));
				p.setPa_mail(rs.getString(9));
				lista.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista.toArray(new Paciente[lista.size()]);
	}
	
	public Paciente getById(int id) {
		Paciente _paciente = new Paciente();
		try {
			Statement sql = BaseDeDatos.getConnection().createStatement();
			ResultSet rs = sql.executeQuery("select * from Paciente where pa_dni="+id);
			while (rs.next()) {
				_paciente.setPa_dni(rs.getInt(1));
				_paciente.setPa_nombre(rs.getString(2));
				_paciente.setPa_apellido(rs.getString(3));
				_paciente.setPa_sexo(rs.getString(4));
				_paciente.setPa_nacimiento(rs.getString(5));
				_paciente.setPa_direccion(rs.getString(6));
				_paciente.setPa_telefono(rs.getInt(7));
				_paciente.setPa_celular(rs.getInt(8));
				_paciente.setPa_mail(rs.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return _paciente;
	}
	
	public boolean insert(int dni, String nombre, String apellido, String sexo, String nacimiento, String direccion, int telefono, int celular, String mail) {
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("insert into Paciente(pa_dni,pa_nombre,pa_apellido,pa_sexo,pa_nacimiento,pa_direccion,pa_telefono,pa_celular,pa_mail) values (?,?,?,?,?,?,?,?,?)");
			sql.setInt(1, dni);
			sql.setString(2, nombre);
			sql.setString(3, apellido);
			sql.setString(4, sexo);
			sql.setString(5, nacimiento);
			sql.setString(6, direccion);
			sql.setInt(7, telefono);
			sql.setInt(8, celular);
			sql.setString(9, mail);
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateinsert(int dni, String nombre, String apellido, String sexo, String nacimiento, String direccion, int telefono, int celular, String mail) {
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("update Paciente set pa_nombre=?,"
					+ "pa_apellido=?,"
					+ "pa_sexo=?,"
					+ "pa_nacimiento=?,"
					+ "pa_direccion=?,"
					+ "pa_telefono=?,"
					+ "pa_celular=?,"
					+ "pa_mail=?"
					+ "where pa_dni=?");
			
			sql.setString(1, nombre);
			sql.setString(2, apellido);
			sql.setString(3, sexo);
			sql.setString(4, nacimiento);
			sql.setString(5, direccion);
			sql.setInt(6, telefono);
			sql.setInt(7, celular);
			sql.setString(8, mail);
			sql.setInt(9, dni);
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean delete(int dni) {
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("delete from Paciente where pa_dni=?");
			sql.setInt(1, dni);
			sql.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

}
