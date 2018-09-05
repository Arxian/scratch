<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="entity.Users" %>
<%@ page import="persist.DBManager" %>
<%--
  Created by IntelliJ IDEA.
  User: Kim
  Date: 2018/08/26
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<!--https://github.com/Jae-Young-Kim/FullCalendarMySql-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" href="stylesheet.css">
<head>
    <!-- User Data -->
    <%@include file="UserInfo.jsp"%>

    <title>Student Time Management System: My Teams</title>
    <!-- Logo -->
    <img src="img/Capture.PNG" alt="Logo" width="15%" height="15%">

    <!-- Notifications Header -->

    <%
        // testing data - no database
        //int numNote = 3; // replace hard coded number with get method
        //Notification note = new Notification(1, "senderid", "prmkim003", 1, false);

        // gte today's date - automatically fills the date field for adding an event
        String selectedDate = new SimpleDateFormat("yyyy/MM/dd").format(new Date());

    %>
    <%!
        public String typeMesasage(int typeNum) {
            String message = "";
            if (typeNum == 0) {
                message = " added a comment";
            } else if (typeNum == 1) {
                message = " has sent you a team request";
            } else if (typeNum == 2) {
                message = " has accepted your team request";
            } else if (typeNum == 3) {
                message = " has sent you a mentorship request";
            } else if (typeNum == 4) {
                message = " has accepted your mentorship request";
            } else if (typeNum == 5) {
                message = " has had low productivity";
            }
            return message;
        }
    %>

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <div class="w3-container" style="float:right;">
        <div class="w3-dropdown-click">
            <button id="btnNotifications" onclick="myFunction()" class="w3-button w3-black"><i class="fa fa-bell"></i> Notifications (<%=numNote%>
                )
            </button>
            <div id="Demo" class="w3-dropdown-content w3-bar-block w3-card-4 w3-animate-zoom" style="right:0">
                <a href="#" class="w3-bar-item w3-button">Link 1</a>
                <a href="#" class="w3-bar-item w3-button">Link 2</a>
                <a href="#" class="w3-bar-item w3-button">Link 3</a>
            </div>
        </div>
    </div>

    <script>
        function myFunction() {
            var x = document.getElementById("Demo");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
            resolveNotifications();
        }

        <!-- Notifications Functions: all resolved when user clicks tab -->
        function resolveNotifications() {
            // all notifications have been seen
            <% numNote=0;%>;

            // TO DO: set all resolved to true
        }

        function addNotification() {
            // one notification added
            <% numNote += 1; %>
        }
    </script>


    <!-- Navigation Bar -->
    <nav class="toolbar">

        <link rel="stylesheet" href="stylesheet.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <ul>
            <li><a href="DashboardPage.jsp"> <i class="fa fa-home" style="font-size:24px"></i> Home</a></li>
            <li><a href="index.jsp" ><i class="fa fa-calendar" style="font-size:24px"></i> Schedule</a></li>
            <li><a href="ToDoPage.jsp"><i class="fa fa-tasks" style="font-size:24px"></i> To Do List</a></li>
            <li><a href="MentorsPage.jsp"><i class="fa fa-mortar-board" style="font-size:24px"></i> Mentorship</a></li>
            <li><a href="TeamPage.jsp" class="active"><i class="fa fa-group" style="font-size:24px"></i> My Teams</a></li>
            <li><a href="SubjectsPage.jsp"><i class="fa fa-book" style="font-size:24px"></i> My Subjects</a></li>
            <li style="float:right"><a class="active" href="#HelpPage.jsp"><i class="fa fa-question-circle" style="font-size:24px"></i> Help</a></li>
        </ul>
    </nav>

    <!-- Calendar Settings -->

</head>

<script>
    function addInitialData()
    {
        addMembers();
        // TO DO: method to populate calendar
    }

    function addMembers()
    {
        // TO DO: get data from the database instead of using a list
        var members = [
            { memberName: 'hlldar006' },
            { memberName: 'mzvwin001' }
        ];
        
        // leave this code the same

        var table = document.getElementById("memberTable");

        var newRow = table.insertRow();
        newRow.class="details";

        var newCell = newRow.insertCell();
        newCell.class="details";

        var h2=document.createElement("h2");
        h2.innerHTML = "Team Members";

        newCell.appendChild(h2);

        for (var i = 0; i<members.length; i++)
        {
            newRow = table.insertRow(i+1);
            newRow.class="details";

            newCell = newRow.insertCell(0);
            newCell.class="details";
            newCellChb = newRow.insertCell(1);
            newCellChb.class="details";

            var label=document.createElement("label");
            label.class="container";
            label.innerHTML="   " + members[i].memberName;

            var chb = document.createElement("input");
            chb.id="chbMember" + i;
            chb.type="checkbox";
            chb.name="question";
            chb.onclick =removeMember();

            var span= document.createElement("span");
            span.class="checkmark";

            chb.appendChild(span);
            newCell.appendChild(label);
            newCellChb.appendChild(chb);
        }

    }
</script>


<body onload="addInitialData()">
<h4>&nbsp;</h4>




<!-- Calendar -->


<!-- Team Select List -->
<aside style="float:right;">

    <!-- Add Buttons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="stylesheet.css">
    <div class="btn-group-add" style="display: inline; float:right; border-radius: 25px;" >
        <button id="btnAddMember"><i class="material-icons">add</i> Add Member</button>
        <button id="btnRemove" onclick="removeMembers()"><i class="material-icons">remove</i> Remove Selected</button>
    </div>


    <style>
        .details table {
            font-family: arial, sans-serif;
            text-align: left;
            border-collapse: collapse;
            min-width: 150px;
            border: 1px solid #dddddd;
        }

        .details td, th {
            border: 1px solid #dddddd;
            text-align: left;
            vertical-align: text-top;
            padding: 8px;
        }

        .details tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="stylesheet.css">
    <table id="memberTable" class="details">

    </table>


<script>
    function removeMember()
    {
        // TO DO: Remove team members selected
    }
</script>


</aside>



<h1>&nbsp;</h1>


</body>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="stylesheet.css">
<!-- Add Member Pop Up Form -->
<div id="addMemberModal" class="modal">

    <!-- Modal content -->

    <div class="event-input">
        <div class="modal-content">
            <span class="close">&times;</span>
            <form action="EventController" method="post">

                <h5>&nbsp;</h5>
                <h3 align="center" id="eventFormHeader">Add New Team Member</h3>

                    <div class="description">
                            <label>List Team Members </label>
                        <link rel="stylesheet" href="stylesheet.css">
                            <textarea type="input" id="element_1" name="element_1" class="element textarea medium" maxlength=250></textarea>

                    </div>

                    <h6>&nbsp;</h6>


                <div>
                    <link rel="stylesheet"
                          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                    <button class="submit"
                            style="border-radius: 25px;background-color: #535353;border: 1px solid #3b3b3b;color: white;padding: 10px 24px; cursor: pointer; float: right;">
                        <i class="fa fa-envelope"></i> Send Team Invite
                    </button>
                </div>

                <h1>&nbsp;</h1>
            </form>

        </div>
    </div>
</div>

<!-- Pop up Window Code -->
<script>
    // Get the modal
    var modal = document.getElementById('addMemberModal');
    // Get the button that opens the modal
    var btn = document.getElementById("btnAddMember");

    // Get the "<span" element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function () {
        modal.style.display = "block";
    }
    // When the user clicks on <span (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

</script>


</html>