<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.example.travel_webservice_consumer.client.Place" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang Quản Lý Địa Điểm Du Lịch</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" crossorigin="anonymous" />
</head>
<body class="bg-gray-100 font-sans antialiased">
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<div class="min-h-screen">
    <header class="bg-white shadow-md sticky top-0 z-20">
        <div class="container mx-auto px-6 py-4 flex justify-between items-center">
            <div class="text-2xl font-bold text-indigo-600">
                <i class="fas fa-map-marked-alt mr-2"></i>TravelManager
            </div>
            <div class="flex items-center space-x-4">
                <p class="text-gray-700">Xin chào, <b class="text-indigo-600"><%= username %></b></p>
                <a href="logout" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600"><i class="fas fa-sign-out-alt mr-1"></i>Đăng xuất</a>
            </div>
        </div>
    </header>

    <main class="container mx-auto px-6 py-8">
        <div class="bg-white p-6 rounded-lg shadow-md">
            <div class="flex justify-between items-center mb-6">
                <div>
                    <h1 class="text-2xl font-bold text-gray-800">Danh sách Địa điểm</h1>
                    <p class="text-gray-500">Quản lý các địa điểm du lịch tại đây.</p>
                </div>
                <form action="places" method="post" class="flex gap-2">
                    <input type="text" name="name" placeholder="Tên" class="border px-3 py-2 rounded" required>
                    <input type="text" name="location" placeholder="Vị trí" class="border px-3 py-2 rounded" required>
                    <button type="submit" name="action" value="create" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700">
                        <i class="fas fa-plus mr-1"></i>Thêm địa điểm
                    </button>
                </form>
            </div>

            <div class="overflow-x-auto">
                <table class="min-w-full bg-white border border-gray-200">
                    <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-sm font-medium text-gray-500">ID</th>
                        <th class="px-6 py-3 text-left text-sm font-medium text-gray-500">Tên</th>
                        <th class="px-6 py-3 text-left text-sm font-medium text-gray-500">Vị trí</th>
                        <th class="px-6 py-3 text-center text-sm font-medium text-gray-500">Hành động</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                    <%
                        List<Place> places = (List<Place>) request.getAttribute("places");
                        if (places != null && !places.isEmpty()) {
                            for (Place p : places) {
                    %>
                    <tr>
                        <td class="px-6 py-4"><%= p.getId() %></td>
                        <td class="px-6 py-4"><%= p.getName() %></td>
                        <td class="px-6 py-4"><%= p.getLocation() %></td>
                        <td class="px-6 py-4 text-center">
                            <form action="places" method="post" class="flex justify-center gap-2">
                                <input type="hidden" name="id" value="<%= p.getId() %>">
                                <button type="submit" name="action" value="update" class="bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600">Sửa</button>
                                <button type="submit" name="action" value="delete" class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">Xoá</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr><td colspan="4" class="text-center text-gray-500 py-6">Không có địa điểm nào.</td></tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
</body>
</html>
