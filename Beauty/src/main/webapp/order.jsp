<%@page import="connection.DbCon"%>
<%@page import="Model.Order"%>
<%@page import="Dao.OrderDao"%>
<%@page import="Model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.account"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	account auth = (account) request.getSession().getAttribute("username");
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("order.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>Beauty</title>

<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
	integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
	crossorigin="anonymous"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- fonts -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Great+Vibes|Open+Sans:400,700&display=swap&subset=latin-ext"
	rel="stylesheet">
<!-- owl stylesheets -->
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
.dropbtn {
	border: none;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	font-size: 16px;
	display: none;
	position: absolute;
	min-width: 10px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	text-transform: capitalize;
}

.dropdown-content a {
	color: black;
	padding: 12px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #ddd;
}

.search input[type=text] {
	width: 1px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	background-color: white;
	background-image: url('images/search-icon.png');
	background-position: 5px 8px;
	background-repeat: no-repeat;
	padding: 6px 8px 1px 35px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
}

.search input[type=text]:focus {
	width: 100%;
}

<
b:tag name ='style '> /* <![CDATA[ */ .buttons_added {
	opacity: 1;
	display: inline-block;
	display: -ms-inline-flexbox;
	display: inline-flex;
	white-space: nowrap;
	vertical-align: top;
}

.is-form {
	overflow: hidden;
	position: relative;
	background-color: #f9f9f9;
	height: 2.2rem;
	width: 1.9rem;
	padding: 0;
	text-shadow: 1px 1px 1px #fff;
	border: 1px solid #ddd;
}

.is-form:focus, .input-text:focus {
	outline: none;
}

.is-form.minus {
	border-radius: 4px 0 0 4px;
}

.is-form.plus {
	border-radius: 0 4px 4px 0;
}

.input-qty {
	background-color: #fff;
	height: 2.2rem;
	text-align: center;
	font-size: 1rem;
	display: inline-block;
	vertical-align: top;
	margin: 0;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	border-left: 0;
	border-right: 0;
	padding: 0;
}

.input-qty::-webkit-outer-spin-button, .input-qty::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
/* ]]> */
</
b


:tag
>
</style>
</head>
<body>
	<!-- header section start -->
	<div class="header_section">
		<div class="container-fluid">
			<nav class="navbar navbar-light bg-light justify-content-between">
				<div id="mySidenav" class="sidenav">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<a href="HomePageServlet">Home</a> <a href="productServlet">Products</a>
					<a href="about.html">About</a> <a href="contact.html">Contact</a>
				</div>
				<span class="toggle_icon" onclick="openNav()"><img
					src="images/toggle-icon.png"></span> <a class="logo"
					href="HomePageServlet"><h1
						style="width: 80%; font-size: 60px; color: #000; line-height: 40px; padding-top: 10px; font-family: 'Great Vibes', cursive;">
						Beauty</h1></a>
				<div class="form-inline ">
					<div class="login_text">

						<ul>
							<li><div class="dropdown">
									<button class="dropbtn"style="background-color: #FEF4EC;">
										<i class="fa fa-user"style='font-size:24px'></i>
									</button>
									<div class="dropdown-content">

										<c:if test="${sessionScope.username == null }">
											<a href="loginServlet">Login</a>
										</c:if>
										<<c:if test="${sessionScope.username.isAdmin ==false }">
										
										<a href="ReadTKCN?idAccount=${sessionScope.username.id}">My Account</a>
											<a href="logoutServlet">Logout(${sessionScope.username.username})</a>
										</c:if>
									
										<c:if test="${sessionScope.username.isAdmin == true }">
										
										<a href="ReadTKCN?idAccount=${sessionScope.username.id}">My Account</a>
										<a href="HomeAdmin">Admin</a>
											<a href="logoutServlet">Logout(${sessionScope.username.username})</a>
										</c:if>

									</div>
								</div></li>

								<li ><div class="dropdown">
									<button class="dropbtn"style="background-color: #FEF4EC;">
									<i class="fa fa-shopping-cart"style='font-size:24px'><sub></sub></i>
									</button><div class="dropdown-content">

										
										<c:if test="${sessionScope.username != null }">
										<a href="Checkout">Order</a>
											<a href="cartServlet">Cart</a>
										</c:if>

									</div></div></li>
							<li><form action="searchServlet" method="post" class="search">
						    
								<input type="text" name="txtSearch" value="${param.txtSearch }"
									placeholder="What do you need?" />
							</form></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- header section end -->


	<section class="pt-5 pb-5">
		<div class="container">
			<div class="row w-100">
				<div class="col-lg-12 col-md-12 col-12">
					<h3 class="display-5 mb-2 text-center"
						style="padding-top: 60px; font-size: 40px">ORDER</h3>
					<p class="mb-5 text-center">
						<!-- <i class="text-info font-weight-bold">3</i> items in your cart -->
					</p>
					<table class="table table-condensed table-responsive">
						<thead>
							<tr>
								<th style="width: 55%">Product</th>
								<th style="width: 15%">Price</th>
								<th style="width: 15%">Quantity</th>
								<th style="width: 15%"></th>
							</tr>
						</thead>
						<tbody>
							<%
							if (orders != null) {
								for (Order c:orders) {
							%>
							<tr>
								<td data-th="Product">
									<div class="row">
										<div class="col-md-3 text-left">
											<img src="<%=c.getImage()%>" alt=""
												class="img-fluid d-none d-md-block rounded mb-2 shadow ">
										</div>
										<div class="col-md-9 text-left mt-sm-2">
											<h4><%=c.getName()%></h4>
											
										</div>
									</div>
								</td>
								<td data-th="Price"><%=dcf.format(c.getPrice())%></td>
								<td data-th="Price"><%=c.getQuanlity()%></td>
								<td class="actions" data-th="">
									<div class="text-right">
								 	<a href="CancelOrderServlet?id=<%=c.getOrder_id()%>">
										<button 
											class="btn btn-white border-secondary bg-white btn-md mb-2">
											<i class="fas fa-trash" style="color: red;">
											</i>
										</button></a> 
										
									</div>
								</td>
							</tr>
							<%
							}
							}
							%>
						</tbody>

					</table>
					
				</div>
			</div>
		<div class="row mt-4 d-flex align-items-center">
				<div class="col-sm-6 order-md-2 text-right">
					
				</div>
				<div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
					<a href="productServlet"> <i class="fas fa-arrow-left mr-2"></i>
						Continue Shopping
					</a>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>