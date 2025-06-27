<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Đăng nhập</title></head>
<body>
<h2>Đăng nhập hệ thống</h2>

<%-- Nếu có lỗi thì in ra --%>
<% if (request.getAttribute("error") != null) { %>
<p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>

<form action="login" method="post">
    Tên đăng nhập: <input type="text" name="username"><br>
    Mật khẩu: <input type="password" name="password"><br>
    <button type="submit">Đăng nhập</button>
</form>

<p>Chưa có tài khoản? <a href="register.jsp">Đăng ký</a></p>
</body>
</html>
