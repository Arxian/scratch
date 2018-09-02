package persist;

import entity.Events;
import entity.Users;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.*;

public class DBManager {
    private static EntityManagerFactory emf = Persistence.createEntityManagerFactory( "STMSPU" );
    private static EntityManager em = emf.createEntityManager();

    public static List<Events> getEvents(){
        em.getTransaction().begin();
        java.util.List<Events> result = em.createQuery( "from Events", Events.class ).getResultList();
        em.getTransaction().commit();
        return result;
    }

    public static Users getUser(String userID){
        em.getTransaction().begin();
        try {
            Users e = em.createQuery("from Users where userId = " + userID, Users.class).getResultList().get(0);
            em.getTransaction().commit();
            return e;
        } catch (ArrayIndexOutOfBoundsException e) {
            em.getTransaction().commit();
            return null;
        }
    }

    public static Events getEvent(int eventID){
        em.getTransaction().begin();
        try {
            Events e = em.createQuery("from Events where eventId = " + eventID, Events.class).getResultList().get(0);
            em.getTransaction().commit();
            return e;
        } catch (ArrayIndexOutOfBoundsException e) {
            em.getTransaction().commit();
            return null;
        }
    }

    public static void main(String[] args) {
        System.out.println(getEvents());
    }
}
