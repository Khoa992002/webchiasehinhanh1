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
					aria-current="page" href="Admin_infAuthor.jsp"> <span
						data-feather="home" class="align-text-bottom"></span> Danh sách
						người dùng
				</a></li>
				<li class="nav-item"><a class="nav-link bi bi-pencil-fill"
					href="Admin_duyet.jsp"> <span data-feather="file"
						class="align-text-bottom"></span> Duyệt hình ảnh
				</a></li>

				<c:if test="${sessionScope.acc.member != 1 }">
					<li class="nav-item"><a
						class="nav-link bi bi-people-fill "
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
			<!-- main -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
				style="text-align: center;">
				<br>
				<h4 style="text-align: center;">${ac.lastName}${ac.firstName}</h4>
				<br>
				<div style="display: flex; justify-content: flex-end;">
					<form style="width: 20%; display: flex;"
						action="adminSearchTag?userID=${ac.userID}" role="search"
						method="post">
						<input value="${txtSearch}" name="searchTag"
							class="form-control me-2" type="search"
							placeholder="Search by tag" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				<br>
				<table class="table table-striped table-group-divider">
					<thead>
						<tr style="text-align: center">
							<th scope="col">ID</th>
							<th scope="col">Hình ảnh</th>
							<th scope="col">Thông tin hình ảnh</th>
							<th scope="col">Tag</th>
							<th scope="col">Loại máy ảnh</th>
							<th scope="col">Loại hình ảnh</th>
							<th scope="col">Ngày tải lên</th>
							<th scope="col">Lượt xem</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach items="${listI}" var="I">
							<tr style="text-align: center; margin: auto;">
								<td scope="row">${I.idImage}</td>
								<td style="display: flex;"><img
									style="max-width: 100px; margin: auto; border-radius: 10px;"
									src="img/dataImg/${I.images}" alt="image"></td>
								<td scope="row">${I.tieuCu}mm·${I.khauDo}·
									${I.tocDoManTrap} · ISO ${I.iSO}</td>
								<td scope="row">${I.tag}</td>
								<td style="text-transform: uppercase;" scope="row">${I.camera}</td>
								<td scope="row">${I.loaiHinhAnh}</td>
								<td scope="row">${I.date}</td>
								<td scope="row">${I.view}</td>
								<td><a href="adminDeleteImage?idImage=${I.idImage}&userID=${I.userID}"
							class="bi bi-trash-fill" style="color: red"></a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				<div style="display: flex; justify-content: center;">
					<nav aria-label="...">
						<ul class="pagination pagination-sm">
							<c:forEach begin="1" end="${endPP}" var="i">
								<li aria-current="page"><a
									href="adminInfAuthorControl?authorPage=${i}&userID=${ac.userID}"
									class="page-link">${i}</a></li>
							</c:forEach>
						</ul>
					</nav>
				</div>
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
					crossorigin="anonymous"></script>
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