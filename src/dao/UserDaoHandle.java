package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connect.Connect;
import dao.UserDao;

public class UserDaoHandle implements UserDao {
	public boolean Login(String username, String password){
		Connection con = Connect.getConnection();
		String sql ="select * from account where username='"+username+"' and password='"+password+"'";
		PreparedStatement ps;
		try{
			ps = (java.sql.PreparedStatement) con.prepareStatement(sql);
			
			ResultSet rs= ps.executeQuery(sql);
			if (rs.next()){
				con.close();
				return true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}
	public boolean CheckUser(String username, String password)
	{
		Connection con = Connect.getConnection();
		String sql ="select role from account where username='"+username+"' and password='"+password+"'";
		Statement ps;
		try{
			ps =  con.prepareStatement(sql);
			ResultSet rs= (ResultSet) ps.executeQuery(sql);
			rs.next();
			int role=rs.getInt("role");
			if (role == 1){
				    
					con.close();
					return true;
					
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	
	return false;
	}
	public boolean CheckUserExists(String username)
	{
		Connection con = Connect.getConnection();
		String sql ="select * from account where username='"+username+"'";
		PreparedStatement ps;
		try{
			ps = (java.sql.PreparedStatement) con.prepareStatement(sql);
			
			java.sql.ResultSet rs= ps.executeQuery(sql);
			if (rs.next()){
				con.close();
				return true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}
	public boolean checkBlock(String username){
		Connection con = Connect.getConnection();
		String sql ="select block from account where username='"+username+"'";
		PreparedStatement ps;
		try{
			ps =  con.prepareStatement(sql);
			ResultSet rs= (ResultSet) ps.executeQuery(sql);
			rs.next();
			int block=rs.getInt("block");
			if (block == 1){
				    
				con.close();
				return false;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return true;
	}
	public String getFullName(String username)
	{
		Connection con = Connect.getConnection();
		String sql = "select fullname from account where username = '"+username+"'";
		
		Statement ps;
		String fullname = "";
		try{
			ps =  con.prepareStatement(sql);
			ResultSet rs= (ResultSet) ps.executeQuery(sql);
			rs.next();
			fullname=rs.getString("fullname");
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return fullname;
	}
	public String getPassword(String username){
		Connection con = Connect.getConnection();
		String sql = "select password from account where username = '"+username+"'";
		
		Statement ps;
		int id = 0;
		String password = "";
		try{
			ps =  con.prepareStatement(sql);
			ResultSet rs= (ResultSet) ps.executeQuery(sql);
			rs.next();
			password = rs.getString("password");
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return password;
	}
	public int getId(String username){
		Connection con = Connect.getConnection();
		String sql = "select * from account where username = '"+username+"'";
		
		Statement ps;
		int id = 0;
		try{
			ps =  con.prepareStatement(sql);
			ResultSet rs= (ResultSet) ps.executeQuery(sql);
			rs.next();
			id=rs.getInt("id");
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return id;
	}
}
