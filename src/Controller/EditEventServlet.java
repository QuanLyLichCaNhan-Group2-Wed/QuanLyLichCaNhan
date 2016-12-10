package controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.Connect;
import dao.UserDaoHandle;

/**
 * Servlet implementation class EditEventServlet
 */
@WebServlet("/EditEventServlet")
public class EditEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoHandle userDao = new UserDaoHandle();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEventServlet() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		
		String quantam = request.getParameter("quantam");
		
		
		String description = request.getParameter("content");
		String start = request.getParameter("start_time");
		String end = request.getParameter("end_time");
		String address = request.getParameter("address");
		int notify = Integer.parseInt(request.getParameter("notify"));
		String allday = request.getParameter("allday");
		String[] repeat= request.getParameterValues("repeat");
		String dow = Arrays.toString(repeat);
		int AllDay = 0;
		if(allday == null){
			AllDay = 0;
		}
		else{
			AllDay = 1;
		}
		if(dow.toString()=="null"){
			dow="";
		}
		Connect conn = new Connect();
		String sql = "Update event set description='"+description+"'"
				+ ",start = '"+start+"'"
						+ ",end='"+end+"'"
								+ ",allDay='"+AllDay+"'"
										+ ",title='"+title+"'"
												+ ",notify='"+notify+"'"
														+ ",address='"+address+"'"
																+ ",background_color='"+quantam+"',dow='"+dow+"' where id='"+ id +"'";
		String err = "";
		
		if (title.equals("") || start.equals("")|| end.equals("")) {
			err += "Bạn chưa nhập đầy đủ thông tin";
		}
		String url="";
		if (err.length() > 0) {
			request.setAttribute("err", err);
		}
		try{
			if (err.length() == 0){
				int kq=conn.Update(sql);
				url = "home.jsp";
				System.out.println(sql);
			}
			else{
				url="edit-event.jsp";
			}
			response.sendRedirect(url);
		}catch (Exception e){
			e.printStackTrace();
			response.sendRedirect("edit-event.jsp");
		}
	}

}
