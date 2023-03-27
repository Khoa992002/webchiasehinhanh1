<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<link rel="icon" href="img/Logo.png" type="image/x-icon">
<title>PIXEL</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/album/">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/headers/">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/aboutme.css" rel="stylesheet">
<link rel="stylesheet" href="css/modal.css">

</head>
<body>
	<jsp:include page="headers.jsp"></jsp:include>
	
	<!-- Thông tin người dùng -->
	<section class="text-center container"
		style="padding: 30px 100px 5px 100px; z-index: 1">
		<div class="row">
			<div class="album bg-light"
				style="border-radius: 15px 15px 0 0; padding-bottom: 20px;">
				<div class="container">
					<div class="col-lg"
						style="display: flex; align-content: row; padding: 15px 0 30px 0">
						<img class="bd-placeholder-img rounded-circle"
							src="img/userimage/${AC.uImages}" width="160" height="160"
							role="img" aria-label="Placeholder: 140x140">
						<div
							style="display: flex; flex-direction: column; align-items: flex-start; margin-left: 20px; margin-top: 10px; line-height: 0.1;">
							<h1 class="text-nowrap">${AC.lastName} ${AC.firstName}</h1>

							<p class="bi bi-envelope-fill">
								<a
									style="text-decoration: none; font-weight: bold; font-size: 14px"
									href="#"> ${sessionScope.acc.gmail}</a>
							</p>
							<p class="bi bi-facebook">
								<a target="_blank"
									style="text-decoration: none; font-weight: bold; font-size: 14px"
									href="${sessionScope.acc.faceBook}">
									${sessionScope.acc.faceBook}</a>
							</p>
							<p class="bi bi-telephone-fill">
								<a
									style="text-decoration: none; font-weight: bold; font-size: 14px"
									href="#"> ${sessionScope.acc.soDienThoai}</a>
							</p>
						</div>
					</div>
					<div
						style="display: flex; justify-content: flex-end; position: relative; bottom: 20px;">
						<div style="margin-right: 27px">
							<a href="#editInf" type="button" class="btn btn-outline-primary">Chỉnh
								sửa thông tin cá nhân</a>
						</div>
						<div>
							<a href="#upload" type="button" class="btn btn-primary">Tải
								ảnh lên</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- gallery -->
	<section class="text-center container"
		style="padding: 0 100px 50px 100px; z-index: 1">
		<div class="row">
			<div class="album bg-light"
				style="border-radius: 0 0 15px 15px; padding-bottom: 20px;">
				<div class="container">
					<!-- /.col-lg-4 -->
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<c:forEach items="${listUID}" var="UID">
							<div style="columns: 3 250px; gap: 10px;">
								<c:if test="${UID.ready==0}">
									<div class="dropdown text-end"
										style="display: flex; justify-content: flex-end; position: relative; top: 44px; right: 10px; z-index: 2">
										<a
											style="align-items: center; background-color: #f8f9fac4; border-radius: 50%; font-size: 12px; justify-content: center; padding: 9px 12px; text-align: center;"
											class="d-block link-dark text-decoration-none bi bi-pencil-square "
											data-bs-toggle="dropdown" aria-expanded="false"> </a>
										<ul class="dropdown-menu text-small"
											style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate3d(112.4px, 38.4px, 0px);">
											<li><a class="dropdown-item " style=""
												href="DeleteControl?Iid=${UID.idImage}">Xoá</a></li>
											<li><a class="dropdown-item"
												href="AboutControl?Iid=${UID.idImage}#edit">Sửa</a></li>
										</ul>
									</div>
						
									<img
										style="border-radius: 5px; opacity: 0.5; position: relative; z-index: 1"
										class="bd-placeholder-img card-img-top" width="100%"
										height="225vh" src="img/dataImg/${UID.images}">
								</c:if>
								<c:if test="${UID.ready==1}">
									<div class="dropdown text-end"
										style="display: flex; justify-content: flex-end; position: relative; top: 44px; right: 10px;">
										<a
											style="align-items: center; background-color: #f8f9fac4; border-radius: 50%; font-size: 12px; justify-content: center; padding: 9px 12px; text-align: center;"
											class="d-block link-dark text-decoration-none bi bi-pencil-square "
											data-bs-toggle="dropdown" aria-expanded="false"> </a>
										<ul class="dropdown-menu text-small"
											style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate3d(112.4px, 38.4px, 0px);">
											<li><a class="dropdown-item " style=""
												href="DeleteControl?Iid=${UID.idImage}">Xoá</a></li>
											<li><a class="dropdown-item"
												href="AboutControl?Iid=${UID.idImage}#edit">Sửa</a></li>
										</ul>
									</div>
									<a
							href="ImageDetail?Iid=${UID.idImage}&Uid=${UID.userID}&Cid=${UID.idCategory}">
									<img style="border-radius: 5px;"
										class="bd-placeholder-img card-img-top" width="100%"
										height="225vh" src="img/dataImg/${UID.images}"></a>
								</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- UpLoad -->
	<div class="modal" id="upload">
		<div class="modal__overlay"></div>
		<div class="modal__body">
			<form action=UpLoadControl method="post"
				enctype="multipart/form-data" class=" row g-3
				m-auto"
				style="width: 40%; padding: 15px; z-index: 2; background-color: #f8f9fa; border-radius: 10px">
				<a style="display: flex; justify-content: flex-end; margin: 0"
					href="#"><i class="bi bi-x-lg"></i></a>
				<h1 class="h3 mb-3 fw-normal m-auto text-center">Upload Image</h1>
				<div class="col-12">
					<input name="imgUpload" type="file" class="form-control"
						placeholder="Link hình ảnh" >
				</div>

				<div class="col-12">
					<input name="tieucu" type="text" class="form-control"
						id="inputEmail4" placeholder="Tiêu cự(VD:50,70,24,....)">
				</div>

				<div class="col-12">
					<input name="khaudo" type="text" class="form-control"
						id="inputEmail4" placeholder="Khẩu độ(VD:f1.8, f/2.5,...)">
				</div>

				<div class="col-12">
					<input name="tocdomantrap" type="text" class="form-control"
						id="inputEmail4" placeholder="Tốc độ màn trập(VD:1/200s,...)">
				</div>

				<div class="col-12">
					<input name="iso" type="text" class="form-control" id="inputEmail4"
						placeholder="ISO(VD:1000)">
				</div>

				<div class="col-12">
					<input name="tenmayanh" type="text" class="form-control"
						id="inputEmail4" placeholder="Tên máy ảnh">
				</div>

				<div class="col-12">
					<select name="loaihinh" class="form-select"
						aria-label="Default select example">
						<option selected>Loại hình ảnh</option>
						<option value="PNG">PNG</option>
						<option value="JPG">JPG</option>
						<option value="GIF">GIF</option>
					</select>
				</div>
				<div class="col-12">
					<input name="tag" type="text" class="form-control" id="inputEmail4"
						placeholder="Tag(VD:Con người, Động vật, cây cối,...)">
				</div>
				<div class="col-12">
					<select name="cate_id" class="form-select"
						aria-label="Default select example">
						<option selected>Chọn danh mục</option>
						<c:forEach items="${listC}" var="C">
							<option value="${C.idCategory}">${C.cname}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-12"
					style="display: flex; justify-content: flex-end;">
					<button type="submit" value="Register" class="btn btn-primary">UPLOAD</button>
				</div>
			</form>
			<div class="moda__inner"></div>
		</div>
	</div>
	<!--end UpLoad -->


	<!--Edit img-->
	<div class="modal" id="edit">
		<div class="modal__overlay"></div>
		<div class="modal__body">
			<form action="EditImgControl" method="post" class="row g-3 m-auto"
				style="width: 40%; padding: 15px; z-index: 2; background-color: #f8f9fa; border-radius: 10px">
				<a style="display: flex; justify-content: flex-end; margin: 0"
					href="#"><i class="bi bi-x-lg"></i></a>
				<h1 class="h3 mb-3 fw-normal m-auto text-center">EDIT IMAGES</h1>
				<div
					style="padding-top: 20px; display: flex; justify-content: center;">
					<img src="img/dataImg/${detail.images}"
						style="max-width: 100%; height: 50vh;">
				</div>

				<div class="col-12">
					<input value="${detail.idImage}" name="idImage" readonly
						type="text" class="form-control" id="inputEmail4"
						placeholder="Tiêu cự(VD:50,70,24,....)">
				</div>

				<div class="col-12">
					<input value="${detail.tieuCu}" name="tieucu" type="text"
						class="form-control" id="inputEmail4"
						placeholder="Tiêu cự(VD:50,70,24,....)">
				</div>

				<div class="col-12">
					<input value="${detail.khauDo}" name="khaudo" type="text"
						class="form-control" id="inputEmail4"
						placeholder="Khẩu độ(VD:f1.8, f/2.5,...)">
				</div>

				<div class="col-12">
					<input value="${detail.tocDoManTrap}" name="tocdomantrap"
						type="text" class="form-control" id="inputEmail4"
						placeholder="Tốc độ màn trập(VD:1/200s,...)">
				</div>

				<div class="col-12">
					<input value="${detail.iSO}" name="iso" type="text"
						class="form-control" id="inputEmail4" placeholder="ISO(VD:1000)">
				</div>

				<div class="col-12">
					<input value="${detail.camera}" name="tenmayanh" type="text"
						class="form-control" id="inputEmail4" placeholder="Tên máy ảnh">
				</div>

				<div class="col-12">
					<select name="loaihinh" class="form-select"
						aria-label="Default select example">
						<option selected>Loại hình ảnh</option>
						<option value="PNG">PNG</option>
						<option value="JPG">JPG</option>
						<option value="GIF">GIF</option>
					</select>
				</div>
				<div class="col-12">
					<input value="${detail.tag}" name="tag" type="text"
						class="form-control" id="inputEmail4"
						placeholder="Tag(VD:Con người, Động vật, cây cối,...)">
				</div>
				<div class="col-12">
					<select name="cate_id" class="form-select"
						aria-label="Default select example">
						<option selected>Chọn danh mục</option>
						<c:forEach items="${listC}" var="C">
							<option value="${C.idCategory}">${C.cname}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-12"
					style="display: flex; justify-content: flex-end;">
					<button type="submit" class="btn btn-primary">UPLOAD</button>
				</div>
			</form>
			<div class="moda__inner"></div>
		</div>
	</div>
	<!-- Đổi inf -->
	<div class="modal" id="editInf">
		<div class="modal__overlay"></div>
		<div class="modal__body">
			<form action="EditInfUserControl" method="post"
				enctype="multipart/form-data" class="row g-3 m-auto"
				style="width: 50%; padding: 15px; z-index: 2; background-color: #f8f9fa; border-radius: 10px">
				<a style="display: flex; justify-content: flex-end; margin: 0"
					href="#"><i class="bi bi-x-lg"></i></a>
				<div style="display: flex;">
					<c:if test="${sessionScope.acc.uImages != null}">
						<img class="bd-placeholder-img rounded-circle"
							src="img/userimage/${AC.uImages}" width="140" height="140"
							role="img" aria-label="Placeholder: 140x140"
							style="margin: auto;">
					</c:if>
					<c:if test="${sessionScope.acc.uImages == null}">
						<img class="bd-placeholder-img rounded-circle"
							src="https://cdn-icons-png.flaticon.com/512/1946/1946429.png"
							width="140" height="140" role="img"
							aria-label="Placeholder: 140x140" style="margin: auto;">
					</c:if>

				</div>
				<div class="col-12">
					<input name="imgUserUpload" type="file" class="form-control">
					
				</div>

				<div class="col-12">
					
						<input value="${AC.gmail}" name="email" type="email" class="form-control" id="inputEmail4" placeholder="Email" required>
						
				</div>
				<div class="col-md-6">
					
						<input value="${AC.password}" name="pass" type="password" class="form-control" id="inputPassword4" placeholder="Mật khẩu" required>
				</div>
				<div class="col-md-6">
					<input value="${AC.password}" name="repeatpassword" type="password"
						class="form-control" id="inputPassword4" placeholder="Xác nhận" required>
				</div>
				<div class="col-12">
					<input value="${AC.firstName}" name="firstName" type="text"
						class="form-control" id="inputAddress" placeholder="firstName" required >
				</div>
				<div class="col-12">
					<input value="${AC.lastName}" name="lastName" type="text"
						class="form-control" id="inputAddress" placeholder="lastName" required >
				</div>
				<div class="col-12">
					<select name="gender" class="form-select"
						aria-label="Default select example">
						<option selected>Giới tính</option>
						<option value="Nam">Nam</option>
						<option value="Nữ">Nữ</option>
					</select>
				</div>
				<div class="col-12">
					<input value="${AC.faceBook}" name="faceBook" type="text"
						class="form-control" id="inputAddress" placeholder="Link FaceBook" required >
				</div>
				<div class="col-12">
					<input value="${AC.soDienThoai}" name="soDienThoai" type="text"
						class="form-control" id="inputAddress" placeholder="Số điện thoại" required >
				</div>
				<div class="col-12">
					<button class="w-100 btn btn-lg btn-primary" type="submit">Xong</button>
				</div>
			</form>
			<div class="moda__inner"></div>
		</div>
	</div>

	<!--xem hình-->

</body>
</html>