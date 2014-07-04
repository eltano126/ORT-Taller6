package ort.t6.Login;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import ort.t6.BD.BaseDeDatos;

/**
 * @author Enzo Toscano
 * 
 */
public class LoginValidate {

	public boolean validateUserLogin(String matricula, String pass) {
		
		boolean flag = false;
		Connection con = null;
		
		try {
			
			con = BaseDeDatos.getConnection();

			if (con != null) {
				Statement stat = con.createStatement();
				String qry = "SELECT * FROM medico WHERE me_matricula = '"
						+ matricula + "' AND me_pass = '" + pass + "' ";
				ResultSet rs = stat.executeQuery(qry);
				if (rs.next()) {
					flag = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return flag;
		
	}
	
	public String getNombreApellidoMedico(String me_matricula){
		
		String me_nombre = "";
		String me_apellido = "";
		
		try {
			Statement sql = BaseDeDatos.getConnection().createStatement();
			ResultSet rs = sql.executeQuery("SELECT me_nombre, me_apellido FROM medico where me_matricula = " + me_matricula + ";"); 
			me_nombre = rs.getString(1);
			me_apellido = rs.getString(2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return me_nombre + " " + me_apellido;
		
	}
	
}