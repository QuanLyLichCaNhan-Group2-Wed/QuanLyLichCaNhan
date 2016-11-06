package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class connectDB {
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/calendar";

	// Database credentials
	static final String USERNAME = "root";
	static final String PASSWORD = "20011405";
	
	public static Connection connection;
	
	// open connection to Database
	public static Connection getConnection() {
		connection=null;
		try {
			Class.forName(JDBC_DRIVER);
			connection=DriverManager.getConnection(DB_URL,USERNAME,PASSWORD);
			System.out.println("Connection Success!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	// Get data from DB
	public ResultSet getData(String query) throws SQLException{
		ResultSet rs = null;
		getConnection();
		Statement state=connection.createStatement();
		try {
			rs= state.executeQuery(query);
			return rs;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error Connection!");
			e.printStackTrace();
			Closeconnect();
		}
		
		return rs;
	}
	
	// update query (insert, select, delete, update)
	public int Update(String query) throws SQLException{
		getConnection(); // open connection
		int result=0;
		Statement state=connection.createStatement();
		try{
			result = state.executeUpdate(query);
		}
		catch (Exception e){
			System.out.println("Error Update query!");
			e.printStackTrace();
		}
		finally
		{
			Closeconnect();
		}
		return result;
	}
	
	// Close Connect DB
	public static void Closeconnect() throws SQLException{
		try {
			if(connection!=null && !connection.isClosed())
				connection.close();
		} catch (Exception e) {
			// TODO: handle exception
			
			System.out.println("Error Close  Connection!");
			e.printStackTrace();
		}
		
	}
	
	// test connection and close connection
	/*public static void main(String[] args) throws SQLException{
		try {
			getConnection();
			Closeconnect();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error 1");
			e.printStackTrace();
		}
	}*/
}
