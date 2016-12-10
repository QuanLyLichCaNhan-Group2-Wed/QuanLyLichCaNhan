package controller;

import java.io.IOException;
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String contentsearch = request.getParameter("searchEvent");
		Connection conn = Connect.getConnection();
		String query = "select * from event where title = '%"+contentsearch+"%'";
		
		Statement st;
        try {
            ArrayList al = null;
            ArrayList arr_event = new ArrayList();
            st = conn.createStatement();
            System.out.println("query " + query);
            ResultSet rs = st.executeQuery(query);
 
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
            RequestDispatcher view = request.getRequestDispatcher("search-page.jsp");
            view.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		
	}

}
