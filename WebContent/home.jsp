<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Trang chủ | Quản Lý Lịch</title>
	<!-- Tell the browser to be responsive to screen width -->
  	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  	<meta charset="utf-8">
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
  	<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  	<link rel="stylesheet" href="dist/css/mycss.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="page-user/header.jsp"></jsp:include>
		
		<jsp:include page="page-user/sidebar.jsp"></jsp:include>
		
		<div class="content-wrapper">
      	<!-- Main content -->
      	<section class="content">
	        <div class="row">
	          <div class="col-md-10 col-md-offset-1">
	            <div class="col-md-2 col-sm-2 col-xs-2" id="add-event">
	              <a href="add-event.jsp" class="btn btn-success"><img src="dist/img/add.png" width="18px"><span class="hidden-sm hidden-xs">Thêm mới</span></a>
	            </div>
	            <div class="col-md-8 col-sm-8 col-xs-7">
	              <input type="text" class="form-control" placeholder="Search">
	            </div>
	            <div class="col-md-2 col-sm-2 col-xs-3">
	              <a class="btn btn-primary"><img src="dist/img/search.png" width="20px" style="color:#fff"></a>
	            </div>
	          </div>
	        </div>
	        <div><br></div>
	        <div class="row">
	          <div class="col-md-10 col-md-offset-1">
	            <div class="box box-primary">
	              <div class="box-body no-padding">
	                <!-- THE CALENDAR -->
	                <div id="calendar"></div>
	              </div>
	              <!-- /.box-body -->
	            </div>
	            <!-- /. box -->
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
  	<!-- jQuery UI 1.11.4 -->
  	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
  	<!-- AdminLTE App -->
  	<script src="dist/js/app.min.js"></script>
  	<!-- AdminLTE for demo purposes -->
  	<script src="dist/js/demo.js"></script>
  	<!-- fullCalendar 2.2.5 -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
  	<script src="plugins/fullcalendar/fullcalendar.min.js"></script>
  	<script src="dist/js/myscript.js"></script>
  	<script src="dist/js/my.js"></script>
</body>
</html>