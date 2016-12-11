package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.Connect;

/**
 * Servlet implementation class SearchEventServlet
 */
@WebServlet("/SearchEventServlet")
public class SearchEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchEventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String contentsearch = request.getParameter("searchEvent");
		String start = request.getParameter("time_start");
		String end = request.getParameter("time_end");
		Connect conn = new Connect();
		String query = "";
		String err = "";
		if(!contentsearch.isEmpty()){
			query= "select * from event where title like '%"+contentsearch+"%' limit 10";
		}
		else if (!start.isEmpty() && !end.isEmpty()){
			query= "select * from event where start >='"+start+"' and end<= '"+end+"' limit 10 ";
		}
		else if(!contentsearch.isEmpty() && !start.isEmpty() && !end.isEmpty()){
			query= "select * from event where title like '%"+contentsearch+"%' start >='"+start+"' and end<= '"+end+"' limit 10";
		}
		else if(start.isEmpty() && !end.isEmpty() || !start.isEmpty() && end.isEmpty()){
			err = "Chưa nhập đầy đủ ngày bắt đầu và ngày kết thúc";
		}
		else{
			err="Bạn chưa nhập thông tin tìm kiếm";
		}
		if(err.length() > 0){
			out.println("<meta charset='utf-8'>");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+err+"');");
			out.println("location='page-search.jsp';");
			out.println("</script>");
		}
        try {
        	
            ArrayList al = null;
            ArrayList arr_event = new ArrayList();
            System.out.println("query " + query);
            ResultSet rs = conn.GetData(query);
 
            while (rs.next()) {
                al = new ArrayList();
                al.add(rs.getString("title"));
                al.add(rs.getString("start"));
                al.add(rs.getString("end"));
                al.add(rs.getInt("id"));
                System.out.println("al :: " + al);
                arr_event.add(al);
            }
 
            request.setAttribute("arr_event", arr_event);
            RequestDispatcher view = request.getRequestDispatcher("page-search.jsp");
            view.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		
	}

}
