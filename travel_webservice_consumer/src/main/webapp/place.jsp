<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, org.example.travel_webservice_consumer.client.Place" %>
<html>
<head><title>Danh sách địa điểm</title></head>
<body>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, org.example.travel_webservice_consumer.client.Place" %>
<html>
<head><title>Danh sách địa điểm</title></head>
<body>

<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<p>Xin chào <b><%= username %></b> | <a href="logout">Đăng xuất</a></p>

<h2>Danh sách Place</h2>
<table border="1">
    <tr><th>ID</th><th>Tên</th><th>Vị trí</th><th>Hành động</th></tr>
    <%
        List<Place> places = (List<Place>) request.getAttribute("places");
        if (places != null && !places.isEmpty()) {
            for (Place p : places) {
    %>
    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getName() %></td>
        <td><%= p.getLocation() %></td>
        <td>
            <form action="places" method="post">
                <input type="hidden" name="id" value="<%= p.getId() %>">
                <input type="text" name="name" value="<%= p.getName() %>">
                <input type="text" name="location" value="<%= p.getLocation() %>">
                <button type="submit" name="action" value="update">Sửa</button>
                <button type="submit" name="action" value="delete">Xoá</button>
            </form>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr><td colspan="4">Không có địa điểm nào.</td></tr>
    <%
        }
    %>
</table>

<h3>Thêm địa điểm mới</h3>
<form action="places" method="post">
    Tên: <input type="text" name="name">
    Vị trí: <input type="text" name="location">
    <button type="submit" name="action" value="create">Thêm</button>
</form>
</body>
</html>
