<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="">
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
  	<link rel="stylesheet" href="dist/css/mycss.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="page-admin/header.jsp"></jsp:include>
		
		<jsp:include page="page-admin/sidebar.jsp"></jsp:include>
		
		<div class="content-wrapper">
	    <!-- Content Header (Page header) -->
	    <section class="content-header">
	      <div>
	        <div class="col-md-8 col-md-offset-2">
	          <h1>Thêm mới</h1>
	        </div>
	      </div>
	    </section>
	    <!-- Main content -->
	    <section class="content">
	      <div class="row">
	        <!-- column -->
	        <div class="col-md-8 col-md-offset-2">
	          <!-- general form elements -->
	          <div class="panel panel-primary">
	            <div class="panel-heading">Thêm người dùng</div>
	            <div class="panel-body">
	                        <div class="box box-primary">
	            <form method="POST" name="frmAdmin">
	              <div class="box-body">
	                <div class="form-group">
	                  <label>Tên đăng nhập</label>
	                  <input type="email" class="form-control" name="username" placeholder="Nhập UserName" ng-model="user.username" ng-required="true">
	                  <span id="helpBlock2" class="help-block" ng-show="frmAdmin.username.$error.required">Vui lòng nhập username</span>
	                </div>
	                <div class="form-group">
	                  <label>Mật khẩu</label>
	                  <input type="password" class="form-control" name="password" placeholder="Nhập mật khẩu" ng-model="user.password" ng-required="true">
	                  <span id="helpBlock2" class="help-block" ng-show="frmAdmin.password.$error.required">Vui lòng nhập password</span>
	                </div>
	                <div class="form-group">
	                  <label>Nhắc lại mật khẩu</label>
	                  <input type="password" class="form-control" name="re_password" placeholder="Nhập lại mật khẩu" ng-model="user.re_password" ng-required="true">
	                  <span id="helpBlock2" class="help-block" ng-show="frmAdmin.re_password.$error.required">Vui lòng xác nhận lại password</span>
	                </div>
	                <label>Giới tính</label>
	                <div class="radio">
	                  <label class="col-md-4">
	                    <input type="radio" name="rdoSex" checked > Nam  
	                  </label>
	                  
	                  <input type="radio" name="rdoSex"> Nữ
	                </div>
	                <div class="form-group">
	                  <label>Tên đầy đủ</label>
	                  <input type="text" class="form-control" name="fullname" placeholder="Nhập tên người dùng" ng-model="user.fullname" ng-required="true">
	                  <span id="helpBlock2" class="help-block" ng-show="frmAdmin.fullname.$error.required">Vui lòng nhập tên đầy đủ của bạn</span>
	                </div>
	                <div class="form-group">
	                  <label>Email</label>
	                  <input type="email" class="form-control" name="email" placeholder="Nhập email" ng-model="user.email" ng-required="true">
	                  <span id="helpBlock2" class="help-block" ng-show="frmAdmin.email.$error.required">Vui lòng nhập Email của bạn</span>
	                  <span id="helpBlock2" class="help-block" ng-show="frmAdmin.email.$error.email">Định dạng email chưa đúng</span>
	                </div>
	                <div class="form-group">
	                  <label>Số điện thoại</label>
	                  <input type="text" class="form-control" name="phone" placeholder="Nhập số điện thoại" ng-model="user.phone" ng-required="true">
	                  <span id="helpBlock2" class="help-block" ng-show="frmAdmin.phone.$error.required">Vui lòng nhập số điện thoại</span>
	                </div>
	              </div>
	              <div class="box-footer">
	                <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Thêm mới</button>
	                <button type="reset" class="btn btn-default">Làm lại</button>
	              </div>
	            </form>
	          </div>
	            </div>
	          </div>
	        </div>
	      <!-- /.row -->
	    </section>
	    <!-- /.content -->
	  </div>
		
		<jsp:include page="page-user/footer.jsp"></jsp:include>
	</div>
	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>
	<script src="dist/js/angular.min.js"></script>
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