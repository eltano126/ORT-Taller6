package ort.t6.Managers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ort.t6.BD.BaseDeDatos;
import ort.t6.Entities.Horario;

public class ManagerHorario {
	
	public Horario[] getAll() {
		ArrayList<Horario> lista = new ArrayList<Horario>();
		try {
			Statement sql = BaseDeDatos.getConnection().createStatement();
			ResultSet rs = sql.executeQuery("select * from horario");
			while (rs.next()) {
				Horario h = new Horario();
				h.setHo_id(rs.getInt(1));
				h.setHo_desde(rs.getString(2));
				h.setHo_hasta(rs.getString(3));
				lista.add(h);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista.toArray(new Horario[lista.size()]);
	}
	
	public Horario getById(int id) {
		Horario h = new Horario();
		try {
			PreparedStatement sql = BaseDeDatos.getConnection().prepareStatement("select * from horario where ho_id = ?");
			sql.setInt(1, id);
			ResultSet rs = sql.executeQuery();
			while (rs.next()) {
				h.setHo_id(rs.getInt(1));
				h.setHo_desde(rs.getString(2));
				h.setHo_hasta(rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return h;
	}
}
