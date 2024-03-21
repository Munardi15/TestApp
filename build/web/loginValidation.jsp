<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login Validation</title>
        <script>
            // JavaScript function untuk menampilkan pesan pop-up
            function showError() {
                alert("Username or password is incorrect. Please try again.");
            }
        </script>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Lakukan validasi login di sini, misalnya:
            if ("admin".equals(username) && "password".equals(password)) {
                // Jika login berhasil, arahkan ke halaman dashboard dengan nama pengguna yang disertakan
                response.sendRedirect("dashboard.jsp?username=" + username);
            } else {
                // Jika login gagal, tampilkan pesan pop-up
        %>
        <script>
            showError();
            // Setelah menampilkan pesan pop-up, arahkan kembali ke halaman login
            window.location.href = "index.jsp?error=invalid";
        </script>
        <%
            }
        %>
    </body>
</html>
