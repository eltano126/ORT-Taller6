package ort.t6.Managers;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ort.t6.BD.BaseDeDatos;
import ort.t6.Entities.Turno;

public class ManagerTurno {
	public Turno[] getAll() {
		ArrayList<Turno> lista = new ArrayList<Turno>();
		ManagerMedico mm = new ManagerMedico();
		ManagerPaciente mp = new ManagerPaciente();
		ManagerTratamiento mt = new ManagerTratamiento();
		ManagerHorario mh = new ManagerHorario();
		try {
			Statement sql = BaseDeDatos.getConnection().createStatement();
			ResultSet rs = sql.executeQuery("select * from turno");
			while (rs.next()) {
				Turno p = new Turno();
				p.setTu_id(rs.getInt(1));
				p.setTu_medico(mm.getById(rs.getInt(2)));
				p.setTu_paciente(mp.getById(rs.getInt(3)));
				p.setTu_tratamiento(mt.getById(rs.getInt(4)));
				p.setTu_modulo(mh.getById(rs.getInt(5)));
				p.setTu_fecha(rs.getString(6));
				lista.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista.toArray(new Turno[lista.size()]);
	}

	public Turno[] getByFecha(Date fecha) {
		ArrayList<Turno> lista = new ArrayList<Turno>();
		ManagerMedico mm = new ManagerMedico();
		ManagerPaciente mp = new ManagerPaciente();
		ManagerTratamiento mt = new ManagerTratamiento();
		ManagerHorario mh = new ManagerHorario();
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("select * from turno where fecha_desde = ?");
			sql.setDate(1, fecha);
			ResultSet rs = sql.executeQuery();
			while (rs.next()) {
				Turno p = new Turno();
				p.setTu_id(rs.getInt(1));
				p.setTu_medico(mm.getById(rs.getInt(2)));
				p.setTu_paciente(mp.getById(rs.getInt(3)));
				p.setTu_tratamiento(mt.getById(rs.getInt(4)));
				p.setTu_modulo(mh.getById(rs.getInt(5)));
				p.setTu_fecha(rs.getString(6));
				lista.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista.toArray(new Turno[lista.size()]);
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
