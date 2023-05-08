<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <!-- Nhúng thư viện SweetAlert CSS và JS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.2/dist/sweetalert2.min.css">
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.2/dist/sweetalert2.min.js"></script>
   <title>Thông báo xóa</title>
</head>
<body>
   <h1>Danh sách các mục cần xóa</h1>
   <table>
      <thead>
         <tr>
            <th>ID</th>
            <th>Tên mục</th>
            <th>Thao tác</th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td>1</td>
            <td>Mục A</td>
            <td>
               <button class="delete-btn">Xóa</button>
            </td>
         </tr>
         <tr>
            <td>2</td>
            <td>Mục B</td>
            <td>
               <button class="delete-btn">Xóa</button>
            </td>
         </tr>
         <!-- Danh sách các mục cần xóa tiếp theo... -->
      </tbody>
   </table>

   <!-- Thêm các thông báo vào trang -->
   <div id="success-message" class="hidden">Xóa thành công!</div>
   <div id="error-message" class="hidden">Xóa không thành công!</div>

   <!-- Nhúng đoạn mã JavaScript xử lý xóa và hiển thị thông báo -->
   <script>
      document.addEventListener("DOMContentLoaded", function() {
         const deleteBtns = document.querySelectorAll(".delete-btn");
         
         deleteBtns.forEach(btn => {
            btn.addEventListener("click", function() {
               // Thực hiện xóa và kiểm tra trạng thái xóa
               const isSuccess = true; // Giả sử xóa thành công

               // Hiển thị thông báo tương ứng
               if (isSuccess) {
                  const successMessage = document.getElementById("success-message");
                  successMessage.classList.remove("hidden");
                  setTimeout(() => successMessage.classList.add("hidden"), 3000);
               } else {
                  const errorMessage = document.getElementById("error-message");
                  errorMessage.classList.remove("hidden");
                  setTimeout(() => errorMessage.classList.add("hidden"), 3000);
               }
            });
         });
      });
   </script>
</body>
</html>
</body>
</html>