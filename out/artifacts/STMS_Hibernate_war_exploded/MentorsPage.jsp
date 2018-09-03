
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="persist.DBManager" %>
<%@ page import="entity.Users" %>
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
    <%
        String usr = request.getAttribute("lis_person_sourcedid").toString();
        if (!DBManager.isStored(usr)){
            DBManager.newUser(new Users(usr));
        }
    %>

    <title>Student Time Management System: My Mentees</title>
    <!-- Logo -->
    <img src="img/Capture.PNG" alt="Logo" width="15%" height="15%">

    <!-- Notifications Header -->

    <%


        // testing data - no database
        int numNote = 3; // replace hard coded number with get method
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
            <button id="btnNotifications" onclick="myFunction()" class="w3-button w3-black"><i class="fa fa-bell"></i>
                Notifications (<%=numNote%>
                )
            </button>
            <!-- TO DO: add notifications -->
            <div id="Demo" class="w3-dropdown-content w3-bar-block w3-card-4 w3-animate-zoom" style="right:0">
                <a href="#" class="w3-bar-item w3-button">Link 1</a>
                <a href="#" class="w3-bar-item w3-button">Link 2</a>
                <a href="#" class="w3-bar-item w3-button">Link 3</a>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function myFunction() {
            var x = document.getElementById("Demo");
            if (x.className.indexOf("w3-show") === -1) {
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
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <ul>
            <li><a href="DashboardPage.jsp"> <i class="fa fa-home" style="font-size:24px"></i> Home</a></li>
            <li><a href="index.jsp" class="active"><i class="fa fa-calendar" style="font-size:24px"></i> Schedule</a>
            </li>
            <li><a href="ToDoPage.jsp"><i class="fa fa-tasks" style="font-size:24px"></i> To Do List</a></li>
            <li><a href="MentorsPage.jsp" class="active" ><i class="fa fa-mortar-board" style="font-size:24px"></i> Mentorship</a></li>
            <li><a href="TeamPage.jsp"><i class="fa fa-group" style="font-size:24px"></i> My Teams</a></li>
            <li><a href="SubjectsPage.jsp"><i class="fa fa-book" style="font-size:24px"></i> My Subjects</a></li>
            <li style="float:right"><a href="#HelpPage.jsp"><i class="fa fa-question-circle"
                                                                              style="font-size:24px"></i> Help</a></li>
        </ul>
    </nav>

    <!-- Calendar Settings -->
    <link href='fullcalendar/fullcalendar.min.css' rel='stylesheet'/>
    <link href='fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print'/>
    <script type="text/javascript" src='fullcalendar/lib/moment.min.js'></script>
    <script type="text/javascript" src='fullcalendar/lib/jquery.min.js'></script>
    <script type="text/javascript" src='fullcalendar/fullcalendar.min.js'></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay, year'
                },
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectHelper: true,
                select: function (start, end) {
                    showEventForm(start, end);

                },
                // fills data from the selected event into the event details table
                eventClick: function (id, title, start) {

                    // TO DO: when an event is selected, the id of the event should be accepted to look it up in the database and add it to the event details form
                    // add data as parameters in the fillEventDetails method
                    fillEventDetails(title, "", "", start, "", "", "");
                },
                editable: true,
                eventLimit: true, // allow "more" link when too many events

                // TO DO: fill data in the calendar
                events: [
                    {
                        id: 1234,
                        title: 'All Day Event',
                        start: '2018-03-01'
                    },
                    {
                        id: 12345,
                        title: 'Long Event',
                        start: '2018-03-07',
                        end: '2018-03-10'
                    },
                    {

                        id: 999,
                        title: 'Repeating Event',
                        start: '2018-03-09T16:00:00'
                    },
                    {
                        // recurring events have the same id
                        id: 999,
                        title: 'Repeating Event',
                        start: '2018-03-16T16:00:00'
                    },
                    {
                        id: 47,
                        title: 'Conference',
                        start: '2018-03-11',
                        end: '2018-03-13'
                    },
                    {
                        id: 6,
                        title: 'Meeting',
                        start: '2018-03-12T10:30:00',
                        end: '2018-03-12T12:30:00'
                    },
                    {
                        id: 7,
                        title: 'Lunch',
                        start: '2018-03-12T12:00:00'
                    },
                    {
                        id: 8,
                        title: 'Meeting',
                        start: '2018-03-12T14:30:00'
                    },
                    {
                        id: 8798,
                        title: 'Happy Hour',
                        start: '2018-03-12T17:30:00'
                    },
                    {
                        id: 6546,
                        title: 'Dinner',
                        start: '2018-03-12T20:00:00'
                    },
                    {
                        id: 65465,
                        title: 'Birthday Party',
                        start: '2018-03-13T07:00:00'
                    },
                    {
                        id: 1234545,
                        title: 'Click for Google',
                        url: 'http://google.com/',
                        start: '2018-03-28'
                    }
                ]
            });

        });

        // fills in the events field with selected event's data
        function fillEventDetails(name, priority, subject, start, end, description, comments) {
            document.getElementById("rowDisplayName").innerText = name.textContent;
            document.getElementById("rowDisplayPriority").innerText = priority.toString();
            document.getElementById("rowDisplaySubject").innerText = subject.toString();
            document.getElementById("rowDisplayStartDate").innerText = start.toString();
            document.getElementById("rowDisplayEndDate").innerText = end.toString();
            document.getElementById("rowDisplayDescription").innerText = description.toString();
            document.getElementById("rowDisplayComments").innerText = comments.toString();
        }

    </script>
    <style type="text/css">

        body {
            margin: 0px 10px;
            padding: 0;
            font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }

    </style>

</head>


<body>
<h7>&nbsp;</h7>

<!-- Mentee modification and selection controls -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="stylesheet.css">
<div stype="border-radius: 25px;" class="btn-group-add" style="display: inline;">

    <!-- TO DO: need to dynamically fill this combo box -->
    <!-- TO DO: onclick method to fill calendar -->
    <h5>&nbsp;</h5>
    <div style="display:inline">
        <label>My Mentees: </label>
        <select class="menteescmb" id="cmbMentees" type="text" name="mentees">
            <option>prmkim003</option>
            <option>asd</option>
            <option>Higwewerh</option>
        </select>

        <button id="btnAddMentees"><i class="material-icons">add</i></button>

        <!-- Parse selected mentee's id in the method -->
        <button id="btnRemoveMentee" onclick="deleteMentee('get MenteeID here')"><i class="material-icons">remove</i></button>

        <script type="text/javascript">
            function deleteMentee(id) {
                if (confirm("Are you sure you want to remove this Mentee?")) {
                    // TO DO: code to delete event
                }
            };
        </script>
    </div>


</div>
<h5>&nbsp</h5>

<!-- Calendar Implementation -->
<div id='calendar' style="float:left;"></div>


<!-- Event Details -->
<aside style="float:right;">
    <h5>&nbsp</h5>
    <style type="text/css">
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
    <table class="details">
        <tr class="details">
            <th class="details">Event Name</th>
            <th id="rowDisplayName" class="details"></th>
        </tr>
        <tr class="details">
            <th class="details">Priority</th>
            <th id="rowDisplayPriority" class="details">[Priotity variable]</th>
        </tr>
        <tr class="details">
            <th class="details">Subject</th>
            <th id="rowDisplaySubject" class="details">[Subject variable]</th>
        </tr>
        <tr class="details">
            <th class="details">Start Date</th>
            <th id="rowDisplayStartDate" class="details">[variable]</th>
        </tr>
        <tr class="details">
            <th class="details">End Date</th>
            <th id="rowDisplayEndDate" class="details">[variable]</th>
        </tr>
        <tr class="details">
            <th class="details">Description</th>
            <th id="rowDisplayDescription" class="details">[variable]</th>
        </tr>
        <tr class="details">
            <th class="details">Comments</th>
            <th id="rowDisplayComments" class="details"></th>
        </tr>
    </table>

    <!-- Add new comment -->
    <div>
    <textarea type="input" id="txaNewComment" name="element_1"
              class="element textarea medium" maxlength=250></textarea>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <button class="submit"
                style="border-radius: 25px;background-color: #535353;border: 1px solid #3b3b3b;color: white;padding: 10px 24px; cursor: pointer; float: right;">
            <i class="fa fa-comment"></i> Comment
        </button>
    </div>
    <h5>&nbsp;</h5>
    <div>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <button class="submit"
                style="border-radius: 25px;background-color: #535353;border: 1px solid #3b3b3b;color: white;padding: 10px 24px; cursor: pointer;">
            <i class="fa fa-search"></i> Find Related Tasks
        </button>
    </div>
</aside>
<h1>&nbsp;</h1>
</body>






<!-- Add Mentee Pop Up Form -->
<div id="addMemberModal" class="modal">

    <!-- Modal content -->

    <div class="event-input">
        <div class="modal-content">
            <span class="close">&times;</span>
            <form action="EventController" method="post">

                <h5>&nbsp;</h5>
                <h3 align="center" id="FormHeader">Add New Mentee</h3>

                <div class="description">
                    <label>List Mentees Below </label>
                    <link rel="stylesheet" href="stylesheet.css">
                    <textarea type="input" id="element_1" name="element_1" class="element textarea medium" maxlength=250></textarea>

                </div>

                <h6>&nbsp;</h6>


                <div>
                    <link rel="stylesheet"
                          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                    <button class="submit"
                            style="border-radius: 25px;background-color: #535353;border: 1px solid #3b3b3b;color: white;padding: 10px 24px; cursor: pointer; float: right;">
                        <i class="fa fa-envelope"></i> Send Menteee Invite
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
    var btn = document.getElementById("btnAddMentees");

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