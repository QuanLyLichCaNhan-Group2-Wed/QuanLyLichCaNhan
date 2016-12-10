<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="connect.*,java.util.*" session="true"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<aside class="main-sidebar">
      <!-- sidebar: style can be found in sidebar.less -->
      <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
		         <div class="pull-left image">
		         <%
							Connect conn = new Connect();
								String username = session.getAttribute("username").toString();
								ResultSet rs = null;
								String sql = "select * from account where username = '" + username + "'";
								try {
									rs = conn.GetData(sql);
									if(rs.next()){
									
						%>
		            <img src="<%=rs.getString("avatar") %>" class="img-circle" alt="User Image">
		            <%}
								} catch (Exception e) {

									}
							%>
		         </div>
		         <div class="pull-left info">
		            <p><%=session.getAttribute("fullname") %></p>
		            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
		         </div>
		      </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
          <li class="header text-center"><h4>Quản Lý</h4></li>
          <li class="active">
            <a href="home.jsp">
              <i class="fa fa-calendar"></i> <span>Calendar</span>
              <span class="pull-right-container">
            </span>
            </a>
          </li>
          <li>
            <a href="myprofile.jsp">
              <i class="fa fa-user"></i> <span>Thông Tin Cá Nhân</span>
              <span class="pull-right-container">
            </span>
            </a>
          </li>
        </ul>
      </section>
      <!-- /.sidebar -->
    </aside>
</body>
</html>