
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
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
<!-- bootstrap css -->
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

input[type=text] {
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

input[type=text]:focus {
	width: 100%;
}
</style>
</head>
<body>
	<!-- header section start -->
	<div class="header_section">
		<div class="container-fluid">
			<nav class="navbar navbar-light bg-light justify-content-between">
				<div id="mySidenav" class="sidenav">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<a href="HomePageServlet">Home</a> <a href="products.html">Products</a>
					<a href="about.html">About</a> <a href="contact.html">Contact</a>
				</div>
				<span class="toggle_icon" onclick="openNav()"><img
					src="images/toggle-icon.png"></span> <a class="logo"
					href="HomePageServlet"><img src=""></a>
				<div class="form-inline ">
					<div class="login_text">

						<ul>
							<li><div class="dropdown">
									<button class="dropbtn">
										<img src="images/user-icon.png"></a>
									</button>
									<div class="dropdown-content">

										<c:if test="${sessionScope.login == null }">
											<a href="loginServlet">Login</a>
										</c:if>
										<c:if test="${sessionScope.login != null }">
											<a href="logoutServlet">Logout(${sessionScope.login.username})</a>
										</c:if>

									</div>
								</div></li>

							<li><a href="#"><img src="images/bag-icon.png"></a></li>
							<li><form action="searchServlet" method="post">
						    
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
	<!-- banner section start -->
	<div class="banner_section layout_padding">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="container">
						<div class="row">
							<div class="col-sm-6">
								<h1 class="banner_taital">
									Beauty <br>
								</h1>
								<div class="read_bt">
									<a href="#">Buy Now</a>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="banner_img">
									<img src="images/3.jpg">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="container">
						<div class="row">
							<div class="col-sm-6">
								<h1 class="banner_taital">
									Beauty <br>
								</h1>
								<!--                            <p class="banner_text">Ncididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
 -->
								<div class="read_bt">
									<a href="#">Buy Now</a>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="banner_img">
									<img src="images/3.jpg">
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- banner section end -->
	<!-- product section start -->
	<div class="product_section layout_padding">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h1 class="product_taital">Our Products</h1>
					<!--                   <p class="product_text">incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
 -->
				</div>
			</div>
			<div class="product_section_2 layout_padding">
				<div class="row">
					<c:forEach items="${listP}" var="o">
						<div class="col-lg-3 col-sm-6">
							<div class="product_box">
								<h4 class="bursh_text">${o.name}</h4>
								<!--   <p class="lorem_text">incididunt ut labore et dolore magna aliqua. Ut enim </p> -->
								<img src="${o.image}" class="image_1">
								<div class="btn_main">
									<div class="buy_bt">
										<ul>
											<!-- <li class="active"><a href="#">Buy Now</a></li> -->
											<li><a href="detailProductServlet?id=${o.id}">Buy Now</a></li>
										</ul>
									</div>
									<h3 class="price_text">${o.price}</h3>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>


			</div>
			<!--                <div class="seemore_bt"><a href="#">See More</a></div>
 -->
		</div>
	</div>

	<!-- product section end -->
	<!-- about section start -->
	<div class="about_section layout_padding">
		<div class="container">
			<div class="about_section_main">
				<div class="row">
					<div class="col-md-6">
						<div class="about_taital_main">
							<h1 class="about_taital">About Our beauty sotore</h1>
							<p class="about_text">labore et dolore magna aliqua. Ut enim
								ad minim veniam, quis nostrud exercitation ullamco laboris nisi
								ut aliquip ex ea commodo consequatlabore et dolore magna aliqua.
								Ut enim ad minim veniam, quis nostrud exercitation ullamco
								laboris nisi ut aliquip ex ea commodo consequatlabore et dolore
								magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat</p>
							<div class="readmore_bt">
								<a href="#">Read More</a>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div>
							<img src="images/about-img.png" class="image_3">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- about section end -->


	<!-- footer section start -->
	<div class="footer_section layout_padding">
		<div class="container">
			<div class="footer_logo">
				<a href="index.html"><img src="images/footer-logo.png"></a>
			</div>
			<div class="contact_section_2">
				<div class="row">
					<div class="col-sm-4">
						<h3 class="address_text">Contact Us</h3>
						<div class="address_bt">
							<ul>
								<li><a href="#"> <i class="fa fa-map-marker"
										aria-hidden="true"></i><span class="padding_left10">Address
											: </span>
								</a></li>
								<li><a href="#"> <i class="fa fa-phone"
										aria-hidden="true"></i><span class="padding_left10">Call
											: </span>
								</a></li>
								<li><a href="#"> <i class="fa fa-envelope"
										aria-hidden="true"></i><span class="padding_left10">Email
											: </span>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="footer_logo_1">
							<a href="index.html"><img src=""></a>
						</div>
						<!--                      <p class="dummy_text">commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non</p>
 -->
					</div>
					<div class="col-sm-4">
						<div class="main">
							<h3 class="address_text">Best Products</h3>
							<!--                         <p class="ipsum_text">dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non</p>
 -->
						</div>
					</div>
				</div>
			</div>
			<div class="social_icon">
				<ul>
					<li><a href="#"><i class="fa fa-facebook"
							aria-hidden="true"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"
							aria-hidden="true"></i></a></li>
					<li><a href="#"><i class="fa fa-linkedin"
							aria-hidden="true"></i></a></li>
					<li><a href="#"><i class="fa fa-instagram"
							aria-hidden="true"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- footer section end -->

	<!-- Javascript files-->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/plugin.js"></script>
	<!-- sidebar -->
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/custom.js"></script>
	<!-- javascript -->
	<script src="js/owl.carousel.js"></script>
	<script
		src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
	<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
		type="text/javascript"></script>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "100%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
</body>
</html>