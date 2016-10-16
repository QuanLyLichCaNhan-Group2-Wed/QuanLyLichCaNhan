<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Thanh sidebar -->
		<aside class="main-sidebar">
		   <!-- sidebar: style can be found in sidebar.less -->
		   <section class="sidebar">
		      <!-- Sidebar user panel -->
		      <div class="user-panel">
		         <div class="pull-left image">
		            <img src="dist/img/male-member.png" class="img-circle" alt="User Image">
		         </div>
		         <div class="pull-left info">
		            <p>Trần Quốc Thiện</p>
		            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
		         </div>
		      </div>
		      <!-- search form -->
		      <form action="#" method="get" class="sidebar-form">
		         <div class="input-group">
		            <input type="text" name="q" class="form-control" placeholder="Search...">
		            <span class="input-group-btn">
		            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
		            </button>
		            </span>
		         </div>
		      </form>
		      <!-- /.search form -->
		      <!-- sidebar menu: : style can be found in sidebar.less -->
		      <ul class="sidebar-menu">
		         <li class="header text-center">
		            <h4>MENU</h4>
		         </li>
		         <!-- Người dùng -->
		         <li class="treeview">
		            <a href="#">
		            <i class="fa fa-users"></i>
		            <span>Quản lý người dùng</span>
		            <span class="pull-right-container">
		            <i class="fa fa-angle-left pull-right"></i>
		            </span>
		            </a>
		            <ul class="treeview-menu">
		               <li><a href="admin-list.jsp"><i class="fa fa-list-alt"></i>Danh sách</a></li>
		               <li><a href="admin-add.jsp"><i class="fa fa-plus"></i>Thêm mới</a></li>
		            </ul>
		         </li>
		      </ul>
		   </section>
		   <!-- /.sidebar -->
		</aside>
</body>
</html>