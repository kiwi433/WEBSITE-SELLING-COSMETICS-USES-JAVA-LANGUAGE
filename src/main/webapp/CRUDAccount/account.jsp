<%@ page import="java.util.List"%>
<%@ page import="Dao.productDao"%>
<%@ page import="connection.DbCon"%>
<%@ page import="Model.product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="author" content="Bin-It">
<meta property="og:url" />
<meta property="og:type" content="truongbinit" />
<meta property="og:title" content="Website TruongBin" />
<meta property="og:description" content="Wellcome to my Website" />
<link rel="stylesheet" href="StyleADMIN.css">

<title>Thông tin tài khoản | Quản Lý Bán Hàng</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<!--===============================================================================================-->
<link rel="stylesheet" href="css/style.css">
<!-- Latest compiled and minified CSS -->
<!--===============================================================================================-->

<!--===============================================================================================-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<!--===============================================================================================-->
<!-- Latest compiled JavaScript -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
<!--===============================================================================================-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.js"></script>
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<script type="text/javascript">
        //Phân Trang Cho Table
        function Pager(tableName, itemsPerPage) {
            this.tableName = tableName;
            this.itemsPerPage = itemsPerPage;
            this.currentPage = 1;
            this.pages = 0;
            this.inited = false;

            this.showRecords = function (from, to) {
                var rows = document.getElementById(tableName).rows;
                for (var i = 1; i < rows.length; i++) {
                    if (i < from || i > to)
                        rows[i].style.display = 'none';
                    else
                        rows[i].style.display = '';
                }
            }

            this.showPage = function (pageNumber) {
                if (!this.inited) {
                    alert("not inited");
                    return;
                }
                var oldPageAnchor = document.getElementById('pg' + this.currentPage);
                oldPageAnchor.className = 'pg-normal';

                this.currentPage = pageNumber;
                var newPageAnchor = document.getElementById('pg' + this.currentPage);
                newPageAnchor.className = 'pg-selected';

                var from = (pageNumber - 1) * itemsPerPage + 1;
                var to = from + itemsPerPage - 1;
                this.showRecords(from, to);
            }

            this.prev = function () {
                if (this.currentPage > 1)
                    this.showPage(this.currentPage - 1);
            }

            this.next = function () {
                if (this.currentPage < this.pages) {
                    this.showPage(this.currentPage + 1);
                }
            }

            this.init = function () {
                var rows = document.getElementById(tableName).rows;
                var records = (rows.length - 1);
                this.pages = Math.ceil(records / itemsPerPage);
                this.inited = true;
            }
            this.showPageNav = function (pagerName, positionId) {
                if (!this.inited) {
                    alert("not inited");
                    return;
                }
                var element = document.getElementById(positionId);

                var pagerHtml = '<span onclick="' + pagerName +
                    '.prev();" class="pg-normal">&#171</span> | ';
                for (var page = 1; page <= this.pages; page++)
                    pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName +
                        '.showPage(' + page + ');">' + page + '</span> | ';
                pagerHtml += '<span onclick="' + pagerName + '.next();" class="pg-normal">&#187;</span>';

                element.innerHTML = pagerHtml;
            }
        }
    </script>
</head>

<body onload="time()">
	<nav class="navbar navbar-default navbar-fixed-top ">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<i class="fas fa-bars"></i>
				</button>
				<a class="navbar-brand" href="ReadTKCN?idAccount=${username.id}"><i
					class="fa fa-user-circle" aria-hidden="true"></i> ACCOUNT ADMIN</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">

					<li class="nav-item" onclick="setActive(this)"><a
						href="ReadAccount" data-toggle="tooltip" data-placement="bottom"
						title="KHÁCH HÀNG">ACCOUNT</a></li>
					<li class="nav-item" onclick="setActive(this)"><a
						href="ReadServlet" data-toggle="tooltip" data-placement="bottom"
						title="SẢN PHẨM">PRODUCT</a></li>

					<li class="nav-item" onclick="setActive(this)"><a
						href="ReadOder" data-toggle="tooltip" data-placement="bottom"
						title="danh sách đơn hàng">ORDER</a></li>



					<li class="nav-item" onclick="setActive(this)"><a href="#"
						data-toggle="tooltip" data-placement="bottom" title="TÀI KHOẢN">FEATURE<span
							class="caret"></span>
					</a>
						<ul class="dropdown">
							<li><a href="HomePageServlet" data-toggle="tooltip"
								data-placement="bottom" title="View Home"><b>View Home <i
										class="fas fa-sign-out-alt"></i></b></a></li>
							<li><a href="logoutServlet" data-toggle="tooltip"
								data-placement="bottom" title="ĐĂNG XUẤT"><b>Đăng xuất <i
										class="fas fa-sign-out-alt"></i></b></a></li>
						</ul></li>

				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid al">
		<div id="clock"></div>
		<p class="timkiemnhanvien">
			<b>TÌM KIẾM THÔNG TIN TÀI KHOẢN:</b>
		</p>

		<Br>
		<form action="SearchAccount" method="post">
			<input type="text" placeholder="Tìm kiếm thông tin tài khoản..."
				name="txtSearch" value=""> <br>
		</form>

		<Br> <b>CHỨC NĂNG CHÍNH:</b><Br> <a href="CreateAccount">
			<button class="nv btn add-new" type="button" data-toggle="tooltip"
				data-placement="top" title="Thêm thông tin tài khoản">
				<i class="fas fa-user-plus"></i>
			</button>
		</a>


		<div class="table-title">
			<div class="row"></div>

		</div>
		<table class="table table-bordered" id="myTable">
			<thead>
				<tr class="ex">
					<th>STT</th>
					<th>USERNAME</th>
					<th>PASSWORD</th>
					<th>ISADMIN</th>
					<th>FULLNAME</th>
					<th>PHONE</th>
					<th>ADDRESS</th>
					<th>GENDER</th>

					<th width="5px; !important">Tính Năng</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${listAC}" varStatus="counter">

					<tr>
						<td>${counter.count}</td>
						<td>${e.username}</td>
						<td>${e.password}</td>
						<td><c:if test="${e.isAdmin == true}">
								<i class="fa fa-check"></i>
							</c:if> <c:if test="${e.isAdmin == false}">
								<i class="fa fa-ban"></i>
							</c:if></td>
						<td>${e.fullname}</td>
						<td>${e.phonenumber}</td>
						<td>${e.address}</td>
						<td><c:if test="${e.gender== true}">
								<i class="fa fa-mars"></i>
							</c:if> <c:if test="${e.gender == false}">
								<i class="fa fa-venus"></i>
							</c:if></td>

						<td><a href="UpdateAccount?id=${e.id}" class="edit"
							title="Sửa" data-toggle="tooltip"> <i class="fa fa-pencil"
								aria-hidden="true"></i></a> <a href="deleteAccount?id_ac=${e.id}"
							class="delete" title="Xóa" data-toggle="tooltip"> <i
								class="fa fa-trash-o" aria-hidden="true"></i>
						</a></td>



					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div id="pageNavPosition" class="text-right"></div>
		<script type="text/javascript">
            var pager = new Pager('myTable', 5);
            pager.init();
            pager.showPageNav('pager', 'pageNavPosition');
            pager.showPage(1);
        </script>
	</div>
	<hr class="hr1">
	<div class="container-fluid end">
		<div class="row text-center">
			<div class="col-lg-12 link">
				<i class="fab fa-facebook-f"></i> <i class="fab fa-instagram"></i> <i
					class="fab fa-youtube"></i> <i class="fab fa-google"></i>
			</div>
		</div>
	</div>
	<script src="jquery.min.js"></script>
	<script type="text/javascript">
        //Tìm kiếm
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";  }}}}
        //Lọc bảng
     
        //Thời Gian
        function time() {
            var today = new Date();
            var weekday = new Array(7);
            weekday[0] = "Chủ Nhật";
            weekday[1] = "Thứ Hai";
            weekday[2] = "Thứ Ba";
            weekday[3] = "Thứ Tư";
            weekday[4] = "Thứ Năm";
            weekday[5] = "Thứ Sáu";
            weekday[6] = "Thứ Bảy";
            var day = weekday[today.getDay()];
            var dd = today.getDate();
            var mm = today.getMonth() + 1;
            var yyyy = today.getFullYear();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            m = checkTime(m);
            s = checkTime(s);
            nowTime = h + ":" + m + ":" + s;
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }
            today = day + ', ' + dd + '/' + mm + '/' + yyyy;
            tmp = '<i class="fa fa-clock-o" aria-hidden="true"></i> <span class="date">' + today + ' | ' + nowTime +
                '</span>';
            document.getElementById("clock").innerHTML = tmp;
            clocktime = setTimeout("time()", "1000", "Javascript");

            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i;
                }
                return i;
            }
        }

        //Thêm
        /* $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
            var actions = $("table td:last-child").html();
            $(".add-new").click(function () {
                $(this).attr("disabled", "disabled");
                var index = $("table tbody tr:last-child").index();
                var row = '<tr>' +
                    '<td><input type="text" class="form-control" name="name" id="name" placeholder="Nhập Tên"></td>' +
                    '<td><input type="text" class="form-control" name="gioitinh" id="gioitinh" placeholder="Nhập Giới Tính"></td>' +
                    '<td><input type="text" class="form-control" name="namsinh" id="namsinh" value="" placeholder="Nhập Ngày Sinh"></td>' +
                    '<td><input type="text" class="form-control" name="diachi" id="diachi" value="" placeholder="Nhập Địa Chỉ"></td>' +
                    '<td><input type="text" class="form-control" name="chucvu" id="chucvu" value="" placeholder="Nhập Chức Vụ"></td>' +
                    '<td>' + actions + '</td>' +
                    '</tr>';
                $("table").append(row);
                $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
                $('[data-toggle="tooltip"]').tooltip();
            }); */
            //Kiểm tra rỗng
            $(document).on("click", ".add", function () {
                var empty = false;
                var input = $(this).parents("tr").find('input[type="text"]');
                input.each(function () {
                    if (!$(this).val()) {
                        $(this).addClass("error");
                        swal("Thông Báo!", "Dữ Liệu Trống Vui Lòng Kiểm Tra", "error");
                        empty = true;
                    } else {
                        $(this).removeClass("error");
                        swal("Thông Báo!", "Bạn Chưa Nhập Dữ Liệu", "warning");
                    }
                });
                $(this).parents("tr").find(".error").first().focus();
                if (!empty) {
                    input.each(function () {
                        $(this).parent("td").html($(this).val());
                        swal("Thành Công", "Bạn Đã Cập Nhật Thành Công", "success");
                    });
                    $(this).parents("tr").find(".add, .edit").toggle();
                    $(".add-new").removeAttr("disabled");
                }
            });
            // Sửa
            $(document).on("click", ".edit", function () {
                $(this).parents("tr").find("td:not(:last-child)").each(function () {
                    $(this).html('<input type="text" class="form-control" value="' + $(this)
                        .text() + '">');
                });
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new").attr("disabled", "disabled");
            });
            jQuery(function () {
                jQuery(".add").click(function () {
                    swal("Thành Công!", "Bạn Đã Sửa Thành Công", "success");
                });
            });
            // Xóa
            $(document).on("click", ".delete", function () {
            	 let isSuccess = false; 
            	 
                $(this).parents("tr").remove();
                if (isSuccess) {
                swal("Thành Công!", "Bạn Đã Xóa Thành Công", "success");
                $(".add-new").removeAttr("disabled");
                } else {
                    swal("Thất Bại", "Xóa không thành công,sản phẩm này hiện tại đang có trong đơn đặt hàng", "error");
                }
            });
        });
        
        //Not use
        jQuery(function () {
            jQuery(".cog").click(function () {
                swal("Sorry!", "Tính Năng Này Chưa Có", "error");
            });
        });
        //Tool tip
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
        function setActive(elem) {
            // Loại bỏ lớp active trên tất cả phần tử
            var items = document.getElementsByClassName("nav-item");
            for (var i = 0; i < items.length; i++) {
              items[i].classList.remove("active");
            }
            // Thêm lớp active cho phần tử được chọn
            elem.classList.add("active");
          }
        $('.delete').on('click', function(e) {
        	  e.preventDefault();
        	  var id = $(this).data('id');
        	  swal({
        	    title: "Bạn chắc chắn muốn xóa?",
        	    text: "Nếu bạn xóa sản phẩm này thì không thể khôi phục lại được.",
        	    type: 'warning',
        	    showCancelButton: true,
        	    confirmButtonColor: '#3085d6',
        	    cancelButtonColor: '#d33',
        	    confirmButtonText: 'Xóa',
        	    cancelButtonText: 'Hủy bỏ',
        	    confirmButtonClass: 'btn btn-success',
        	    cancelButtonClass: 'btn btn-danger',
        	    buttonsStyling: false
        	  }).then(function() {
        	    window.location.href = 'deleteServlet?id=' + id;
        	    swal({
        	      title: 'Đã xóa',
        	      text: 'Sản phẩm đã được xóa khỏi danh sách.',
        	      type: 'success',
        	      confirmButtonClass: 'btn btn-success',
        	      buttonsStyling: false
        	    })
        	  });
        	});
        $('.add').on('click', function(e) {
        	  e.preventDefault();
        	  var formData = $('form').serialize();
        	  $.ajax({
        	    type: 'POST',
        	    url: 'addServlet',
        	    data: formData,
        	    success: function(response) {
        	    	
        	      swal({
        	        title: 'Thêm vào thành công',
        	        text: 'Sản phẩm đã được thêm vào danh sách.',
        	        type: 'success',
        	        confirmButtonClass: 'btn btn-success',
        	        buttonsStyling: false
        	      });
        	      $('form')[0].reset();
        	    },
        	    error: function(jqXHR, textStatus, errorThrown) {
        	      swal({
        	        title: 'Lỗi',
        	        text: 'Không thể thêm sản phẩm vào danh sách.',
        	        type: 'error',
        	        confirmButtonClass: 'btn btn-danger',
        	        buttonsStyling: false
        	      });
        	    }
        	  });
        	});
    </script>

</body>

</html>