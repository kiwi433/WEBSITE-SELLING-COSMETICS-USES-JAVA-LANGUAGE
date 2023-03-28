<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
	<jsp:include page="header.jsp"></jsp:include> 
	<!-- product section start -->
	<div class="product_section layout_padding">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h1 class="product_taital">Our Products</h1>
			  <p class="product_text">Outstanding skin care products are trusted by many users of our store</p>				</div>
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
	
	<jsp:include page="footer.jsp"></jsp:include> 

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