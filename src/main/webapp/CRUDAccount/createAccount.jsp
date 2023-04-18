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
					<h2>Edit Account</h2>
					<c:if test="${not empty mess}">
						<div class="alert alert-danger">${mess}</div>
					</c:if>
					<fieldset class="form-group">
						<label>ID account</label> <input type="text" class="form-control"
							name="id" required="required">
					</fieldset>
					<fieldset class="form-group">
						<label>Username</label> <input type="text" class="form-control"
							name="username" required="required">
					</fieldset>
					<fieldset class="form-group">
						<label>Password</label>
					 <input type="text" class="form-control"
							name="password" required="required">
					</fieldset>
					<fieldset class="form-group">
						<label>FullName</label> <input type="text" class="form-control"
							name="fullname" required="required">
					</fieldset>

					<fieldset class="form-group">
						<label>Phone</label> <input type="text" class="form-control"
							name="phone" required="required">
					</fieldset>
					<fieldset class="form-group">
						<label>Address</label> <input type="text" class="form-control"
							name="address" required="required">
					</fieldset>

					<fieldset class="form-group">
						<label>Gender</label> <input type="text" class="form-control"
							name="gender" required="required">
					</fieldset>


					<fieldset class="form-group">
						<label>IsAdmin</label>
						<textarea style="height: 200px;" type="text" class="form-control"
							name="isadmin" required="required"></textarea>
					</fieldset>
					<button type="submit" class="btn btn-success">Save</button>

				</div>
			</div>
		</form>
	</div>
</body>
</html>




