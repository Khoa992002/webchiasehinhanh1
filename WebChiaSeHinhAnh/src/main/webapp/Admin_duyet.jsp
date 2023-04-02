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
				<li class="nav-item"><a class="nav-link bi bi-people-fill "
					aria-current="page" href="Admin_infAuthor.jsp"> <span
						data-feather="home" class="align-text-bottom"></span> Danh sách
						người dùng
				</a></li>
				<li class="nav-item"><a class="nav-link bi bi-pencil-fill active"
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
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="text-align: center;">
		<br>
		<h4 style="text-align: center;">XÉT DUYỆT</h4>
		<br>
		<table class="table table-striped">
			<thead>
				<tr style="text-align: center">
					<th scope="col">STT</th>
					<th scope="col">Hình ảnh</th>
					<th scope="col">Người tải lên</th>
					<th scope="col">Thông tin hình ảnh</th>
					<th scope="col">Tag</th>
					<th scope="col">Loại máy ảnh</th>
					<th scope="col">Loại hình ảnh</th>
					<th scope="col">Ngày tải lên</th>
					<th scope="col">Xét duyệt</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${listI}" var="I">
					<c:if test="${I.ready == 0}">
						<tr style="text-align: center; margin: auto;">
							<td scope="row"></td>
							<td style="display: flex;"><img
								style="max-width: 100px; margin: auto; border-radius: 10px;"
								src="img/dataImg/${I.images}" alt="image"></td>
							<td scope="row"><a
								href="adminInfAuthorControl?userID=${I.userID}">${I.lastName}
									${I.firstName}</a></td>
							<td scope="row">${I.tieuCu}mm·${I.khauDo}·${I.tocDoManTrap}·
								ISO ${I.iSO}</td>
							<td scope="row">${I.tag}</td>
							<td style="text-transform: uppercase;" scope="row">${I.camera}</td>
							<td scope="row">${I.loaiHinhAnh}</td>
							<td scope="row">${I.date}</td>
							<td scope="row"><a style="color: green; margin-right: 5px"
								class="bi bi-check-circle-fill"
								href="adminDuyetHinhControl?Iid=${I.idImage}"></a><a
								style="color: red; margin-left: 5px" class="bi bi-x-circle-fill"
								href="adminDeleteControl?Iid=${I.idImage}"></a></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</main>
	<script src="assets/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
</body>
</html>