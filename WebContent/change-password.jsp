<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="connect.*,java.util.*" session="true"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Chỉnh sửa thông tin | Quản Lý Lịch</title>
	<!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- fullCalendar 2.2.5-->
    <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.print.css" media="print">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet"  href="dist/css/bootstrap-imageupload.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<% if(session.getAttribute("username")==null || session.getAttribute("username")=="") {
		response.sendRedirect("index.jsp");
	}else{
	%>
	<div class="wrapper">
		<jsp:include page="page-user/header.jsp"></jsp:include>
		
		<jsp:include page="page-user/sidebar.jsp"></jsp:include>
		
		<div class="content-wrapper">
            <section class="content-header">
                <ol class="breadcrumb">
                    <li><a href="home.jsp"><i class="fa fa-dashboard"></i> Home</a>
                    </li>
                    <li class="active">Bản thân</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">

                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="panel panel-primary">
                            <div class="panel-heading"><i class="fa fa-user" aria-hidden="true"></i>  Thay đổi mật khẩu
                            </div>
                            <%
							Connect conn = new Connect();
								String username = session.getAttribute("username").toString();
								ResultSet rs = null;
								String sql = "select * from account where username = '" + username + "'";
								try {
									rs = conn.GetData(sql);
									rs.next();
							%>
                            <div class="panel-body">
                                <form action="ChangePasswordServlet?id=<%=rs.getInt("id") %>" method="POST" role="form">
                                    <div class="form-group">
                                        <label for="">Mật khẩu hiện tại</label>
                                        <input type="password" name="currentPassword" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Mật khẩu mới</label>
                                        <input type="password" name="newPassword" id="newPassword" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Xác nhận mật khẩu</label>
                                        <input type="password" name="confirmPassword" id="confirmPassword" class="form-control">
                                        <span id="notify" style="color:red"></span>
                                    </div>
                                    <div class="prefix"></div>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-refresh"></i> Lưu lại </button>
                                    <button type="reset" class="btn btn-default">Làm lại</button>
                                    <div class="prefix"></div>
                                    <%if(request.getAttribute("err")!=null){ %>
                                    <script>alert(<%=request.getAttribute("err") %>)</script>
                                    <%} %>
                                </form>
                               <% 
			        			}
									catch(Exception e){
									
								}
								%> 
                            </div>
                        </div>

                    </div>
                </div>
            </section>
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
    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
    <!-- fullCalendar 2.2.5 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
    <script src="plugins/fullcalendar/fullcalendar.min.js"></script>
    <script src="dist/js/bootstrap-imageupload.js"></script>
    <script src="dist/js/myscript.js"></script>
    <script>
    	$(document).ready(function(){
    		$("#confirmPassword").keypress(function(e){
    			var key = e.which;
    			var newPassword = $("#newPassword").val();
    			var confirmPassword = $("#confirmPassword").val();
    			if(key == 13){
    				if(newPassword != confirmPassword)
        			{
        				$("#notify").html("Hai Password không khớp");	
        			}
    				else{
    					$("#notify").html("");	
    				}
    			}
    			
    		})
    	})
    </script>
</body>
</html>