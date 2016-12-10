package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.Connect;
import dao.UserDaoHandle;

/**
 * Servlet implementation class EditListServlet
 */
@WebServlet("/EditListServlet")
public class EditListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoHandle userDao = new UserDaoHandle();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    int id = Integer.parseInt(request.getParameter("id"));
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    int gender = Integer.parseInt(request.getParameter("rdoSex"));
	    String fullname = request.getParameter("name");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    int rol = Integer.parseInt(request.getParameter("rdoRol"));
	    int statusblock = Integer.parseInt(request.getParameter("rdostatus"));
	    


	    Connect conn = new Connect();
		String sql = "Update account set password='"+password+"'"
						+ ",gender='"+gender+"'"
								+ ",fullname = '"+fullname+"'"
										+ ",email='"+email+"'"
												+ ",phone='"+phone+"'"
														+ ",role='"+rol+"'"
																+ ",block='"+statusblock+"' where id='"+ id +"'";
		String err = "";
		
		
		String url="";
		if (err.length() > 0) {
			request.setAttribute("err", err);
		}
		
		try{
			if (err.length() == 0){
				int kq=conn.Update(sql);
				url = "admin-list.jsp";
			}
			else{
				url="admin-edit.jsp";
			}
			response.sendRedirect(url);
		}catch (Exception e){
			e.printStackTrace();
			response.sendRedirect("admin-edit.jsp");
		}
	}
}
