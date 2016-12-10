package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.Connect;
import dao.UserDaoHandle;


/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoHandle userDao = new UserDaoHandle();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    int gender = Integer.parseInt(request.getParameter("gender"));
	    String fullname = request.getParameter("fullname");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");


	    Connect conn = new Connect();
		String url="index.jsp";

		String sql = "insert into account(username,password,gender,fullname,email,phone,role,status,block) values('" + username + "','"+password+
				"','"+gender+"','"+fullname+"','"+email+"','"+phone+"','"+0+"','"+0+"','"+0+"') ";
		String err = "";
		
		if (username.equals("") || password.equals("")|| email.equals("")|| fullname.equals("")|| phone.equals("")) {
			err += "Nhập thông tin đầy đủ";
		}else{
			if(userDao.CheckUserExists(username))
			{
				err+="Tài khoản đã tồn tại";
			}else{
				Pattern pattern = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
				Matcher matcher = pattern.matcher(email);
				if(!matcher.matches()){
					err+="Email không hợp lệ!";
				}
			}
		}
		if (err.length() > 0) {
			request.setAttribute("err", err);
		}
		try{
			if (err.length() == 0){
				int kq=conn.Update(sql);
				url="/home.jsp";
			}
			else{
				url="/index.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}catch (Exception e){
			e.printStackTrace();
			response.sendRedirect("/index.jsp");
		}
	}
}
