<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TKCN</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
	
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
      width: 262px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  font-style: italic;
font-family: Georgia
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 287px; /* Same as the width of the sidenav */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
  
}
.main h1 {
font-style: italic;
font-size: 60px;
font-family: Georgia;
}
.main table tr {
font-style: italic;

font-family: Georgia
}
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
#footer {
    width: 85%;
    background:rgb(0,0,0,0.79);
    height: 322px;
    margin-top:50px;
    margin-left: 236px;
    padding:0px 63px;
    padding-top:57px;
    display: flex;
    justify-content: space-around;
}

#footer .box {
    width: 250px;
    color:#fff;
}
#footer .box p{
margin-top: 30px;
font-size: 20px;
font-style: italic;
margin-right: -29px;
}

#footer .box .quick-menu {
    margin-top:40px;
   
}

#footer .box .quick-menu .item{
    margin-bottom:12px;
   

}
#footer .box h3{
font-size: 20px;
font-style: italic;
}
#footer .box .quick-menu ,.item a{
    color:#fff;
    text-decoration: none;
    font-size: 20px;
    font-style: italic;
}



#footer .box form input {
    width: 294px;
    height: 42px;
    background:transparent;
    padding-left:20px;
    color:#fff;
    margin-top:30px;
    font-size: 20px;
    font-style: italic;
    
}

#footer .box form button {
    background:#362f2f;
    box-shadow: 5px 5px 4px rgba(0,0,0.25);
    width: 163px;
    height: 38px;
    margin-top:29px;
    color:#fff;
    font-size: 20px;
    font-style: italic;
}
button {
    background-color:#E3BAA8;
    color:#FFFFFF;
    font-size: 20px;
    font-style: italic;
}
.form-group {
    color:#111;
    font-size: 20px;
    font-style: italic;
    
}
</style>
</head>
<body>

<div class="sidenav">
<a href="" class="logo">
                <img src="images/LOGOCSDL1.png" width="150" height="105" alt="">
            </a>
 <ul id="menu">
<li><a href="HomePageServlet"><i class="fas fa-home">Home</i></a></li>
<li><a href="logoutServlet"><i class="fas fa-sign-out-alt">Logout</i></a></li>
</ul>
</div>

<div class="main">
<h1>TÀI KHOẢN CÁ NHÂN</h1>

					<fieldset class="form-group">
						<label>Id Account</label> <input value="${tkcn.id_ac}" type="text"
							class="form-control" name="" readonly="readonly" >
					</fieldset>

					<fieldset class="form-group">
						<label>Fullname</label> <input value="${tkcn.fullname}" type="text"
							class="form-control" name="" required="required" >
					</fieldset>
					
					<fieldset class="form-group">
						<div class="form-group">
									<p >
										<span class="col-md-2 col-sm-3 col-xs-12 control-label">Giới tính*</span>
									</p>
									<div class="col-xs-4 male">
										<input type="radio" name="gioitinh" value="1"
											readonly="readonly" ${tkcn.gender == true?"checked":"" }>Nam
									</div>
									<div class="col-xs-4 female">
										<input type="radio" name="gioitinh" value="0"
											readonly="readonly" ${tkcn.gender == false?"checked":"" }>Nữ
									</div>
								</div>
					</fieldset>

					<fieldset class="form-group">
						<label>Phone Number</label> <input value="${tkcn.phonenumber}" type="text"
							class="form-control" name="" required="required">
					</fieldset>
					
					<fieldset class="form-group">
						<label>Address</label> <input value="${tkcn.address}" type="text"
							class="form-control" name="" required="required">
					</fieldset>
					
						
				
				
				<button>
				<td><a href="UpdateTKCN?idAccount=${tkcn.id_ac}">Update</a>
				</button>
				<button>
				<td><a href="ReadOrderKH?idUser=${username.id}">Lịch sử mua hàng</a></td>

				</button>
									
   </div>
 <div id="footer">
            <div class="box">
                <div class="logo">
                    <img src="images/LOGOCSDL1.png" width="250" height="80" alt="">
                </div>
                <p>Join us as the number one cosmetic brand. There are many reputable options for you. Thank you for visiting our store</p>
            </div>
            <div class="box">
                <h3>NỘI DUNG</h3>
                <ul class="quick-menu">
                    <div class="item">
                        <a href="">Trang chủ</a>
                    </div>
                    <div class="item">
                        <a href="">Sản phẩm</a>
                    </div>
                   
                    <div class="item">
                        <a href="">Liên hệ</a>
                    </div>
                </ul>
            </div>
            <div class="box">
                <h3>LIÊN HỆ</h3>
                <form action="">
                    <input type="text" placeholder="Địa chỉ email">
                    <button>Nhận tin</button>
                </form>
            </div>
        </div>
  <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</body>
</html> 
