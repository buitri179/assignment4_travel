<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập - TravelManager</title>

    <!-- TailwindCSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">

    <style>
        html { font-family: 'Inter', sans-serif; scroll-behavior: smooth; }

        .wavy-bg {
            background-color: #f0f4f8;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1440 320'%3e%3cpath fill='%23e0e7ff' fill-opacity='1' d='M0,160L48,176C96,192,192,224,288,213.3C384,203,480,149,576,138.7C672,128,768,160,864,186.7C960,213,1056,235,1152,218.7C1248,203,1344,149,1392,122.7L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z'%3e%3c/path%3e%3c/svg%3e");
            background-position: bottom;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .error-shake {
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            10%, 90% { transform: translateX(-1px); }
            20%, 80% { transform: translateX(2px); }
            30%, 50%, 70% { transform: translateX(-4px); }
            40%, 60% { transform: translateX(4px); }
        }

        .custom-focus:focus {
            outline: none;
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.3);
        }
    </style>
</head>
<body class="wavy-bg">

<div class="min-h-screen flex items-center justify-center p-4">
    <div class="w-full max-w-4xl bg-white rounded-3xl shadow-2xl overflow-hidden grid grid-cols-1 md:grid-cols-2">

        <!-- Left: Illustration -->
        <div class="hidden md:flex flex-col items-center justify-center p-12 bg-indigo-50">
            <div class="max-w-xs">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="w-full h-auto">
                    <path fill="#a5b4fc" d="M256 0C161.6 0 84.8 43.2 32 99.2V480c52.8-56 129.6-99.2 224-99.2s171.2 43.2 224 99.2V99.2C427.2 43.2 350.4 0 256 0z"/>
                    <path fill="#c7d2fe" d="M256 512c94.4 0 171.2-43.2 224-99.2V99.2C427.2 43.2 350.4 0 256 0S84.8 43.2 32 99.2v24.8c52.8-44.8 129.6-76.8 224-76.8s171.2 32 224 76.8V346c-52.8 44.8-129.6 76.8-224 76.8s-171.2-32-224-76.8v67.2c52.8 44.8 129.6 76.8 224 76.8z"/>
                    <path fill="#4f46e5" d="M32 124v192c52.8-44.8 129.6-76.8 224-76.8s171.2 32 224 76.8V124c-52.8 44.8-129.6 76.8-224 76.8S84.8 168.8 32 124z"/>
                </svg>
            </div>
            <h2 class="mt-8 text-2xl font-bold text-gray-800 text-center">Khám Phá Thế Giới Cùng TravelManager</h2>
            <p class="mt-2 text-gray-600 text-center text-sm">Nền tảng quản lý du lịch thông minh, đưa bạn đến mọi nẻo đường.</p>
        </div>

        <!-- Right: Form -->
        <div class="p-8 sm:p-12 flex flex-col justify-center">
            <div>
                <h1 class="text-3xl font-bold text-gray-900 mb-2">Chào mừng trở lại!</h1>
                <p class="text-gray-500 mb-6">Đăng nhập để tiếp tục quản lý hành trình của bạn.</p>

                <!-- Error Message (if exists) -->
                <%
                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                %>
                <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-4 rounded-lg error-shake">
                    <p><%= error %></p>
                </div>
                <% } %>

                <!-- Login Form -->
                <form action="login" method="post" class="space-y-6">
                    <!-- Username -->
                    <div>
                        <label for="username" class="block text-sm font-medium text-gray-700">Tên đăng nhập</label>
                        <div class="mt-1 relative">
                            <i class="fas fa-user absolute left-4 top-1/2 -translate-y-1/2 text-gray-400"></i>
                            <input type="text" id="username" name="username" required
                                   class="custom-focus w-full pl-12 pr-4 py-3 rounded-xl border border-gray-300 transition duration-200"
                                   placeholder="your.username">
                        </div>
                    </div>

                    <!-- Password -->
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700">Mật khẩu</label>
                        <div class="mt-1 relative">
                            <i class="fas fa-lock absolute left-4 top-1/2 -translate-y-1/2 text-gray-400"></i>
                            <input type="password" id="password" name="password" required
                                   class="custom-focus w-full pl-12 pr-12 py-3 rounded-xl border border-gray-300 transition duration-200"
                                   placeholder="••••••••">
                            <button type="button" id="togglePassword" class="absolute right-4 top-1/2 -translate-y-1/2 text-gray-500 hover:text-indigo-600">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Remember me + Forgot -->
                    <div class="flex items-center justify-between">
                        <label class="flex items-center">
                            <input type="checkbox" class="h-4 w-4 text-indigo-600 border-gray-300 rounded">
                            <span class="ml-2 text-sm text-gray-700">Ghi nhớ tôi</span>
                        </label>
                        <a href="#" class="text-sm text-indigo-600 hover:underline">Quên mật khẩu?</a>
                    </div>

                    <!-- Submit -->
                    <div>
                        <button type="submit"
                                class="w-full flex justify-center items-center py-3 px-4 rounded-xl shadow-sm font-bold text-white bg-indigo-600 hover:bg-indigo-700 transition-all duration-300 transform hover:-translate-y-1 hover:shadow-lg">
                            <i class="fas fa-sign-in-alt mr-2"></i> Đăng Nhập
                        </button>
                    </div>
                </form>

                <!-- Footer -->
                <p class="mt-8 text-center text-sm text-gray-600">
                    Chưa có tài khoản?
                    <a href="register.jsp" class="text-indigo-600 font-medium hover:underline">Đăng ký ngay</a>
                </p>
            </div>
        </div>
    </div>
</div>

<!-- Toggle Password Script -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const passwordInput = document.getElementById('password');
        const toggleButton = document.getElementById('togglePassword');
        const icon = toggleButton.querySelector('i');

        toggleButton.addEventListener('click', function () {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            icon.classList.toggle('fa-eye');
            icon.classList.toggle('fa-eye-slash');
        });
    });
</script>
</body>
</html>
