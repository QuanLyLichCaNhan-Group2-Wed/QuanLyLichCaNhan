package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.Connect;
import dao.UserDaoHandle;



/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoHandle userDao = new UserDaoHandle();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		int id = userDao.getId(username);
		String newPassword = request.getParameter("newPassword");
		String currentPassword = request.getParameter("currentPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		String err = "";
		if(currentPassword != confirmPassword){
			err="Hai password không khớp nhau";
		}
		String password = userDao.getPassword(username);
		if(newPassword !=password){
			err="Mật khẩu hiện tại không chính xác";
		}
		if(newPassword != confirmPassword){
			err="Hai mật khẩu không trùng nhau";
		}
		if(newPassword.equals("")){
			err="Bạn chưa nhập password mới";
		}
		 Connect conn = new Connect();
			String sql = "Update account set password ='"+newPassword+"' where id='"+ id +"'";
		
		String url = "";
		int kq = 0;
		try{
			
				kq=conn.Update(sql);
				url = "myprofile.jsp";
			response.sendRedirect(url);
		}catch (Exception e){
			e.printStackTrace();
			response.sendRedirect("change-password.jsp");
		}
	}
}
