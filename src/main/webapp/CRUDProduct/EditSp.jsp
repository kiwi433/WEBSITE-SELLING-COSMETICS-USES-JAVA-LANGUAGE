<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!Doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<div class="container col-md-5">
		<form action="updateServlet" method="post">
			<div class="card">
				<div class="card-body">
					<h2>Edit Product</h2>

					<fieldset class="form-group">
						<label>Mã sản phẩm</label> <input value="${sp.id}" type="text" class="form-control" name="id"
							required="required" readonly>
					</fieldset>
					<fieldset class="form-group">
						<label>Hình ảnh</label> <input value="${sp.image}"
							type="text" class="form-control" name="image"
							required="required">
					</fieldset>
					
					<fieldset class="form-group">
						<label>Name</label> <input value="${sp.name}"
							type="text" class="form-control" name="name"
							required="required">

					<fieldset class="form-group">
						<label>Price</label> <input value="${sp.price}"
							type="text" class="form-control" name="price"
							required="required">
					</fieldset>

					<fieldset class="form-group">
						<label>Category</label> <input value="${sp.category}" 
							type="text" class="form-control" name="category"
							required="required">
					</fieldset>

					<fieldset class="form-group">
						<label>Quatity</label> <input value="${sp.quantity}"
							type="text" class="form-control" name="quantity"
							required="required">
					</fieldset>
					<fieldset class="form-group">
						<label>Giới thiệu</label> <textarea style="height: 200px;"
							type="text" class="form-control" name="description"
							required="required">${sp.description}</textarea>
					</fieldset>
					
					<button type="submit" class="btn btn-success">Save</button>

				</div>
			</div>
		</form>
	</div>
</body>
</html>




