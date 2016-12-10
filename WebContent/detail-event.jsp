<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page language="java" import = "connect.*,java.util.*" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Chi tiết sự kiện | Quản Lý Lịch</title>
	<!-- Bootstrap 3.3.6 -->
  	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  	<!-- Font Awesome -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  	<!-- Theme style -->
  	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  	<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
  	<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<% if(session.getAttribute("username")==null || session.getAttribute("username")=="") {
		response.sendRedirect("index.jsp");
	}else{
	%>
	<div class="wrapper">
		<jsp:include page="page-user/header.jsp"></jsp:include>
		
		<jsp:include page="page-user/sidebar.jsp"></jsp:include>
		
		<!-- Content Wrapper. Contains page content -->
	    <div class="content-wrapper">
	      <!-- Content Header (Page header) -->
	      <section class="content-header">
	        <ol class="breadcrumb">
	          <li><a href="home.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
	          
	          <li class="active">Thông tin cá nhân</li>
	        </ol>
	      </section>
			<%
		               		Connect conn = new Connect();
		               		String id = request.getParameter("id");
			        		ResultSet rs = null;
			        		String sql = "select * from event where id = '"+id+"'";
			        		try {
			        			rs = conn.GetData(sql);
			        			if(rs.next()){
			        		%>
	      <!-- Main content -->
	      <section class="content">
	
	        <div class="row">
	          <div class="col-md-8 col-md-offset-2">
	          <div class="panel panel-primary">
	            <div class="panel-heading"><i class="glyphicon glyphicon-th" aria-hidden="true"></i> Chi tiết sự kiện</div>
	            <div class="panel-body">
	                <div class="box box-primary">
	                  <div class="box-body">
	                    <strong><i class="fa fa-info margin-r-5"></i> Sự kiện </strong>
	                    <p class="text-muted"><%=rs.getString("title") %></p>
	                    <hr>
	                    <strong><i class="fa fa-building margin-r-5"></i> Địa điểm</strong>
	                    <p class="text-muted"><%=rs.getString("address") %></p>
	                    <hr>
	                    <strong><i class="fa fa-clock-o margin-r-5"></i> Thời gian diễn ra</strong>
	                    <p class="text-muted">
	                    	<%=rs.getDate("start")%>
	                    	 đến <%=rs.getDate("end") %></p>
	                    <hr>
	                    <strong><i class="fa fa-folder margin-r-5"></i> Nội dung</strong>
	                    <p class="text-muted"><%=rs.getString("description") %></p>
	                    
	                  </div>
	                </div>
	                <a href="edit-event.jsp?id=<%=rs.getInt("id") %>" type="button" class="btn btn-primary"><i class="fa fa-pencil fa-fw"></i> Edit</a>
	                <a href="DeleteEventSerlvet?id=<%=rs.getInt("id") %>" type="button" class="btn btn-danger"><i class="fa fa-pencil fa-fw"></i> Delete</a>
	                <!-- /.box-body -->
	            </div>
	          </div>
	        </div>
	        </div>
	        <%}
			        		}catch(Exception e){
			        			
			        		}
	        %>
	        <!-- /.row -->
	      </section>
	    </div>
	    <!-- /.content-wrapper -->
		
		<jsp:include page="page-user/footer.jsp"></jsp:include>
	</div>
	<%
	}
	%>
	<!-- jQuery 2.2.3 -->
  	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
  	<!-- Bootstrap 3.3.6 -->
  	<script src="bootstrap/js/bootstrap.min.js"></script>
  	<!-- jQuery UI 1.11.4 -->
  	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
  	<!-- AdminLTE App -->
  	<script src="dist/js/app.min.js"></script>
  	<!-- AdminLTE for demo purposes -->
  	<script src="dist/js/demo.js"></script>
  	<!-- fullCalendar 2.2.5 -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
  	<script src="plugins/fullcalendar/fullcalendar.min.js"></script>
</body>
</html>