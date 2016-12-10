package controller;

import java.awt.List;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.mysql.cj.api.jdbc.Statement;
import com.mysql.cj.jdbc.PreparedStatement;

import connect.Connect;
import dao.UserDaoHandle;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/Calender_Event")
public class Calender_Event extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoHandle userDao = new UserDaoHandle();

	public Calender_Event() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * PreparedStatement st = null; Statement stat = null;
		 */
		ResultSet result = null;
		// Connection con = null;

		Connect conn = new Connect();
		try {
			response.setContentType("application/json");
			response.setHeader("Cache-Control", "nocache");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();

			HttpSession session = request.getSession();
			String username = session.getAttribute("username").toString();
			int id_acc = userDao.getId(username);

			JSONArray jArray = new JSONArray();
			// JSONObject json = new JSONObject();
			Gson gson = new Gson();
			String query = "select * from event where id_acc=" + id_acc;

			result = conn.GetData(query);

			while (result.next()) {
				int id = result.getInt("id");
				// int id_acc = result.getInt("id_acc");
				String title = result.getString("title");
				java.sql.Timestamp start = result.getTimestamp("start");
				java.sql.Timestamp end = result.getTimestamp("end");
				boolean allDay = result.getBoolean("allDay");
				String suburl = result.getString("url");
				String url = suburl + String.valueOf(id);
				String description = result.getString("description");
				String backgroundColor=result.getString("background_color");
				String dow=result.getString("dow");
				JSONObject jobj = new JSONObject();

				jobj.put("id", id);
				jobj.put("title", title);
				jobj.put("start", start);
				jobj.put("end", end);
				jobj.put("allDay", allDay);
				jobj.put("url", url);
				jobj.put("description", description);
				jobj.put("backgroundColor", backgroundColor);
				jobj.put("dow", dow);
				
				jArray.add(jobj);
			}

			System.out.println(jArray);			
			String temp = gson.toJson(jArray);
			response.getWriter().write(temp);

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		int id_acc = userDao.getId(username);

		Connect conn = new Connect();
		// 1. get received JSON data from request
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
		String json = "";
		if (br != null) {
			json = br.readLine();
		}

		JSONParser parser = new JSONParser();
		try {
			JSONObject json1 = (JSONObject) parser.parse(json);

			String start = (String) json1.get("start");
			String end = (String) json1.get("end");
			long id = (Long) json1.get("id");
			System.out.println(start +"  "+ end);
			System.out.println(id);

			String sql = "update event set start='" + start + "',end='" + end + "'where id='" + id+"'";
			int kq = conn.Update(sql);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
