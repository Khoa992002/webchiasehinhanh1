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
<link href="css/modal.css" rel="stylesheet">
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
					<li class="nav-item"><a class="nav-link bi bi-people-fill "
						href="Admin_Member.jsp"> <span data-feather="shopping-cart"
							class="align-text-bottom "></span> Quản trị viên
					</a></li>
					<li class="nav-item"><a class="nav-link bi bi-gear-fill active"
						href="Admin_setting.jsp"> <span data-feather="shopping-cart"
							class="align-text-bottom"></span> Web
					</a></li>

				</c:if>
			</ul>
		</div>
	</nav>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<br>
		<h4 style="text-align: center;"></h4>
		<br>
		<div class="text-center"
			style="display: flex; align-items: center; justify-content: center; width: 100%; height: 500px; background-image: url(img/web/${web.banner}); background-size: 100%; background-repeat: no-repeat; background-color: rgba(0, 0, 0, 0.85); flex-direction: column; padding-bottom: 20px">
			<h2
				style="margin-bottom: 0; padding: 10px 10px 0 10px; color: #FFFFFF; font-weight: bold; position: relative; bottom: 20px">${web.title1}</h2>
			<p style="color: #FFFFFF;">${web.title2}</p>

			<form style="width: 50%;" action="SearchControl" method="post"
				class="col-12 col-lg-auto mb-3 mb-lg-0 " role="search">
				<div style="display: flex">
					<div
						style="width: 38px; height: 38px; background-color: #fff; border-radius: 20px 0 0 20px">
						<i style="position: relative; top: 7px; left: 2px"
							class="bi bi-search"></i>
					</div>
					<input style="border-radius: 0px 20px 20px 0; border: none"
						value="" name="search" type="search" class="form-control"
						placeholder="Search..." aria-label="Search" readonly>
				</div>
			</form>
		</div>
		<br> <br>
		<div class="row">
			<div class="col" style="margin-right: 10px">
				<form action="adminUploadControl" method="post"
					enctype="multipart/form-data">
					<h3>Web</h3>
					<span
						style="font-size: 20px; padding: 30px 0 5px 5px; font-weight: bold;">Banner</span>
					<input class="form-control" value="${web.banner}" type="file"
						placeholder="Chọn hình ảnh" name="banner"> <span
						style="font-size: 20px; padding: 30px 0 5px 5px; font-weight: bold;">Title
						1</span> <input class="form-control" value="${web.title1}" type="text"
						name="title1"> <span
						style="font-size: 20px; padding: 30px 0 5px 5px; font-weight: bold;">Title
						2</span> <input class="form-control" value="${web.title2}" type="text"
						name="title2"> <span
						style="font-size: 20px; padding: 30px 0 5px 5px; font-weight: bold;">Facebook</span>
					<input class="form-control" value="${web.facebook}" type="text"
						placeholder="link" name="facebook"> <span
						style="font-size: 20px; padding: 30px 0 5px 5px; font-weight: bold;">Instagram</span>
					<input class="form-control" value="${web.instagram}" type="text"
						placeholder="link" name="instagram"> <span
						style="font-size: 20px; padding: 30px 0 5px 5px; font-weight: bold;">Pinterest</span>
					<input class="form-control" value="${web.pinterest}" type="text"
						placeholder="link" name="pinterest"> <br>
					<div style="display: flex;">
						<button type="submit" class="btn btn-primary">Xong</button>
					</div>
					<br>
				</form>
			</div>
			<div class="col" style="margin-left: 10px"></div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</main>

	<script src="assets/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
</body>

</html>