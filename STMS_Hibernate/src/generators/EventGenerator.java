package generators;

import entity.Events;
import persist.DBManager;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EventGenerator {
    public static String monthEvents(){
        Date currentDate = new Date();
        List<Events> lE = DBManager.getEvents();
        String json = "[";
        for (Events e : lE){
            if (
                    e.getStartDate().getMonth() == currentDate.getMonth()
                    || e.getEndDate().getMonth() == currentDate.getMonth()
                    && e.getStartDate().getYear() == currentDate.getYear()){
                json += e.json()+",";
            }
        }
        return json.substring(0, json.length()-1) + "]";
    }
    public static String allEvents(){
        List<Events> lE = DBManager.getEvents();
        String json = "[";
        for (Events e : lE){
            json += e.json()+",";
        }
        if (json.length() > 1) return json.substring(0, json.length()-1) + "]";
        else return "[]";
    }


}
