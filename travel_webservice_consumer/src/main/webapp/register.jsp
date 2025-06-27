<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Đăng ký tài khoản</title></head>
<body>
<h2>Đăng ký tài khoản</h2>

<% if (request.getAttribute("error") != null) { %>
<p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>

<form method="post" action="register">
  Tên đăng nhập: <input type="text" name="username" required><br>
  Mật khẩu: <input type="password" name="password" required><br>
  <button type="submit">Đăng ký</button>
</form>

<p>Đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
</body>
</html>
