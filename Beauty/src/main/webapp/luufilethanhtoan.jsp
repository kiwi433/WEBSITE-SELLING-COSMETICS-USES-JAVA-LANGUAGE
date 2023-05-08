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
DecimalFormat dcf = new DecimalFormat();
request.setAttribute("dcf", dcf);
account auth = (account) request.getSession().getAttribute("username");
if (auth != null) {
	request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	OrderDao pDao = new OrderDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<style type="text/css">
@media ( min-width : 1025px) {
	.h-custom {
		height: 100vh !important;
	}
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
	width: 2.0rem;
	padding: 0;
	margin-bottom: -6px;
	text-shadow: 1px 1px 1px #fff;
	border: 1px solid #ddd;
	text-shadow: 1px 1px 1px #fff;
}

.is-form:focus, .input-text:focus {
	outline: none;
}

.is-form.minus {
	border-radius: 4px 4px 0 0px;
}

.is-form.plus {
	border-radius: 0 0px 4px 4px;
}

.input-qty {
	background-color: #fff;
	width: 2.0rem;
	text-align: center;
	font-size: 1rem;
	display: inline-block;
	vertical-align: top;
	margin: 0;
	border-top: 0;
	border-bottom: 0;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
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
	<section class="h-100 h-custom" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col">
					<div class="card">
						<div class="card-body p-4">

							<div class="row">

								<div class="col-lg-8">
									<h5 class="mb-3">
										<a href="productServlet" class="text-body"><i
											class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a>
									</h5>
									<hr>

									<div
										class="d-flex justify-content-between align-items-center mb-4">
										<div>
											<p class="mb-1">Shopping cart</p>

										</div>

									</div>
									<%
									if (cart_list != null) {
										for (Cart c : cartProduct) {
									%>
									<div class="card mb-3">
										<div class="card-body">
											<div class="d-flex justify-content-between">
												<div class="d-flex flex-row align-items-center">
													<div>
														<img src="<%=c.getImage()%>" class="img-fluid rounded-3"
															alt="Shopping item" style="width: 100px;">
													</div>

													<div class="ms-3">
														<h5 style="font-size: 16px"><%=c.getName()%></h5>

													</div>
												</div>
												<div class="d-flex flex-row align-items-center">
													<div style="width: 60px;">
														<div class="buttons_added">
															<a class="minus is-form" type="button"
																href="QuanlityIncDec?action=inc&id=<%=c.getId()%>&id_ac=<%=c.getId_ac()%>"
																style="text-align: center;">+</a> <input
																aria-label="quantity" class="input-qty"
																value="<%=c.getQuantity()%>" autocomplete="off" size="2"
																type="text"><a type="button"
																class="plus is-form" style="text-align: center;"
																href="QuanlityIncDec?action=dec&id=<%=c.getId()%>&id_ac=<%=c.getId_ac()%>">-</a>
														</div>
													</div>
													<div style="width: 80px;">
														<h5 class="mb-0" style="font-size: 16px"><%=dcf.format(c.getPrice())%>Đ
														</h5>
													</div>
													<a href="Removefromcart?id=<%=c.getId()%>"
														style="color: #cecece;"><i class="fas fa-trash"
														style="color: red;"></i></a>
												</div>
											</div>
										</div>
									</div>
									<%
									}
									}
									%>
								</div>
								<div class="col-lg-4">

									<div class="card text-black rounded-3"
										style="background-color: #FEF4EC">
										<div class="card-body">
											<div
												class="d-flex justify-content-between align-items-center mb-4">
												<h5 class="mb-0">Thanh toán</h5>

											</div>

											<c:set var="y" value="${requestScope.us }" />
											<!-- <form class="mt-4"> -->
											<div class="form-outline form-white mb-2">
												<label class="form-label" for="typeName">Mã tài
													khoản</label> <input value="${sessionScope.username.id}"
													name="id_ac" class="form-control form-control-lg"
													readonly="readonly" />

											</div>
											<div class="form-outline form-white mb-2">
												<label class="form-label" for="typeName">Full name</label> <input
													value="${user_info.fullname }" name="txtFullname"
													class="form-control form-control-lg" />

											</div>

											<div class="form-outline form-white mb-4">
												<label class="form-label" for="typeText">Phone</label> <input
													type="text" id="typeText" value="${user_info.phonenumber}"
													name="txtPhone" class="form-control form-control-lg" />

											</div>



											<div class="form-outline form-white mb-4">
												<label class="form-label" for="typeExp">Address</label> <input
													type="text" id="typeExp" value="${user_info.address }"
													class="form-control form-control-lg" />


											</div>

										</div>
										<a href="UpdateOrderdetail?id_ac=${username.id}">
											<button class="btn btn-info btn-block btn-lg">
												Update</button>
										</a>

										<!-- </form> -->


										<hr class="my-4">
										<a class="btn btn-info btn-block btn-lg" href="Checkout">

											<div class="d-flex justify-content-between">
												<span>${(total>0)?dcf.format(total):0}Đ</span> <span>Checkout
													<i class="fas fa-long-arrow-alt-right ms-2"></i>
												</span>
											</div>
										</a>

									</div>
								</div>

							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>