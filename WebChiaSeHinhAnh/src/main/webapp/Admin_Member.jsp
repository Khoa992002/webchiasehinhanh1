<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/Logo.png" type="image/x-icon">
<title>PIXEL</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<!-- Custom styles for this template -->
<link href="css/Admin_dashboard.css" rel="stylesheet">
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<jsp:include page="Admin_header.jsp"></jsp:include>
	<!-- sidebar -->
	<nav id="sidebarMenu"
		class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
		<div class="position-sticky pt-3 sidebar-sticky">
			<ul class="nav flex-column">
				<li class="nav-item"><a
					class="nav-link bi bi-people-fill " aria-current="page"
					href="Admin_infAuthor.jsp"> <span data-feather="home"
						class="align-text-bottom"></span> Danh sách người dùng
				</a></li>
				<li class="nav-item"><a class="nav-link bi bi-pencil-fill"
					href="Admin_duyet.jsp"> <span data-feather="file"
						class="align-text-bottom"></span> Duyệt hình ảnh
				</a></li>

				<c:if test="${sessionScope.acc.member != 1 }">
					<li class="nav-item"><a class="nav-link bi bi-people-fill active"
						href="Admin_Member.jsp"> <span data-feather="shopping-cart"
							class="align-text-bottom "></span> Quản trị viên
					</a></li>
					<li class="nav-item"><a class="nav-link bi bi-gear-fill"
						href="Admin_setting.jsp"> <span data-feather="shopping-cart"
							class="align-text-bottom"></span> Web
					</a></li>

				</c:if>
			</ul>
		</div>
	</nav>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="text-align: center;">
		<br>
		<h4 style="text-align: center;">DANH SÁCH QUẢN TRỊ VIÊN</h4>
		<div
			style="display: flex; justify-content: flex-end; margin-bottom: 10px">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#exampleModal">Thêm quản trị viên</button>
		</div>
		<table class="table table-striped table-group-divider">
			<thead>
				<tr>
					<th scope="col">STT</th>
					<th scope="col">Tên</th>
					<th scope="col">Tên đăng nhập</th>
					<th scope="col">Mật khẩu</th>
					<th scope="col"></th>
				</tr>
			</thead>

			<tbody class="table-group-divider">
				<c:forEach items="${listAdc}" var="Ac">
					<tr>
						<td scope="row">${Ac.adminId}</td>
						<td scope="row">${Ac.adName}</td>
						<td scope="row">${Ac.adUsername}</td>
						<td scope="row"><form
								action="adminEditPassMember?adminId=${Ac.adminId}" method="post">
								<input name="editPassword"
									style="border: none; background: none;"
									value="${Ac.adPassword}" name="password" type="text">
							</form></td>
						<td><a href="adminDeleteMember?idMember=${Ac.adminId}"
							class="bi bi-trash-fill" style="color: red"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		style="margin-top: 150px">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Thêm thành
						viên</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="adminMemberControl" method="post">
						<div class="mb-3 row">
							<div class="col-sm-">
								<input name="name" type="text" class="form-control"
									id="inputPassword" placeholder="Tên" required>
							</div>
						</div>
						<div class="mb-3 row">
							<div class="col-sm-">
								<input name="username" type="text" class="form-control"
									id="inputPassword" placeholder="Tên đăng nhập" required>
							</div>
						</div>
						<div class="mb-3 row">
							<div class="col-sm">
								<input name="password" type="password" class="form-control"
									id="inputPassword" placeholder="Mật khẩu" required>
							</div>
						</div>

						<div style="display: flex; justify-content: flex-end;">
							<button type="submit" class="btn btn-primary">Thêm</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
</body>
</html>