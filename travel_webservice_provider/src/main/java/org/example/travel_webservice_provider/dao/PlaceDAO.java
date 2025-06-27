package org.example.travel_webservice_provider.dao;

import org.example.travel_webservice_provider.entity.Place;
import javax.persistence.*;
import java.util.List;

public class PlaceDAO {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");

    public List<Place> findAll() {
        EntityManager em = emf.createEntityManager();
        return em.createQuery("SELECT p FROM Place p", Place.class).getResultList();
    }

    public void save(Place place) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(place);
        em.getTransaction().commit();
        em.close();
    }

    public void update(Place place) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.merge(place);
        em.getTransaction().commit();
        em.close();
    }

    public void delete(int id) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Place place = em.find(Place.class, id);
        if (place != null) em.remove(place);
        em.getTransaction().commit();
        em.close();
    }

    public Place findById(int id) {
        EntityManager em = emf.createEntityManager();
        return em.find(Place.class, id);
    }
}