<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="dist/css/bootstrap-imageupload.css">
</head>
<body class="hold-transition skin-green sidebar-mini">
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
                            <div class="panel-heading"><i class="fa fa-user" aria-hidden="true"></i>  Thông tin cá nhân
                            </div>
                            <div class="panel-body">
                                <form action="" method="POST" role="form">
                                    <div class="form-group">
                                        <label for="">Tên đăng nhập</label>
                                        <input type="text" class="form-control" disabled value="TKhoa">
                                    </div>
                                    <div class="form-group">
                                        <input type="checkbox" id="changepass" value=""> Đổi mật khẩu
                                    </div>
                                    <div class="form-group">
                                        <label>Mật khẩu hiện tại</label>
                                        <input type="password" id="CurrentPass" disabled="" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Mật khẩu mới</label>
                                        <input type="password" id="NewPass" disabled="" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Xác nhận lại mật khẩu</label>
                                        <input type="password" id="ConfirmPass" disabled="" class="form-control">
                                    </div>
                                    <label>Giới tính</label>
                                    <div class="radio">
                                        <label class="col-md-4">
                                            <input type="radio" name="optionsRadios" checked> Nam
                                        </label>
                                        <label>
                                            <input type="radio" name="optionsRadios"> Nữ
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Email</label>
                                        <input type="text" class="form-control" disabled value="trandangkhoa@gmail.com">
                                    </div>
                                    <div class="form-group">
                                        <label for="">Tên đầy đủ</label>
                                        <input type="text" class="form-control" id="" value="Trần Đăng Khoa">
                                    </div>
                                    <div class="form-group">
                                        <label for="">Số điện thoại</label>
                                        <input type="text" class="form-control" id="" value="0962228269">
                                    </div>
                                    <div class="imageupload panel panel-primary">
                                        <div class="panel-heading clearfix">
                                            <h3 class="panel-title pull-left">Upload Image</h3>
                                        </div>
                                        <div class="file-tab panel-body">
                                            <label class="btn btn-primary btn-file">
                                                <span>Browse</span>
                                                <input type="file" name="image-file">
                                            </label>
                                            <button type="button" class="btn btn-default">Remove</button>
                                        </div>
                                    </div>
                                    <a href="myprofile.jsp" type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> Lưu lại </a>
                                    <button type="reset" class="btn btn-default">Làm lại</button>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
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
    <script src="dist/js/bootstrap-imageupload.js"></script>
    <script src="dist/js/myscript.js"></script>
</body>
</html>