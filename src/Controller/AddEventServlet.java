package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;
import java.net.URL;
import java.sql.ResultSet;
import java.util.Arrays;

import dao.SpeedSMSAPI;
import connect.Connect;
import dao.UserDaoHandle;

/**
 * Servlet implementation class AddEventServlet
 */
@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoHandle userDao = new UserDaoHandle();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEventServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		String title = request.getParameter("name_event");
		String allday = request.getParameter("allday");
		String quantam = request.getParameter("quantam");
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
		
		
		String start = request.getParameter("time_start");
		String end = request.getParameter("time_end");
		String address = request.getParameter("address");
		int notify = Integer.parseInt(request.getParameter("notify"));
		String description = request.getParameter("description");
		
		int id_acc = userDao.getId(username);
		Connect conn = new Connect();
		String sql = "insert into event(title,start,end,url,allDay,notify,description,address,id_acc,background_color,dow) values('" + title + "','"+start+
				"','"+end+"','detail-event.jsp?id=','"+AllDay+"','"+notify+"','"+description+"','"+address+"','"+id_acc+"','"+quantam+"','"+ dow +"')";
		String err = "";
		
		if (title.equals("") || start.equals("")|| end.equals("")) {
			err += "Bạn chưa nhập đầy đủ thông tin";
		}
		String url="";
		if (err.length() > 0) {
			request.setAttribute("err", err);
		}
		String myemail = "ozilboyshort@gmail.com";
		String pass="hien0809";
		String friend=request.getParameter("addfriend");
		if(friend!="none"){
			if(notify == 1){
				String sql1="select email from account where username='"+friend+"'";
								ResultSet rs=null;
				String friendemail=null;
				try {
					rs = conn.GetData(sql1);
					while (rs.next()) {
					friendemail =""+rs.getString(1)+"";}
					// Tạo đối tượng Email
				    MultiPartEmail email1 = new MultiPartEmail();
				     // Cấu hình
				        email1.setHostName("smtp.googlemail.com");
				        email1.setSmtpPort(465);
				        email1.setSSLOnConnect(true);
				        email1.setAuthenticator(new DefaultAuthenticator(myemail,pass));
				        email1.setFrom(myemail, "Calendar");
				        email1.addTo(friendemail, friend);

				        email1.setSubject(title);
				        email1.setMsg(description);
				        email1.send();
				   	 
				        System.out.println("Sent to your friend success!");
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			}
			else{
				//Gui tin nhan
				//Lay SDT tu username
				String sql2="select phone from account where username='"+username+"'";
				String phone=null;
				ResultSet rst=null;
				try{
					rst=conn.GetData(sql2);
					while (rst.next()) {
						phone =""+rst.getString(1)+"";}
				SpeedSMSAPI api=new SpeedSMSAPI(accessToken) ;
				String info=api.getUserInfo();
				System.out.println(info);
				SpeedSMSAPI api1=new SpeedSMSAPI(accessToken);
				String json = "{\"to\": [\""+phone+"\"], \"content\": \""+description+"\", \"sms_type\": 2, \"brandname\":\"\"}";
				String result = api1.sendSMS(json);
				System.out.println(result);}
				catch(Exception e){e.printStackTrace();}
			}
		}
		//gui mail cho chinh minh
		String sql3="select email from account where username='"+username+"'";
		ResultSet rs1=null;
		String email3=null;
		try {
			rs1 = conn.GetData(sql3);
			while (rs1.next()) {
			email3 =""+rs1.getString(1)+"";}
			// Tạo đối tượng Email
		    MultiPartEmail email2 = new MultiPartEmail();
		    
		     // Cấu hình
		        email2.setHostName("smtp.googlemail.com");
		        email2.setSmtpPort(465);
		        email2.setSSLOnConnect(true);
		        email2.setAuthenticator(new DefaultAuthenticator(myemail,pass));
		        email2.setFrom(myemail, "Calendar");
		        email2.addTo(email3, friend);

		        email2.setSubject(title);
		        email2.setMsg(description);
		        email2.send();
		   	 
		        System.out.println("Sent to myself success!");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try{
			if (err.length() == 0){
				int kq=conn.Update(sql);
				url = "home.jsp";
			}
			else{
				url="add-event.jsp";
			}
			response.sendRedirect(url);
		}catch (Exception e){
			e.printStackTrace();
			response.sendRedirect("add-event.jsp");
		}
		
			
			
		
		}
		private String accessToken = "Gc7N0p9GEzD924oEpTcyQIirCSAHcOLD";
		public void getSMSStatus(int tranId) {
			SpeedSMSAPI api=new SpeedSMSAPI(accessToken);
			try {
				String result =api.getStatus(tranId);
				System.out.println(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
	}

}
