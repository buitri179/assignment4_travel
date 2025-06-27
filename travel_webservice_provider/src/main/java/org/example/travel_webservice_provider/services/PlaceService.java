package org.example.travel_webservice_provider.services;

import org.example.travel_webservice_provider.dao.PlaceDAO;
import org.example.travel_webservice_provider.entity.Place;

import javax.jws.WebMethod;
import javax.jws.WebService;
import java.util.List;

@WebService(serviceName = "PlaceService")

public class PlaceService {
    private PlaceDAO dao = new PlaceDAO();

    @WebMethod
    public List<Place> getAll() {
        return dao.findAll();
    }

    @WebMethod
    public Place getById(int id) {
        return dao.findById(id);
    }

    @WebMethod
    public String create(String name, String location) {
        dao.save(new Place(name, location));
        return "created";
    }

    @WebMethod
    public String update(int id, String name, String location) {
        Place p = dao.findById(id);
        if (p == null) return "not_found";
        p.setName(name);
        p.setLocation(location);
        dao.update(p);
        return "updated";
    }

    @WebMethod
    public String delete(int id) {
        dao.delete(id);
        return "deleted";
    }
}