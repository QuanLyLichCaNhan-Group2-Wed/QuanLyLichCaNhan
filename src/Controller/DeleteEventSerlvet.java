package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.Connect;

/**
 * Servlet implementation class DeleteEventSerlvet
 */
@WebServlet("/DeleteEventSerlvet")
public class DeleteEventSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEventSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		int id=Integer.parseInt(request.getParameter("id"));
		Connect conn = new Connect();
		
		int kq = 0;
		String sql = "delete from event where id=" + id ;
		String url ="";
		try {
			kq = conn.Update(sql);
			kq=0;
			response.sendRedirect("home.jsp");
		} catch (Exception e) {
			response.sendRedirect("/detail-event.jsp");
			e.printStackTrace();
		}
	}

}
