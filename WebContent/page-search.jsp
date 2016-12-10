<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ page import="java.sql.*"%>
<%@ page language="java" import = "connect.*,java.util.*" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ | Quản Lý Lịch</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<meta charset="utf-8">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- fullCalendar 2.2.5-->
<link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet"
	href="plugins/fullcalendar/fullcalendar.print.css" media="print">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<link href="dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<link rel="stylesheet" type="text/css" href="dist/css/mycss.css">
<link rel="stylesheet" type="text/css" href="dist/css/select2.min.css">
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
						<a href="add-event.jsp" class="btn btn-success"><img
							src="dist/img/add.png" width="18px"><span
							class="hidden-sm hidden-xs">Thêm mới</span></a>
					</div>
					<form action="SearchEventServlet" method="POST">
					<div class="col-md-10 col-sm-10 col-xs-10">
						<input type="text" class="form-control"
							placeholder="Nhập tên sự kiện cần tìm ..."><br />
					</div>
					<br>
					<div class="form-group">
						<label class="col-sm-2 control-label">Tìm theo ngày</label>
						<div class="col-md-5">
							<div class="input-group date form_datetime"
								data-date="2016-09-16T05:25:07Z" data-date-format=""
								data-link-field="dtp_input1">
								<input class="form-control" size="16" type="text" value=""
									placeholder="Thời gian bắt đầu" readonly name="time_start"
									ng-model="event.time_start" ng-required="true"> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-remove"></span></span> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-th"></span></span>
							</div>
							<input type="hidden" id="dtp_input1" value="" /><br />
						</div>

						<div class="col-md-5">
							<div class="input-group date form_datetime"
								data-date="2016-09-16T05:25:07Z" data-date-format=""
								data-link-field="dtp_input1">
								<input class="form-control" size="16"
									placeholder="Thời gian kết thúc" type="text" value="" readonly
									name="time_end" ng-model="event.time_end" ng-required="true">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-remove"></span></span> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-th"></span></span>
							</div>
							<input type="hidden" id="dtp_input1" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-2" style="margin-right:30px">
		                 	<button type="submit" class="btn btn-primary btn-block" style="margin-left:15px"> Tìm kiếm</button>
		                 </div>
					</div>
					</form>
				</div>
			</div>
			<div>
			
				<br>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="box box-primary">
						<div class="box-body no-padding">
							<!-- THE CALENDAR -->
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>Tên sự kiện</th>
											<th>Thời gian bắt đầu</th>
											<th>Thời gian kết thúc</th>
											<th>Chi tiết</th>
										</tr>
									</thead>
									<tbody>
										<%
											if (request.getAttribute("arr_event") != null) {
							                    ArrayList al = (ArrayList) request.getAttribute("arr_event");
							                    System.out.println(al);
							                    Iterator itr = al.iterator();
							                    try{
							                    
							                    	while (itr.hasNext()) {
							                        ArrayList pList = (ArrayList) itr.next();
						                 %>
										<tr>
											<td><%=pList.get(0) %></td>
											<td><%=pList.get(1) %></td>
											<td><%=pList.get(2) %></td>
											<td><a href="detail-event?id=<%=pList.get(3) %>">Chi tiết</a></td>
										</tr>
										<%}
						                    
						                    }catch(Exception e){
						                    	System.out.print(e.toString());
						                    }
											}
							            %>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /. box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row --> </section>
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
	<script src="dist/js/select2.min.js"></script>
	<script src="dist/js/select2/full.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- fullCalendar 2.2.5 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="plugins/fullcalendar/fullcalendar.min.js"></script>
	<script src="dist/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>

	<script src="dist/js/my.js" charset="UTF-8"></script>
	<!-- Page specific script -->
	<script type="text/javascript" src="dist/js/datetime.js"></script>
	<script type="text/javascript" src="dist/js/app/app.js"></script>
	<script type="text/javascript" src="dist/js/angular.min.js"></script>
	<script type="text/javascript">
  	$("#addfriend").select2();  
  </script>
</body>
</html>