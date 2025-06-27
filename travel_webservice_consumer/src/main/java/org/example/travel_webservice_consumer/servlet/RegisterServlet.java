package org.example.travel_webservice_consumer.servlet;

import org.example.travel_webservice_consumer.client.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserService service = new UserService_Service().getUserServicePort();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String result = service.register(username, password); // Gọi WebService

        if ("registered".equals(result)) {
            // Đăng ký thành công → chuyển sang trang đăng nhập
            req.setAttribute("message", "Đăng ký thành công! Mời đăng nhập.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            // Tên người dùng đã tồn tại
            req.setAttribute("error", "Tài khoản đã tồn tại!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}
