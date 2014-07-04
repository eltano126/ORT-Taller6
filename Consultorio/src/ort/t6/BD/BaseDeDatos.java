package ort.t6.BD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class BaseDeDatos {

    private static BaseDeDatos instancia = new BaseDeDatos();
    
    public static final String DRIVER_CLASS = "org.sqlite.JDBC";
    public static final String jdbc = "jdbc:sqlite:";
    
    //	Enzo PC - Casa
    public static final String dbPath = "F:\\workspace\\Consultorio\\DB\\";
    //	Enzo PC - Laburo
//    public static final String dbPath = "C:\\Users\\etoscano\\Downloads\\PERSONAL\\Facultad\\workspace\\Consultorio\\DB\\";
    
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
        } catch (SQLException e) {
            System.out.println("ERROR: Unable to Connect to Database.");
        }
        
        return connection;
        
    }   
     
    public static Connection getConnection() {
        return instancia.createConnection();
    }
	
}