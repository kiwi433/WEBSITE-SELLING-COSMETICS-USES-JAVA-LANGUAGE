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
		<form action="CreateAccount" method="post">
			<div class="card">
				<div class="card-body">
					<h2>Create Account</h2>
					<c:if test="${not empty mess}">
						<div class="alert alert-danger">${mess}</div>
					</c:if>
					<!-- <fieldset class="form-group">
						<b>ID account</b> <input type="text" class="form-control"
							name="id" required="required">
					</fieldset> -->
					<fieldset class="form-group">
						<b>Username</b> <input type="text" class="form-control"
							name="username" required="required">
					</fieldset>
					<fieldset class="form-group">
						<b>Password</b>
					 <input type="text" class="form-control"
							name="password" required="required">
					</fieldset>
					<fieldset class="form-group">
						<b>FullName</b> <input type="text" class="form-control"
							name="fullname" required="required">
					</fieldset>

					<fieldset class="form-group">
						<b>Phone</b> <input type="text" class="form-control"
							name="phone" required="required">
					</fieldset>
					<fieldset class="form-group">
						<b>Address</b> <input type="text" class="form-control"
							name="address" required="required">
					</fieldset>

					<fieldset class="form-group">
						<b>
							<label>Gender</label>

						</b>
						<div class="col-xs-4 male">
							<input type="radio" name="gender" value="1"  }>Nam
						</div>
						<div class="col-xs-4 female">
							<input type="radio" name="gender" value="0"}>Nữ
						
					</div>
</fieldset>


			<fieldset class="form-group">
						<b>
							<label>IsAdmin</label>

						</b>
						<div class="col-xs-4 male">
							<input type="radio" name="isadmin" value="1" 
							>Admin
						</div>
						<div class="col-xs-4 female">
							<input type="radio" name="isadmin" value="0" >Customer
						</div>
					</fieldset>
					<button type="submit" class="btn btn-success">Save</button>

				</div>
			</div>
		</form>
	</div>
</body>
</html>




