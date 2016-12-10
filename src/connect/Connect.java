package connect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class Connect {
	public static Connection conn;
	public static Connection getConnection(){
		Connection cons=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cons=DriverManager.getConnection( "jdbc:mysql://localhost:3306/calendar?verifyServerCertificate=false&useSSL=true","root","20011405");
		}catch(Exception e){
			e.printStackTrace();
		}
		return cons;
		
	}
	
	public ResultSet GetData(String sql) throws SQLException {
		ResultSet rs = null;
		openconnect();
		Statement st= conn.createStatement();
		try {
			rs = st.executeQuery(sql);
			
			return rs;
		} catch (Exception e) {
			System.out.println(e);}
		return rs;	
		// TODO Auto-generated method stub
		
	}
	public int Update(String sql) throws Exception {		
		int kq=0;
		openconnect();
		Statement st=conn.createStatement();
		try {
			kq=st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e);}
		finally
		{
			closeconnection();
		}
		return kq;		
	}
	private void openconnect() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection( "jdbc:mysql://localhost:3306/calendar?verifyServerCertificate=false&useSSL=true","root","20011405");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		
		// TODO Auto-generated method stub
		
	}
	
	private void closeconnection() throws SQLException {
		
			if(conn!=null && !conn.isClosed()) conn.close();
		
		// TODO Auto-generated method stub
		
	}
	public static void main(String args[])
	{
		
	}


}
