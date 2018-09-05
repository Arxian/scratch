package persist;

import entity.*;
import generators.EventGenerator;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.sql.ResultSet;
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

    public static void newEvent(Events e){
        em.getTransaction().begin();
        em.persist(e);
        em.getTransaction().commit();
    }

    public static void newUser(Users u){
        em.getTransaction().begin();
        em.persist(u);
        em.getTransaction().commit();
    }

    public static boolean isStored(String userID){
        em.getTransaction().begin();
        boolean e = em.createQuery(String.format("from Users where userId = '%s'", userID), Users.class).getResultList().isEmpty();
        em.getTransaction().commit();
        return e;
    }

    public static Types getType(String name){
        em.getTransaction().begin();
        try {
            Types t = em.createQuery(String.format("from Types where typeName = '%s'", name), Types.class).getResultList().get(0);
            em.getTransaction().commit();
            return t;
        } catch (ArrayIndexOutOfBoundsException e) {
            em.getTransaction().commit();
            return null;
        }
    }

    public static Subjects getSubject(String name, String userID){
        em.getTransaction().begin();
        try {
            Subjects s = em.createQuery(String.format("from Subjects where subjectName = '%s' and userID = '%s'", name, userID), Subjects.class).getResultList().get(0);
            em.getTransaction().commit();
            return s;
        } catch (ArrayIndexOutOfBoundsException e) {
            em.getTransaction().commit();
            return null;
        }
    }

    public static List<Notifications> getNotifications(String usr){
        em.getTransaction().begin();
        try {
            List<Notifications> n = em.createQuery(String.format("from Notifications where userID = '%s'", usr), Notifications.class).getResultList();
            em.getTransaction().commit();
            return n;
        } catch (ArrayIndexOutOfBoundsException e) {
            em.getTransaction().commit();
            return null;
        }
    }

    public static String activityCountJson(String usr){
        em.getTransaction().begin();
        Query q = em.createQuery(String.format("select typeId, count(*) from Events where userId = '%s' by typeId", usr));
        String json = "";
        for (Object o : q.getResultList()){
            Object[] oL = (Object[]) o;
            String name = em.createQuery(String.format("from Types where typeId ='%s'", oL[0]), Types.class).getResultList().get(0).getTypeName();
            json += String.format("['%s', '%s'],", name, oL[1]);
        }
        return json.substring(0, json.length()-1);
    }

    public static void newSubject(Subjects s){
        em.getTransaction().begin();
        em.persist(s);
        em.getTransaction().commit();
    }

    public static void main(String[] args) {
        System.out.println(EventGenerator.allEvents());
    }
}
