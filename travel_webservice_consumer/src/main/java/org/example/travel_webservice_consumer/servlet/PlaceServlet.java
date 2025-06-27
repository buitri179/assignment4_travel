package org.example.travel_webservice_consumer.servlet;

import org.example.travel_webservice_consumer.client.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/places")
public class PlaceServlet extends HttpServlet {
    private PlaceService service = new PlaceService_Service().getPlaceServicePort();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Place> places = service.getAll();
        req.setAttribute("places", places);
        req.getRequestDispatcher("place.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String name = req.getParameter("name");
        String location = req.getParameter("location");
        int id = req.getParameter("id") != null ? Integer.parseInt(req.getParameter("id")) : 0;

        switch (action) {
            case "create":
                service.create(name, location);
                break;
            case "update":
                service.update(id, name, location);
                break;
            case "delete":
                service.delete(id);
                break;
        }

        resp.sendRedirect("places");
    }
}