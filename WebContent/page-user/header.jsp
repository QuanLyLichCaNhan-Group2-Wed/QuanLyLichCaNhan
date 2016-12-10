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
	<header class="main-header">
      <!-- Logo -->
      <a href="home.jsp" class="logo">
		<%
			Connect conn = new Connect();
				String username = session.getAttribute("username").toString();
				ResultSet rs = null;
				String sql = "select * from account where username = '" + username + "'";
				try {
					rs = conn.GetData(sql);
				if(rs.next()){
		%>
        <span class="logo-mini">
            <img src="dist/img/calendar.png" alt="" width="45px" height="45px">
          </span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg">
          <img src="dist/img/calendar.png" alt="" width="45px" height="45px">
          
          <b>Quản lý lịch</b></span>
      </a>
      <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>

        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
            
            <li class="dropdown user user-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="<%=rs.getString("avatar") %>" class="user-image" alt="User Image">
                <span class="hidden-xs"><%=session.getAttribute("fullname") %></span>
              </a>
              <ul class="dropdown-menu">
                <!-- User image -->
                <li class="user-header">
                  <img src="<%=rs.getString("avatar") %>" class="img-circle" alt="User Image">
                  <p>Group 2 - Web Developer<small><b><%=session.getAttribute("fullname") %></b></small></p>
                </li>

                <!-- Menu Footer-->
                <li class="user-footer">
                  <div class="pull-left">
                    <a href="myprofile.jsp" class="btn btn-default"><i class="glyphicon glyphicon-user "></i> Trang cá nhân</a>
                  </div>
                  <div class="pull-right">
                  	
                    <a href="LogoutServlet" class="btn btn-default"><i class="glyphicon glyphicon-off"></i> Đăng xuất</a>
                  </div>
                </li>
              </ul>
            </li>
          </ul>
        </div>
        <%}
				} catch (Exception e) {

				}
			%>
      </nav>
    </header>
</body>
</html>