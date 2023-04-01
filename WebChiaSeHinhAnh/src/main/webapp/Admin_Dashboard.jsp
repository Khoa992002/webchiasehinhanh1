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

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/dashboard/">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>


<!-- Custom styles for this template -->
<link href="css/Admin_dashboard.css" rel="stylesheet">
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!-- header -->
			<jsp:include page="Admin_header.jsp"></jsp:include>
		<!-- sidebar -->
	<nav id="sidebarMenu"
		class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
		<div class="position-sticky pt-3 sidebar-sticky">
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link bi bi-people-fill active"
					aria-current="page" href="adminHomeControl"> <span
						data-feather="home" class="align-text-bottom"></span> Danh sách
						người dùng
				</a></li>
				<li class="nav-item"><a class="nav-link bi bi-pencil-fill"
					href="adminDuyetPageControl"> <span data-feather="file"
						class="align-text-bottom"></span> Duyệt hình ảnh
				</a></li>

				<c:if test="${sessionScope.acc.member != 1 }">
					<li class="nav-item"><a
						class="nav-link bi bi-people-fill "
						href="adminMemberControl"> <span data-feather="shopping-cart"
							class="align-text-bottom "></span> Quản trị viên
					</a></li>
					<li class="nav-item"><a class="nav-link bi bi-gear-fill"
						href="adminSettingControl"> <span data-feather="shopping-cart"
							class="align-text-bottom"></span> Web
					</a></li>

				</c:if>
			</ul>
		</div>
	</nav>
			<!-- main -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
				style="text-align: center;">
				<br>
				<h4 style="text-align: center;">NGƯỜI DÙNG</h4>
				<br>
				<div style="display: flex; justify-content: flex-end;">
					<form style="width: 20%; display: flex;" action="adminSearch"
						role="search" method="post">
						<input class="form-control  me-2" value="${txtSearch}"
							name="search" list="datalistOptions" id="exampleDataList"
							type="search" placeholder="Search by name">
						<datalist id="datalistOptions">
							<c:forEach items="${listAc}" var="LAC">
								<option value="${LAC.firstName}">
							</c:forEach>
						</datalist>
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				<br>
				<table class="table table-striped table-group-divider">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Họ</th>
							<th scope="col">Tên</th>
							<th scope="col">Gmail</th>
							<th scope="col">Facebook</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Giới tính</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach items="${listAc}" var="LAC">
							<tr>
								<th scope="row">${LAC.userID}</th>
								<td>${LAC.lastName}</td>
								<td>${LAC.firstName}</td>
								<td>${LAC.gmail}</td>
								<td><a href="${LAC.faceBook}" target="_blank">${LAC.faceBook}</a></td>
								<td>${LAC.soDienThoai}</td>
								<td>${LAC.gender}</td>
								<td><a class="bi bi-eye-fill" style="color: black"
									href="adminInfAuthorControl?userID=${LAC.userID}"></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="display: flex; justify-content: center;">
					<nav aria-label="..." class="text-center">
						<ul class="pagination pagination-sm text-center">
							<c:forEach begin="1" end="${endP}" var="i">
								<li aria-current="page"><a
									href="adminHomeControl?index=${i}" class="page-link">${i}</a></li>
							</c:forEach>
						</ul>
					</nav>
				</div>
			</main>
		</div>
	</div>
	<script src="assets/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
	<script src="dashboard.js"></script>
</body>
</html>