package ort.t6.BD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class BaseDeDatos {

    private static BaseDeDatos instancia = new BaseDeDatos();
    
    public static final String DRIVER_CLASS = "org.sqlite.JDBC";
    public static final String jdbc = "jdbc:sqlite:";
    public static final String dbPath = "F:\\Github\\ORT-Taller6\\Consultorio\\DB\\";
    public static final String dbName = "Consultorio.db";
    
    
	private BaseDeDatos() {
		
		System.out.println("Creating SQLite DataBase Connection");

		try {
			Class.forName(DRIVER_CLASS);
			System.out.println("Connection created successfully");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
    private Connection createConnection() {
    	
        Connection connection = null;
        
        try {
            connection = DriverManager.getConnection(jdbc+dbPath+dbName);
//            connection = DriverManager.getConnection("jdbc:sqlite:F:\\Github\\ORT-Taller6\\Consultorio\\DB\\Consultorio.db");
        } catch (SQLException e) {
            System.out.println("ERROR: Unable to Connect to Database.");
        }
        
        return connection;
        
    }   
     
    public static Connection getConnection() {
        return instancia.createConnection();
    }
	
}