<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.*"%>
<%@ page language="java" import = "connect.*,java.util.*" session="true" %>
<html ng-app="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản Lý Lịch</title>
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="dist/css/mycss.css">
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue">
	<header class="main-header">
		<!-- Logo -->
		<a href="index.jsp" class="logo"> <span class="logo-mini">
				<img src="dist/img/calendar.png" alt="" width="45px" height="45px">
		</span> <!-- logo for regular state and mobile devices --> <span
			class="logo-lg"> <img src="dist/img/calendar.png" alt=""
				width="45px" height="45px"> <b>Quản lý lịch</b></span>
		</a>
		<nav class="navbar navbar-static-top">
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<li class="dropdown user user-menu"><a href="#"
						class="dropdown-toggle" data-toggle="modal"
						data-target="#ModalDangNhap"> <img src="dist/img/login.png"
							class="user-image"> <span class="hidden-xs">Đăng
								Nhập</span>
					</a></li>
					<li class="dropdown user user-menu"><a href="#"
						class="dropdown-toggle" data-toggle="modal"
						data-target="#ModalDangKy"> <img src="dist/img/register.png"
							class="user-image"> <span class="hidden-xs">Đăng Ký</span>
					</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<div id="bg">
		<img width="100%" height="100%" src="dist/img/anh-rang-dong.jpg" />
	</div>
	<div class="container">
		<div class="modal fade" id="ModalDangNhap" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" style="border-radius: 10">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h2 class="modal-title text-center" id="exampleModalLabel">Đăng
							Nhập</h2>
					</div>
					<div class="modal-body">
						<form action="LoginServlet" method="POST" role="form">
							<label>Tên đăng nhập</label>
							<div class="input-group">
								<input type="text" class="form-control" name="username"
									placeholder="Enter UserName"> <span
									class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span>
							</div>
							<label>Mật khẩu</label>
							<div class="input-group">
								<input type="password" name="password" class="form-control"
									placeholder="Enter Password"> <span
									class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span>
							</div>
							<br> <input type="checkbox" name="" value=""> Nhớ
							mất khẩu
							<button type="submit" class="btn btn-primary" style="float: right"> Đăng Nhập <i class="fa fa-sign-in"></i></button>
							<br>
							<br>		
										
							 <div id="error" style="color:red">
							   	</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="ModalDangKy" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h2 class="modal-title text-center" id="exampleModalLabel">Đăng
							Ký</h2>
					</div>
					<div class="modal-body">
						<!-- FORM ĐĂNG KÝ-->
						<form action="RegisterServlet" method="POST" role="form"
							name="frmDangKy">
							<label>Tên đăng nhập</label>
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="Nhập Username" id="username" name="username"
									ng-model="dangky.username" ng-required="true"> <span
									id="helpBlock2" class="help-block"
									ng-show="frmDangKy.username.$error.required">Vui lòng
									nhập Username</span>
							</div>
							<label>Mật khẩu</label>
							<div class="form-group">
								<input type="password" class="form-control"
									placeholder="Nhập mật khẩu" name="password" id="password"
									ng-model="dangky.password" ng-required="true"> <span
									id="helpBlock2" class="help-block"
									ng-show="frmDangKy.password.$error.required">Vui lòng
									nhập Password</span>
							</div>
							<label>Nhập lại mật khẩu</label>
							<div class="group-group">
								<input type="password" class="form-control"
									onChange="CheckPasswordMatch();"
									placeholder="Nhắc lại mật khẩu" id="repassword"
									name="repassword" ng-model="dangky.repassword"
									ng-required="true"> <span id="helpBlock2"
									class="help-block"
									ng-show="frmDangKy.repassword.$error.required">Vui lòng
									nhập lại Password</span> <span id="error" style="color: red"
									class="help-block"></span>
							</div>
							<label>Giới tính</label>
							<div class="radio">
								<label class="col-md-4"> <input type="radio"
									name="gender" checked value="0"> Nam
								</label> <label> <input type="radio" name="gender" value="1">
									Nữ
								</label>
							</div>
							<label>Tên đầy đủ</label>
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="Nhập tên đầy đủ của bạn" name="fullname"
									ng-model="dangky.fullname" ng-required="true"> <span
									id="helpBlock2" class="help-block"
									ng-show="frmDangKy.fullname.$error.required">Vui lòng
									nhập tên đầy đủ của bạn</span>

							</div>
							<label>Email</label>
							<div class="form-group">
								<input type="email" class="form-control"
									placeholder="Nhập email của bạn" name="email"
									ng-model="dangky.email" ng-required="true"> <span
									id="helpBlock2" class="help-block"
									ng-show="frmDangKy.email.$error.required">Vui lòng Email
									của bạn</span> <span id="helpBlock2" class="help-block"
									ng-show="frmDangKy.email.$error.email">Định dạng Email
									của bạn không đúng</span>
							</div>
							<label>Số điện thoại</label>
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="Nhập số điện thoại của bạn" name="phone"
									ng-model="dangky.phone" ng-required="true"> <span
									id="helpBlock2" class="help-block"
									ng-show="frmDangKy.phone.$error.required">Vui lòng nhập
									số điện thoại của bạn</span>
							</div>
							<br> <input type="checkbox" name="" value=""> Tôi
							đồng ý với <a href="#">Điều khoản</a>
							<button type="submit" class="btn btn-primary"
								ng-disabled="frmDangKy.$invalid" style="float: right">
								Đăng ký <i class="fa fa-unlock-alt"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="dist/js/angular.min.js"></script>
	<script src="dist/js/app/app.js"></script>
	<script>
      	function CheckPasswordMatch(){
      		var password = $("#password").val();
      		var confirmpassword = $("repassword").val();
      		if(password != confirmpassword)
      		{
      			$("#error").html("Các mật khẩu này không khớp");	
      		}
      	}
      	$(document).ready(function(){
      		$("#repassword").keyup(CheckPasswordMatch);
      	});
      </script>
</body>
</html>