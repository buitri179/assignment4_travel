package org.example.travel_webservice_provider.services;

import org.example.travel_webservice_provider.dao.UserDAO;
import org.example.travel_webservice_provider.entity.User;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService(serviceName = "UserService")
public class UserService {
    private UserDAO dao = new UserDAO();

    @WebMethod
    public String register(String username, String password) {
        if (dao.findByUsername(username) != null) return "exists";

        // Mặc định người dùng là "user"
        dao.register(new User(username, password, "user"));
        return "registered";
    }

    @WebMethod
    public String login(String username, String password) {
        User user = dao.login(username, password);
        return user != null ? user.getRole() : "failed";
    }

    @WebMethod
    public String getRole(String username) {
        User user = dao.findByUsername(username);
        return user != null ? user.getRole() : null;
    }
}
