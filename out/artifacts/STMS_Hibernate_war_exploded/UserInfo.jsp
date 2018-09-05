<%@ page import="persist.DBManager" %>
<%@ page import="entity.Users" %><%--
  Created by IntelliJ IDEA.
  User: Darien
  Date: 2018/09/04
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>

<%
    String usr = request.getParameter("lis_person_sourcedid");
    if(usr != null){
        if (!DBManager.isStored(usr)){
            DBManager.newUser(new Users(usr));
        }
    } else {
        usr = "default";
        if (!DBManager.isStored(usr)){
            DBManager.newUser(new Users(usr));
        }
    }
%>