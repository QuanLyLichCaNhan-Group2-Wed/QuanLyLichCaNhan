package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import connect.Connect;

/**
 * Servlet implementation class ChangeStatusUser
 */
@WebServlet("/ChangeStatusUser")
public class ChangeStatusUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStatusUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        
        ResultSet rs=null;
        
	    int id = Integer.parseInt(request.getParameter("id"));
	    
	    Connect conn = new Connect();
	    String sql ="select block from account where id='"+ id +"'";

		try{
			rs=conn.GetData(sql);
			while(rs.next()){
				int temp=rs.getInt("block");
				if(temp==1){					
					String sql1 ="update account set block='0'where id='"+ id +"'";
					int kq=conn.Update(sql1);	
					
					boolean result=true;
					Gson gson=new Gson();
					String json=gson.toJson(result);
					response.getWriter().write(json);
				}
				else {
					String sql2 ="update account set block='1'where id='"+ id +"'";
					int kq=conn.Update(sql2);
					
					boolean result=false;
					Gson gson=new Gson();
					String json=gson.toJson(result);
					response.getWriter().write(json);
				}
				
			}
		}catch (Exception e) {
			
		}
		
	}

}
