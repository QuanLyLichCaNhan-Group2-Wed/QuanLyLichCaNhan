<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.*"%>
<%@ page language="java" import = "connect.*,java.util.*" session="true" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Admin</title>
	<!-- Bootstrap 3.3.6 -->
  	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  	
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  	<!-- DataTables -->
  	<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  	<!-- Theme style -->
  	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
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
		
		<!-- Nội dung -->
		  <div class="content-wrapper">
		    <!-- Content Header (Page header) -->
		    <section class="content-header">
		      <h1>Danh sách</h1>
		    </section>
		    <!-- Main content -->
		    <section class="content">
		      <div class="row">
		        <div class="col-xs-12">
		          <div class="box">
		            <!-- /.box-header -->
		            <div class="box-body table-responsive">
		              <table id="example1" class="table table-bordered table-hover table-striped">
		                <thead>
		                <tr>
		                	<th>ID</th>
		                	<th>UserName</th>
		                	<th>Gender</th>
		                	<th>FullName</th>
		                	<th>Email</th>
		                	<th>Phone</th>
		                	<th>Role</th>
		                	<th>Status</th>
		                  	<th>Show</th>
		                  	<td>Edit</td>
		                  	<td>Lock</td>
		                </tr>
		                </thead>
		                
		                <tbody>
			            	<%
			            		
			            	Connect conn = new Connect();
			        		ResultSet rs = null;
			        		String sql = "select * from account where id!=1";
			        		try {
			        			rs = conn.GetData(sql);
			        			while(rs.next()){
			        		%>
			        			<tr>
			                    <td><%=rs.getInt("id") %></td>
			                    
			                    <td><%=rs.getString("username") %></td>
			                    <td>
			                    	<% if(rs.getInt("gender") == 0){%>
			                    		Nam
			                    	<%
			                    		} else{
			                    	%>
			                    		Nữ
			                    	<%
			                    		}
			                    	%>
			                    </td>
			                    <td><%=rs.getString("fullname") %></td>
			                    <td><%=rs.getString("email") %></td>
			                    <td><%=rs.getString("phone") %></td>
			                    <td>
			                    	<%if(rs.getInt("role")==1){ %>
			                    		Admin
			                    	<%}else{ %>
			                    		User
			                    	<%} %>
			                    </td>
			                    <td>
			                    	<%if(rs.getInt("status")==1){ %>
			                    		Online
			                    	<%}else { %>
			                    		Offline
			                    	<%} %>
			                    		
			                    </td>
			                    <td class="text-center"><a href="admin-show.jsp?id=<%=rs.getInt("id") %>" class="btn btn-success"><i class="fa fa-hand-o-right"></i>Show</a></td>
				                <td class="text-center"><a href="admin-edit.jsp?id=<%=rs.getInt("id") %>" class="btn btn-info"><i class="fa fa-pencil fa-fw"></i>Edit</a></td>
				                <td class="text-center"><a data-id="<%=rs.getInt("id")%>" href="#" <%if(rs.getInt("block")==0){%>
				                class="btn btn-success block">	Click khóa
				                <%} else{ %> class="btn btn-danger block"> Click mở <%} %> </a></td>
			                	</tr>
			                <%
			        			}

			        		} catch (Exception e) {
			        			// TODO Auto-generated catch block
			        			System.out.println("Error catch");
			        			e.printStackTrace();
			        			
			        		}
			            	%>
		                </tbody>
		                
		              </table>
		            </div>
		            <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
		        <!-- /.col -->
		      </div>
		      <!-- /.row -->
		    </section>
		    <!-- /.content -->
		  </div>
		
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
	<script src="dist/js/scriptuser.js""></script>
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