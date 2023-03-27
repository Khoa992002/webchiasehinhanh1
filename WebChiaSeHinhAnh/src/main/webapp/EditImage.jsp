<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/modal.css">
</head>
<body>
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
</body>
</html>