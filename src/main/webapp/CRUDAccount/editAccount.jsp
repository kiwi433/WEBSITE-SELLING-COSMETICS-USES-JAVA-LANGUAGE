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
		<form action="UpdateAccount" method="post">
			<div class="card">
				<div class="card-body">
					<h2>Edit Product</h2>

					<c:if test="${not empty mess}">
						<div class="alert alert-danger">${mess}</div>
					</c:if>
					<fieldset class="form-group">
						<label>ID account</label> <input type="text" class="form-control"
							value="${sp1.id}" name="id" required="required">
					</fieldset>
					<fieldset class="form-group">
						<label>Username</label> <input type="text" class="form-control"
							name="username" required="required" value="${sp1.username}">
					</fieldset>
					<fieldset class="form-group">
						<label>Password</label> <input type="text" class="form-control"
							name="password" required="required" value="${sp1.password}">
					</fieldset>
					<fieldset class="form-group">
						<label>FullName</label> <input type="text" class="form-control"
							name="fullname" required="required" value="${sp1.fullname}">
					</fieldset>

					<fieldset class="form-group">
						<label>Phone</label> <input type="text" class="form-control"
							name="phone" required="required" value="${sp1.phonenumber}">
					</fieldset>
					<fieldset class="form-group">
						<label>Address</label> <input type="text" class="form-control"
							name="address" required="required" value="${sp1.address}">
					</fieldset>
					<div class="form-group">
						<p>
							<label>Gender</label>

						</p>
						<div class="col-xs-4 male">
							<input type="radio" name="gender" value="1" readonly="readonly"
								${sp1.gender == true?"checked":"" }>Nam
						</div>
						<div class="col-xs-4 female">
							<input type="radio" name="gender" value="0" readonly="readonly"
								${sp1.gender == false?"checked":"" }>Nữ
						</div>
					</div>

					<div class="form-group">
						<p>
							<label>IsAdmin</label>

						</p>
						<div class="col-xs-4 male">
							<input type="radio" name="isadmin" value="1" readonly="readonly"
								${sp1.isAdmin == true?"checked":"" }>Admin
						</div>
						<div class="col-xs-4 female">
							<input type="radio" name="isadmin" value="0" readonly="readonly"
								${sp1.isAdmin == false?"checked":"" }>Customer
						</div>
					</div>

					<button type="submit" class="btn btn-success">Save</button>

				</div>
			</div>
			isAdmin
		</form>
	</div>
</body>
</html>




