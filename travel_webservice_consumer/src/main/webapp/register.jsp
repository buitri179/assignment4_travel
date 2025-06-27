<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng Ký Tài Khoản - TravelManager</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- TailwindCSS -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;700&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Be Vietnam Pro', sans-serif;
    }
    .password-toggle-icon {
      cursor: pointer;
      transition: color 0.2s ease-in-out;
    }
  </style>
</head>
<body class="bg-gray-100">

<div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-indigo-50 via-white to-cyan-50 p-4">

  <div class="w-full max-w-md">
    <!-- Logo and Header -->
    <div class="text-center mb-8">
      <a href="#" class="inline-block text-4xl font-bold text-indigo-600">
        <i class="fas fa-map-marked-alt"></i>
        TravelManager
      </a>
      <p class="text-gray-500 mt-2">Tạo tài khoản để bắt đầu hành trình của bạn.</p>
    </div>

    <!-- Registration Card -->
    <div class="bg-white rounded-2xl shadow-xl p-8 sm:p-10">

      <h2 class="text-center text-2xl font-bold text-gray-800 mb-2">Tạo tài khoản mới</h2>
      <p class="text-center text-sm text-gray-500 mb-8">Nhanh chóng và dễ dàng.</p>

      <!-- Server-side Error Message -->
      <% if (request.getAttribute("error") != null) { %>
      <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded-lg relative mb-6" role="alert">
        <strong class="font-bold">Lỗi!</strong>
        <span class="block sm:inline"><%= request.getAttribute("error") %></span>
      </div>
      <% } %>

      <!-- Registration Form -->
      <form method="post" action="register">
        <div class="space-y-6">

          <!-- Username Field -->
          <div>
            <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Tên đăng nhập</label>
            <div class="relative">
              <span class="absolute inset-y-0 left-0 flex items-center pl-4 text-gray-400">
                <i class="fas fa-user"></i>
              </span>
              <input type="text" name="username" id="username"
                     class="w-full pl-12 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition duration-200"
                     placeholder="Nhập tên đăng nhập" required>
            </div>
          </div>

          <!-- Password Field -->
          <div>
            <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Mật khẩu</label>
            <div class="relative">
              <span class="absolute inset-y-0 left-0 flex items-center pl-4 text-gray-400">
                <i class="fas fa-lock"></i>
              </span>
              <input type="password" name="password" id="password"
                     class="w-full pl-12 pr-12 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition duration-200"
                     placeholder="Tạo mật khẩu của bạn" required>
              <span class="absolute inset-y-0 right-0 flex items-center pr-4">
                <i id="toggle-password" class="fas fa-eye text-gray-400 password-toggle-icon hover:text-indigo-600"></i>
              </span>
            </div>
          </div>

        </div>

        <!-- Submit Button -->
        <div class="mt-8">
          <button type="submit"
                  class="w-full flex justify-center items-center px-4 py-3 bg-indigo-600 text-white font-bold rounded-lg hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-transform transform hover:scale-105 duration-300">
            <i class="fas fa-user-plus mr-2"></i>
            Đăng Ký
          </button>
        </div>
      </form>

      <!-- Login Link -->
      <div class="mt-8 text-center">
        <p class="text-sm text-gray-600">
          Đã có tài khoản?
          <a href="login.jsp" class="font-medium text-indigo-600 hover:text-indigo-500 hover:underline">
            Đăng nhập ngay
          </a>
        </p>
      </div>

    </div>
  </div>
</div>

<!-- Toggle Password Visibility -->
<script>
  document.addEventListener('DOMContentLoaded', () => {
    const passwordInput = document.getElementById('password');
    const toggleIcon = document.getElementById('toggle-password');

    toggleIcon.addEventListener('click', () => {
      const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
      passwordInput.setAttribute('type', type);
      toggleIcon.classList.toggle('fa-eye');
      toggleIcon.classList.toggle('fa-eye-slash');
    });
  });
</script>

</body>
</html>
