<%@page import="Model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
account auth = (account) request.getSession().getAttribute("username");

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<title>Insert title here</title>
<style>
/* Fonts Form Google Font ::- https://fonts.google.com/  -:: */
@import
	url('https://fonts.googleapis.com/css?family=Abel|Abril+Fatface|Alegreya|Arima+Madurai|Dancing+Script|Dosis|Merriweather|Oleo+Script|Overlock|PT+Serif|Pacifico|Playball|Playfair+Display|Share|Unica+One|Vibur')
	;
/* End Fonts */
/* Start Global rules */
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
/* End Global rules */

/* Start body rules */
body {
	background-image: radial-gradient(circle at 10% 20%, rgb(226, 240, 254)
		0%, rgb(255, 247, 228) 90%);
	background-image: radial-gradient(circle at 10% 20%, rgb(226, 240, 254)
		0%, rgb(255, 247, 228) 90%);
	background-attachment: fixed;
	background-repeat: no-repeat;
	font-family: 'Vibur', cursive;
	/*   the main font */
	font-family: 'Abel', sans-serif;
	opacity: .95;
	/* background-image: linear-gradient(to top, #d9afd9 0%, #97d9e1 100%); */
}

/* |||||||||||||||||||||||||||||||||||||||||||||*/
/* //////////////////////////////////////////// */

/* End body rules */

/* Start form  attributes */
form {
	width: 450px;
	min-height: 500px;
	height: auto;
	border-radius: 5px;
	margin: 2% auto;
	box-shadow: 0 9px 50px hsla(20, 67%, 75%, 0.31);
	padding: 2%;
	background-image: radial-gradient(circle at 10% 20%, rgb(226, 240, 254)
		0%, rgb(255, 247, 228) 90%);
}
/* form Container */
form .con {
	display: -webkit-flex;
	display: flex;
	-webkit-justify-content: space-around;
	justify-content: space-around;
	-webkit-flex-wrap: wrap;
	flex-wrap: wrap;
	margin: 0 auto;
}

/* the header form form */
header {
	margin: 2% auto 10% auto;
	text-align: center;
}
/* Login title form form */
header h2 {
	font-size: 250%;
	font-family: 'Playfair Display', serif;
	color: #3e403f;
}
/*  A welcome message or an explanation of the login form */
header p {
	letter-spacing: 0.05em;
}

/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
.input-item {
	background: #fff;
	color: #333;
	padding: 14.5px 0px 15px 9px;
	border-radius: 5px 0px 0px 5px;
}

/* Show/hide password Font Icon */
#eye {
	background: #fff;
	color: #333;
	margin: 5.9px 0 0 0;
	margin-left: -20px;
	padding: 15px 9px 19px 0px;
	border-radius: 0px 5px 5px 0px;
	float: right;
	position: relative;
	right: 1%;
	top: -.2%;
	z-index: 5;
	cursor: pointer;
}
/* inputs form  */
input[class="form-input"] {
	width: 240px;
	height: 50px;
	margin-top: 2%;
	padding: 15px;
	font-size: 16px;
	font-family: 'Abel', sans-serif;
	color: #5E6472;
	outline: none;
	border: none;
	border-radius: 0px 5px 5px 0px;
	transition: 0.2s linear;
}

input[id="txt-input"] {
	width: 250px;
}
/* focus  */
input:focus {
	transform: translateX(-2px);
	border-radius: 5px;
}

/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */

/* input[type="text"] {min-width: 250px;} */
/* buttons  */
button {
	display: inline-block;
	color: #252537;
	width: 280px;
	height: 50px;
	padding: 0 20px;
	background: #fff;
	border-radius: 5px;
	outline: none;
	border: none;
	cursor: pointer;
	text-align: center;
	transition: all 0.2s linear;
	margin: 7% auto;
	letter-spacing: 0.05em;
}

.log-in {
	background: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
}
/* Submits */
.submits {
	width: 48%;
	display: inline-block;
	float: left;
	margin-left: 2%;
}

/*       Forgot Password button FAF3DD  */

/*     Sign Up button  */
.frgt-pass {
	background: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
}

.frgt-pass input {
	background: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
	border: none;
	width: 95px;
	text-align: center;
	float: left;
}

.sign-up {
	background: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
}

.sign-up a {
	border: none;
	width: 95px;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 4px 2px;
	cursor: pointer;
	float: right;
}

/* buttons hover */
button:hover {
	transform: translatey(3px);
	box-shadow: none;
}

/* buttons hover Animation */
button:hover {
	animation: ani9 0.4s ease-in-out infinite alternate;
}

@
keyframes ani9 { 0% {
	transform: translateY(3px);
}

100
%
{
transform
:
translateY(
5px
);
}
}
a {
	color: #000;
	text-decoration: none;
}

a:hover {
	color: #f00;
}
</style>

</head>
</head>
<body>
	<div class="overlay">

		<form action="loginServlet" method="post">
			<div class="con">
				<header class="head-form">

					<h2>Log In</h2>
					<p>login here using your username and password</p>
					<br>
					<div class="group">
						<p style="color: red">${mss}</p>
				</header>
				<br>
				<div class="field-set">
					<!--   user name -->
					<span class="input-item"> <i class="fa fa-user-circle"></i>
					</span>
					<!--   user name Input-->
					<input class="form-input" id="txt-input" type="text"
						name="txtUsername" placeholder="UserName" required> <br>

					<!--   Password -->

					<span class="input-item"> <i class="fa fa-key"></i>
					</span>
					<!--   Password Input-->
					<input class="form-input" type="password" name="txtPassword"
						placeholder="Password" id="pwd" required>

					<!--      Show/hide password  -->
					<span> <i class="fa fa-eye" aria-hidden="true" type="button"
						id="eye"></i>
					</span> <br>
					<!--        buttons -->
					<!--      button LogIn -->
					<button class="log-in">Log In</button>
				</div>
				<div>
					<p style="color: black;">
						Bạn đã có tài khoản chưa?<a href="signupServlet"
							style="color: red;">Đăng ký</a>
					</p>
				</div>
				<!--   other buttons -->
			</div>



		</form>
		<!--   End Conrainer  -->
	</div>
	<!-- End Form -->


</body>
<script type="text/javascript">
	function show() {
		var p = document.getElementById('pwd');
		p.setAttribute('type', 'text');
	}

	function hide() {
		var p = document.getElementById('pwd');
		p.setAttribute('type', 'password');
	}

	var pwShown = 0;

	document.getElementById("eye").addEventListener("click", function() {
		if (pwShown == 0) {
			pwShown = 1;
			show();
		} else {
			pwShown = 0;
			hide();
		}
	}, false);
	
</script>
</html>