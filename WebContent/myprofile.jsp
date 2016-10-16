<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Trang Cá Nhân | Quản Lý Lịch</title>
	<!-- Bootstrap 3.3.6 -->
  	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  	<!-- Font Awesome -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  	<!-- Theme style -->
  	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  	<!-- Skin -->
  	<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-green sidebar-mini">
	<div class="wrapper">
		<jsp:include page="page-user/header.jsp"></jsp:include>
		
		<jsp:include page="page-user/sidebar.jsp"></jsp:include>
		
		<div class="content-wrapper">
	      <section class="content-header">
	        <ol class="breadcrumb">
	          <li><a href="home.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
	          <li class="active">Thông tin cá nhân</li>
	        </ol>
	      </section>
	
	      <!-- Main content -->
	      <section class="content">
	
	        <div class="row">
	          <div class="col-md-6 col-md-offset-3">
	          <div class="panel panel-primary">
	            <div class="panel-heading"><i class="fa fa-user" aria-hidden="true"></i> Thông tin cá nhân</div>
	            <div class="panel-body">
	                <img class="profile-user-img img-responsive img-circle" src="dist/img/male-member.png" alt="User profile picture">
	                <h3 class="profile-username text-center">Trần Đăng Khoa</h3>
	                <p class="text-muted text-center">Người dùng</p>
	                <div class="box box-primary">
	                  <div class="box-body">
	                    <strong><i class="fa fa-book margin-r-5"></i> Họ tên: </strong>
	                    <p class="text-muted">Trần Đăng Khoa</p>
	                    <hr>
	                    <strong><i class="fa fa-transgender margin-r-5"></i> Giới tính: </strong>
	                    <p class="text-muted">Nam</p>
	                    <hr>
	                    <strong><i class="glyphicon glyphicon-envelope margin-r-5"></i> Email:</strong>
	                    <p class="text-muted">13110081@student.hcmute.edu.vn</p>
	                    <hr>
	                    <strong><i class="glyphicon glyphicon-earphone margin-r-5"></i> Số điện thoại</strong>
	                    <p class="text-muted">0962228269</p>
	                    
	                  </div>
	                </div>
	                <a href="edit-profile.jsp" type="button" class="btn btn-primary"><i class="fa fa-pencil fa-fw"></i> Edit</a>
	                <!-- /.box-body -->
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