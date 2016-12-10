<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import = "connect.*,java.util.*" session="true" %>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Admin</title>
	<!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- DataTables -->
	<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
	       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css"> 
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<% if(session.getAttribute("username")==null || session.getAttribute("username")=="") {
		response.sendRedirect("index.jsp");
	}else{
	%>
	<% String username=session.getAttribute("username").toString();
	Connect connect = new Connect();
	ResultSet rst = null;
	String sql1 = "select * from account where username='"+username+"'";
	int role;
	try {
		rst = connect.GetData(sql1);
		while(rst.next()){ 
			role=rst.getInt("role");
			if(role==0)
				response.sendRedirect("home.jsp");
		}
	}
	catch(Exception e){ }
	
	%>
	
	<div class="wrapper">
		<jsp:include page="page-admin/header.jsp"></jsp:include>
		
		<jsp:include page="page-admin/sidebar.jsp"></jsp:include>
		
		<div class="content-wrapper">
	
	      <!-- Main content -->
	      <section class="content">
	
	        <div class="row">
	          <div class="col-md-6 col-md-offset-3">
	          <div class="panel panel-primary">
	          				<%
		               		Connect conn = new Connect();
		               		String id = request.getParameter("id");
			        		ResultSet rs = null;
			        		String sql = "select * from account where id = '"+id+"'";
			        		try {
			        			rs = conn.GetData(sql);
			        			rs.next();
			        		%>
	            <div class="panel-heading"><i class="fa fa-user" aria-hidden="true"></i> Thông tin người dùng</div>
	            <div class="panel-body">
	                <img class="profile-user-img img-responsive img-circle" src="dist/img/male-member.png" alt="User profile picture">
	                <h3 class="profile-username text-center"><%=rs.getString("fullname") %></h3>
	                <p class="text-muted text-center">Người dùng</p>
	                <div class="box box-primary">
	                  <div class="box-body">
	                    <strong><i class="fa fa-book margin-r-5"></i> Họ tên: </strong>
	                    <p class="text-muted"><%=rs.getString("fullname") %></p>
	                    <hr>
	                    <strong><i class="fa fa-transgender margin-r-5"></i> Giới tính: </strong>
	                    <p class="text-muted">
	                    	<%if(rs.getInt("gender")==0){ %>
	                    		Nữ
	                    	<%}else{ %>
	                    		Nam
	                    	<%} %>
	                    </p>
	                    <hr>
	                    <strong><i class="glyphicon glyphicon-envelope margin-r-5"></i> Email:</strong>
	                    <p class="text-muted"><%=rs.getString("email") %></p>
	                    <hr>
	                    <strong><i class="glyphicon glyphicon-earphone margin-r-5"></i> Số điện thoại</strong>
	                    <p class="text-muted"><%=rs.getString("phone") %></p>
	                    
	                  </div>
	                </div>
	                <a href="admin-edit.jsp?id=<%=rs.getInt("id") %>" type="button" class="btn btn-primary"><i class="fa fa-pencil fa-fw"></i> Edit</a>
	                <!-- /.box-body -->
	                <% 
			        	}catch(Exception e){
			        		
			        	}
			        %>
	            </div>
	          </div>
	        </div>
	        </div>
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
	<!-- DataTables -->
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>
	<script>
	  $(function () {
	    $("#example1").DataTable();
	    $('#example2').DataTable({
	      "paging": true,
	      "lengthChange": false,
	      "searching": false,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });
	  });
	</script>
  
</body>
</html>