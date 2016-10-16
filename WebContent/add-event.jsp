<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Sự kiện mới | Quản Lý Lịch</title>
	<!-- Bootstrap 3.3.6 -->
  	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  	<!-- Font Awesome -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  	<!-- fullCalendar 2.2.5-->
  	<link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.min.css">
  	<link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.print.css" media="print">
  	<!-- Theme style -->
  	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  	<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  	<link href="dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
  	<link rel="stylesheet" type="text/css" href="dist/css/mycss.css">
</head>
<body class="hold-transition skin-green sidebar-mini">
	<div class="wrapper">
		<jsp:include page="page-user/header.jsp"></jsp:include>
		
		<jsp:include page="page-user/sidebar.jsp"></jsp:include>
		
		<!-- Content Wrapper. Contains page content -->
	    <div class="content-wrapper">
	      <!-- Content Header (Page header) -->
	      <section class="content-header">
	        <ol class="breadcrumb">
	          <li><a href="home.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
	          <li class="active">Thêm sự kiện </li>
	        </ol>
	      </section>
	
	      <!-- Main content -->
	      <section class="content" style="margin-top:50px">
	        <div class="row">
	          <div class="col-md-10 col-md-offset-1">
	            <div class="panel panel-primary">
	              
	              <div class="panel-heading">
	                <img src="dist/img/add-event.png" class="img-responsive" width="40px" alt="">
	              </div>
	              <div class="panel-body">
	                <form class="form-horizontal" name="frmEvent">
	                  <div class="form-group">
	                    <label class="col-sm-2 control-label">Tên sự kiện</label>
	                    <div class="col-sm-10">
	                      <input type="text" class="form-control" name="name_event" ng-model="event.name_event" placeholder="Nhập tên sự kiện" ng-required="true">
	                      <span id="helpBlock2" class="help-block" ng-show="frmEvent.name_event.$error.required">Vui lòng nhập tên sự kiện</span>
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label class="col-sm-2 control-label">Thời gian</label>
	                    <div class="col-sm-5">
	                      <div class="input-group date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
	                          <input class="form-control" size="16" type="text" value="" readonly name="time_start" ng-model="event.time_start" ng-required="true">
	                          <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
	                          <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
	                      </div>
	                      <span id="helpBlock2" class="help-block" ng-show="frmEvent.time_start.$error.required">Vui lòng nhập thời gian bắt đầu sự kiện</span>
	                      <input type="hidden" id="dtp_input1" value="" /><br/>
	                    </div>
	                    <div class="col-sm-5">
	                      <div class="input-group date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
	                          <input class="form-control" size="16" type="text" value="" readonly name="time_end" ng-model="event.time_end" ng-required="true">
	                          <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
	                          <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
	                      </div>
	                      <span id="helpBlock2" class="help-block" ng-show="frmEvent.time_end.$error.required">Vui lòng nhập thời gian kết thúc sự kiện</span>
	                      <input type="hidden" id="dtp_input1" value="" />
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label class="col-sm-2 control-label">Nơi diễn ra</label>
	                    <div class="col-sm-6">
	                      <input type="text" name="address" ng-model="event.address" ng-required="true" class="form-control" placeholder="Thêm nơi diễn ra sự kiện">
	                      <span id="helpBlock2" class="help-block" ng-show="frmEvent.address.$error.required">Vui lòng nhập nơi diễn ra sự kiện</span>
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label class="col-sm-2 control-label">Thêm bạn</label>
	                    <div class="col-sm-6">
	                      <div class="input-group">
	                        <input type="text" class="form-control" placeholder="Thêm bạn bè ...">
	                        <span class="input-group-btn">
	                          <button class="btn btn-primary" type="button" name="addfriend" id="addfriend"><img src="dist/img/add.png" width="20px"></button>
	                        </span>
	                      </div><!-- /input-group -->
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label class="col-sm-2 control-label">Lặp lại</label>
	                    <div class="col-sm-10">
	                      <div class="checkbox">
	                        <label>
	                          <input type="checkbox" data-toggle="modal" data-target=".bs-example-modal-sm">
	                        </label>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label class="col-sm-2 control-label">Thông báo</label>
	                    <div class="col-sm-3">
	                      <select class="form-control">
	                        <option>Email</option>
	                        <option>Tin Nhắn</option>
	                      </select>
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label class="col-sm-2 control-label">Nội dung</label>
	                    <div class="col-sm-10">
	                      <textarea name="" rows="7" class="form-control"></textarea>
	                    </div>
	                  </div>
	                  <div class="text-center">
	                    <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Thêm mới</button>
	                    <button type="reset" class="btn btn-default">Làm lại</button>
	                  </div>
	                </form>
	              </div>
	            </div>
	          </div>
	        </div>
	      </section>
	      <!-- /.content -->
	    </div>
		
	  	<jsp:include page="page-user/footer.jsp"></jsp:include>
	</div>
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog">
	    <div class="modal-dialog modal-sm" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <h4 class="modal-title">Lặp vào các ngày</h4>
	        </div>
	        <div class="modal-body">
	          <div class="checkbox">
	            <label>
	              <input type="checkbox"> Thứ Hai
	            </label>
	          </div>
	          <div class="checkbox">
	            <label>
	              <input type="checkbox"> Thứ Ba
	            </label>
	          </div>
	          <div class="checkbox">
	            <label>
	              <input type="checkbox"> Thứ Tư
	            </label>
	          </div>
	          <div class="checkbox">
	            <label>
	              <input type="checkbox"> Thứ Năm
	            </label>
	          </div>
	          <div class="checkbox">
	            <label>
	              <input type="checkbox"> Thứ Sáu
	            </label>
	          </div>
	          <div class="checkbox">
	            <label>
	              <input type="checkbox"> Thứ Bảy
	            </label>
	          </div>
	          <div class="checkbox">
	            <label>
	              <input type="checkbox"> Chủ Nhật
	            </label>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	  </div><!-- /.modal -->
	  <!-- ./wrapper -->
	
  
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
  <script src="dist/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>

  <script src="dist/js/my.js"></script>
  <!-- Page specific script -->
  <script type="text/javascript" src="dist/js/datetime.js"></script>
  <script type="text/javascript" src="dist/js/app/app.js"></script>
  <script type="text/javascript" src="dist/js/angular.min.js"></script>
</body>
</html>