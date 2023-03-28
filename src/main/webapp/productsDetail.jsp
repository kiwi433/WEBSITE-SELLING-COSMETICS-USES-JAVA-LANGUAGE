<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Products</title>
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
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<!--Important link from https://bootsnipp.com/snippets/XqvZr-->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<style type="text/css">
.pd-wrap {
	padding: 40px 0;
	font-family: 'Poppins', sans-serif;
}

.heading-section {
	text-align: center;
	margin-bottom: 20px;
}

.sub-heading {
	font-family: 'Poppins', sans-serif;
	font-size: 12px;
	display: block;
	font-weight: 600;
	color: #2e9ca1;
	text-transform: uppercase;
	letter-spacing: 2px;
}

.heading-section h2 {
	font-size: 32px;
	font-weight: 500;
	padding-top: 10px;
	padding-bottom: 15px;
	font-family: 'Poppins', sans-serif;
}

.user-img {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	position: relative;
	min-width: 80px;
	background-size: 100%;
}

.carousel-testimonial .item {
	padding: 30px 10px;
}

.quote {
	position: absolute;
	top: -23px;
	color: #2e9da1;
	font-size: 27px;
}

.name {
	margin-bottom: 0;
	line-height: 14px;
	font-size: 17px;
	font-weight: 500;
}

.position {
	color: #adadad;
	font-size: 14px;
}

.owl-nav button {
	position: absolute;
	top: 50%;
	transform: translate(0, -50%);
	outline: none;
	height: 25px;
}

.owl-nav button svg {
	width: 25px;
	height: 25px;
}

.owl-nav button.owl-prev {
	left: 25px;
}

.owl-nav button.owl-next {
	right: 25px;
}

.owl-nav button span {
	font-size: 45px;
}

.product-thumb .item img {
	height: 30px;
}

.product-name {
	font-size: 22px;
	font-weight: 500;
	line-height: 22px;
	margin-bottom: 4px;
	margin-top: 50px;
}

.product-price-discount {
	font-size: 22px;
	font-weight: 400;
	padding: 10px 0;
	clear: both;
}

.product-price-discount span.line-through {
	text-decoration: line-through;
	margin-left: 10px;
	font-size: 14px;
	vertical-align: middle;
	color: #a5a5a5;
}

.display-flex {
	display: flex;
}

.align-center {
	align-items: center;
}

.product-info {
	width: 100%;
}

.product-dtl p {
	font-size: 14px;
	line-height: 24px;
	color: #7a7a7a;
}

.product-dtl .form-control {
	font-size: 15px;
}

.product-dtl label {
	line-height: 16px;
	font-size: 15px;
}

.form-control:focus {
	outline: none;
	box-shadow: none;
}

.product-count {
	margin-top: 100px;
}

.product-count .qtyminus, .product-count .qtyplus {
	width: 34px;
	height: 34px;
	background: #212529;
	text-align: center;
	font-size: 19px;
	line-height: 36px;
	color: #fff;
	cursor: pointer;
}

.product-count .qtyminus {
	border-radius: 3px 0 0 3px;
}

.product-count .qtyplus {
	border-radius: 0 3px 3px 0;
}

.product-count .qty {
	width: 60px;
	text-align: center;
}

.round-black-btn {
	border-radius: 4px;
	background: #212529;
	color: #fff;
	padding: 7px 45px;
	display: inline-block;
	margin-top: 20px;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
}

.round-black-btn:hover, .round-black-btn:focus {
	background: transparent;
	color: #212529;
	text-decoration: none;
}

.product-info-tabs {
	margin-top: 25px;
}

.product-info-tabs .nav-tabs {
	border-bottom: 2px solid #d8d8d8;
}

.product-info-tabs .nav-tabs .nav-item {
	margin-bottom: 0;
}

.product-info-tabs .nav-tabs .nav-link {
	border: none;
	border-bottom: 2px solid transparent;
	color: #323232;
}

.product-info-tabs .nav-tabs .nav-item .nav-link:hover {
	border: none;
}

.product-info-tabs .nav-tabs .nav-item.show .nav-link,
	.product-info-tabs .nav-tabs .nav-link.active, .product-info-tabs .nav-tabs .nav-link.active:hover
	{
	border: none;
	border-bottom: 2px solid #d8d8d8;
	font-weight: bold;
}

.product-info-tabs .tab-content .tab-pane {
	padding: 30px 20px;
	font-size: 15px;
	line-height: 24px;
	color: #7a7a7a;
}

.review-form .form-group {
	clear: both;
}

.mb-20 {
	margin-bottom: 20px;
}

.review-form .rate {
	float: none;
	display: inline-block;
}

.review-heading {
	font-size: 24px;
	font-weight: 600;
	line-height: 24px;
	margin-bottom: 6px;
	text-transform: uppercase;
	color: #000;
}

.review-form .form-control {
	font-size: 14px;
}

.review-form input.form-control {
	height: 40px;
}

.review-form textarea.form-control {
	resize: none;
}

.review-form .round-black-btn {
	text-transform: uppercase;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="pd-wrap" id="product">
		<div class="container">

			<div class="row">
				<div class="col-md-6">
					<div style="">
						<div class="item">
							<img src="${detail.image}" />
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="product-dtl">
						<div class="product-info">
							<div class="product-name">${detail.name}</div>

							<div class="product-price-discount">
								<span>${detail.price}</span>
							</div>
						</div>


						<div class="product-count">
							<label for="size">Quantity</label>
							<form action="#" class="display-flex">
								<div class="qtyminus">-</div>
								<input type="text" name="quantity" value="1" class="qty">
								<div class="qtyplus">+</div>
							</form>
							<a href="#" class="round-black-btn">Add to Cart</a>
						</div>
					</div>
				</div>
			</div>
			<div class="product-info-tabs">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="description-tab" data-toggle="tab" href="#description"
						role="tab" aria-controls="description" aria-selected="true">Description</a>
					</li>

				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="description"
						role="tabpanel" aria-labelledby="description-tab">
						${detail.description}</div>

				</div>
			</div>

		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- copyright section start -->
	<div class="copyright_section">
		<div class="container">
			<p class="copyright_text">
				2020 All Rights Reserved. Design by <a href="https://html.design">Free
					html Templates</a>
			</p>
		</div>
	</div>
	<!-- copyright section end -->
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script>
         function openNav() {
           document.getElementById("mySidenav").style.width = "100%";
         }
         
         function closeNav() {
           document.getElementById("mySidenav").style.width = "0";
         }
		    function syncPosition(el) {
		        var count = el.item.count - 1;
		        var current = Math.round(el.item.index - (el.item.count / 2) - .5);
		        if (current < 0) {
		            current = count;
		        }
		        if (current > count) {
		            current = 0;
		        }
		        thumb
		            .find(".owl-item")
		            .removeClass("current")
		            .eq(current)
		            .addClass("current");
		        var onscreen = thumb.find('.owl-item.active').length - 1;
		        var start = thumb.find('.owl-item.active').first().index();
		        var end = thumb.find('.owl-item.active').last().index();
		        if (current > end) {
		            thumb.data('owl.carousel').to(current, 100, true);
		        }
		        if (current < start) {
		            thumb.data('owl.carousel').to(current - onscreen, 100, true);
		        }
		    }
		    function syncPosition2(el) {
		        if (syncedSecondary) {
		            var number = el.item.index;
		            slider.data('owl.carousel').to(number, 100, true);
		        }
		    }
		    thumb.on("click", ".owl-item", function(e) {
		        e.preventDefault();
		        var number = $(this).index();
		        slider.data('owl.carousel').to(number, 300, true);
		    });


            $(".qtyminus").on("click",function(){
                var now = $(".qty").val();
                if ($.isNumeric(now)){
                    if (parseInt(now) -1> 0)
                    { now--;}
                    $(".qty").val(now);
                }
            })            
            $(".qtyplus").on("click",function(){
                var now = $(".qty").val();
                if ($.isNumeric(now)){
                    $(".qty").val(parseInt(now)+1);
                }
            });
		});
      </script>
</body>
</html>
</html>