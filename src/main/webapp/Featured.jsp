<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>SHOP SOUVEMIR</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

</head>
<body>
	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Featured Product</h2>
					</div>

					<div class="featured__controls">
						<ul> <c:forEach items="${listdmhot}" var="o">
                                <li class="${tag== o.madanhmuc?"active":""}">
                                <a href="dmhotcontrol?DMhot=${o.madanhmuc}">${o.ten}</a>
                                </li>
                                </c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
				<c:forEach items="${listhot }" var="o">
                                
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${o.anh }">

							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="DetailControl?pid=${o.id}"><i
										class="fa fa-retweet"></i></a></li>
								<li><a href=""><i
										class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="">${o.tensanpham}</a>
							</h6>
							<h5>${dcf.format(o.gia)}VNĐ
							</h5>
						</div>
					</div>
				</div>
			 </c:forEach>
				
				
			</div>
	<div class="row featured__filter">
	<c:forEach items="${listDMh }" var="o">
                                
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${o.anh }">

							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="DetailControl?pid=${o.id}"><i
										class="fa fa-retweet"></i></a></li>
								<li><a href=""><i
										class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="">${o.tensanpham}</a>
							</h6>
							<h5>${dcf.format(o.gia)}VNĐ
							</h5>
						</div>
					</div>
				</div>
			 </c:forEach></div>
		</div>
	</section>
	<!-- Featured Section End -->
	<!-- Js Plugins -->

</body>
</html>