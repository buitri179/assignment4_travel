package org.example.travel_webservice_consumer.servlet;

import org.example.travel_webservice_consumer.client.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService service = new UserService_Service().getUserServicePort();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String role = service.login(username, password); // Gọi WebService và nhận về role hoặc "failed"

        if (!"failed".equals(role)) {
            // Đăng nhập thành công -> lưu session
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            if ("admin".equals(role)) {
                resp.sendRedirect("place.jsp"); // hoặc /admin/home.jsp
            } else {
                resp.sendRedirect("index.jsp"); // trang chính cho user
            }
        } else {
            // Sai tài khoản
            req.setAttribute("error", "Tên đăng nhập hoặc mật khẩu sai!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }

    }
}
