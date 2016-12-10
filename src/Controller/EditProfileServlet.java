package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import connect.Connect;
import dao.UserDaoHandle;

/**
 * Servlet implementation class EditProfileServlet
 */

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoHandle userDao = new UserDaoHandle();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
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
		HttpSession session = request.getSession();
		String username =  session.getAttribute("username").toString();
		int id = userDao.getId(username);
    	String fullname= request.getParameter("fullname");
    	String phone = request.getParameter("phone");
    	String email=request.getParameter("email");
    	int gender = Integer.parseInt(request.getParameter("optionsRadios"));
        
    	String query =  "Update account set fullname='"+fullname+"'"
				+ ",gender='"+gender+"'"
					+ ",phone = '"+phone+"'"
							+ ",email='"+email+"' where id='"+ id +"'";
    	
	    Connect conn = new Connect();
		String url="";
		
		try{
			int kq=conn.Update(query);
			url = "myprofile.jsp";
			response.sendRedirect(url);
		}catch (Exception e){
			e.printStackTrace();
			response.sendRedirect("edit-profile.jsp");
		}
	}
	
}
