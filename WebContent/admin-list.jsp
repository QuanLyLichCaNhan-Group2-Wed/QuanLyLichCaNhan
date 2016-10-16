<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Admin</title>
	<!-- Bootstrap 3.3.6 -->
  	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  	<!-- Font Awesome -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  	<!-- Ionicons -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  	<!-- DataTables -->
  	<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  	<!-- Theme style -->
  	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  	<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-green sidebar-mini">
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
		            <div class="box-body">
		              <table id="example1" class="table table-bordered table-hover table-striped">
		                <thead>
		                <tr>
		                  <th>ID</th>
		                  <th>UserName</th>
		                  <th>Email</th>
		                  <th>Phone</th>
		                  <th>Sex</th>
		                  <th>Show</th>
		                  <td>Edit</td>
		                  <td>Delete</td>
		                </tr>
		                </thead>
		                <tbody>
		                <tr>
		                  <td>1</td>
		                  <td>Trần Quốc Thiện</td>
		                  <td>tranquocthien@gmail.com</td>
		                  <td>01658890216</td>
		                  <td>Nam</td>
		                  <td class="text-center"><a href="admin-show.jsp" class="btn btn-success"><i class="fa fa-hand-o-right"></i>Show</a></td>
		                  <td class="text-center"><a href="admin-edit.jsp" class="btn btn-info"><i class="fa fa-pencil fa-fw"></i>Edit</a></td>
		                  <td class="text-center"><a class="btn btn-danger"><i class="fa fa-trash-o fa-fw"></i>Delete</a></td>
		                </tr>
		                <tr>
		                  <td>3</td>
		                  <td>Trần Đăng Khoa</td>
		                  <td>trandangkhoa@gmail.com</td>
		                  <td>01658890216</td>
		                  <td>Nam</td>
		                  <td class="text-center"><a href="admin-show.jsp" class="btn btn-success"><i class="fa fa-hand-o-right"></i>Show</a></td>
		                  <td class="text-center"><a href="admin-edit.jsp" class="btn btn-info"><i class="fa fa-pencil fa-fw"></i>Edit</a></td>
		                  <td class="text-center"><a class="btn btn-danger"><i class="fa fa-trash-o fa-fw"></i>Delete</a></td>
		                </tr>
		                <tr>
		                  <td>3</td>
		                  <td>Nguyễn Thanh An</td>
		                  <td>nguyenthanhan@gmail.com</td>
		                  <td>01658890216</td>
		                  <td>Nam</td>
		                  <td class="text-center"><a href="admin-show.jsp" class="btn btn-success"><i class="fa fa-hand-o-right"></i>Show</a></td>
		                  <td class="text-center"><a href="admin-edit.jsp" class="btn btn-info"><i class="fa fa-pencil fa-fw"></i>Edit</a></td>
		                  <td class="text-center"><a class="btn btn-danger"><i class="fa fa-trash-o fa-fw"></i>Delete</a></td>
		                </tr>
		                <tr>
		                  <td>4</td>
		                  <td>Bùi Tấn Hiển</td>
		                  <td>buitanhien@gmail.com</td>
		                  <td>01658890216</td>
		                  <td>Nam</td>
		                  <td class="text-center"><a href="admin-show.jsp" class="btn btn-success"><i class="fa fa-hand-o-right"></i>Show</a></td>
		                  <td class="text-center"><a href="admin-edit.jsp" class="btn btn-info"><i class="fa fa-pencil fa-fw"></i>Edit</a></td>
		                  <td class="text-center"><a class="btn btn-danger"><i class="fa fa-trash-o fa-fw"></i>Delete</a></td>
		                </tr>
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