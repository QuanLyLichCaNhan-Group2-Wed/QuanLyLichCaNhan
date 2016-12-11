package controller;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDaoHandle userDao = new UserDaoHandle();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		String err = "";
		if (user.equals("") || pass.equals("")) {
			err = "Bạn chưa nhập thông tin!";
		} else {
			if (userDao.Login(user, pass) == false) {
				err = "Username hoặc Password không đúng!";
			}
			if(userDao.checkBlock(user)==false){
				err="Tài khoản của bạn đã bị khóa!";
			}
			

		}
		if (err.length() > 0) {
			
			request.setAttribute("err", err);
			out.println("<meta charset='utf-8'>");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+err+"');");
			out.println("location='index.jsp';");
			out.println("</script>");
			
		}
		String url = "index.jsp";
		try {
			if(err.length() == 0) {
				HttpSession session = request.getSession();
				session.setAttribute("username", user);
				userDao.Login(user, pass);
				String fullname = userDao.getFullName(user);
				session.setAttribute("fullname", fullname);
				
				if (userDao.CheckUser(user,pass))
				{
					url = "/admin-list.jsp";
				}
					
				else
				{
					url = "/home.jsp";
				}
					
			} else {

				url = "/index.jsp";
			}
			RequestDispatcher rd = request.getServletContext().getRequestDispatcher(url);

			rd.include(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(url);
		}
	}

}
