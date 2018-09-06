<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="generators.EventGenerator" %>
<%@ page import="persist.DBManager" %>
<%@ page import="entity.Users" %>
<%@ page import="java.util.Map" %>
<%@ page import="entity.Events" %>
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
    <head>
        <!-- User Data -->
        <%@include file="UserInfo.jsp"%>
        <%
            Map<String, String[]> map = request.getParameterMap();
            if (map.containsKey("isEventAdd") && map.get("isEventAdd")[0].equals("true")){
                DBManager.newEvent(new Events(
                        map.get("name")[0],
                        map.get("priority")[0],
                        map.get("type")[0],
                        map.get("subject")[0],
                        map.get("startDate")[0],
                        map.get("startTime")[0],
                        map.get("endDate")[0],
                        map.get("endTime")[0],
                        usr
                ));
            }
        %>
        <title>Student Time Management System: Schedule</title>
        <!-- Logo -->
        <img src="img/Capture.PNG" alt="Logo" width="15%" height="15%">
        <link rel="stylesheet" href="stylesheet.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="stylesheet.css">
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
                <button id="btnNotifications" onclick="myFunction()" class="w3-button w3-black"><i class="fa fa-bell"></i>
                    Notifications (<%=numNote%>
                    )
                </button>
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
                <% numNote=0;%>

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
                <li><a href="MentorsPage.jsp"><i class="fa fa-mortar-board" style="font-size:24px"></i> Mentorship</a></li>
                <li><a href="TeamPage.jsp"><i class="fa fa-group" style="font-size:24px"></i> My Teams</a></li>
                <li><a href="SubjectsPage.jsp"><i class="fa fa-book" style="font-size:24px"></i> My Subjects</a></li>
                <li style="float:right"><a class="active" href="#HelpPage.jsp"><i class="fa fa-question-circle"
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
                        fillEventDetails(title, "", "", start, "" , "", "");
                    },
                    editable: true,
                    eventLimit: true//, // allow "more" link when too many events

                    // TO DO: fill data in the calendar
                    //events: <%=EventGenerator.allEvents()%>
                });

            });

            // fills in the events field with selected event's data
            function fillEventDetails(name, priority, subject, start, end, description, comments)
            {
                document.getElementById("rowDisplayName").innerText= name.textContent;
                document.getElementById("rowDisplayPriority").innerText= priority.toString();
                document.getElementById("rowDisplaySubject").innerText= subject.toString();
                document.getElementById("rowDisplayStartDate").innerText= start.toString();
                document.getElementById("rowDisplayEndDate").innerText= end.toString();
                document.getElementById("rowDisplayDescription").innerText= description.toString();
                document.getElementById("rowDisplayComments").innerText= comments.toString();
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

<%
    for (String[] s: request.getParameterMap().values()){
        %><%=s[0]+" | "%> <%
    }
%>

<!-- Add Buttons -->

<div stype="border-radius: 25px;" class="btn-group-add" style="display: inline;">

    <div>
        <button id="btnAddEvent" onclick="showEventForm(0)"><i class="material-icons">add</i> Add Event</button>
        <button><i class="material-icons">add</i> Add Task</button>
    </div>


    <div style="float:right;">
        <button id="btnEditEvent" onclick="showEventForm(1)"><i class="material-icons">mode_edit</i></button>
        <button id="btnDeleveEvent"><i class="material-icons"
                                       onclick="deleteEvent( '123', false, true)">delete_sweep</i></button>
        <script type="text/javascript">
            function deleteEvent(id, recurring, tasks) {
                if (recurring === true) {
                    if (confirm("Delete all related Recurring Events?")) {
                        // TO DO: code to delete event
                    }


                }

                if (tasks === true) {
                    if (confirm("Delete all related Tasks?")) {
                        // TO DO: code to delete event
                    }

                }

                if (tasks === false & recurring === false) {
                    if (confirm("Are you sure you want to delete this Event?")) {
                        // TO DO: code to delete event
                    }

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

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="stylesheet.css">
<!-- Add Event Pop Up Form -->
<div id="addEventModal" class="modal">

    <!-- Modal content -->

    <div class="event-input">
        <div class="modal-content">
            <span class="close">&times;</span>
            <form action="index.jsp" method="POST" id="eventcreation">

                <h5>&nbsp;</h5>
                <h3 align="center" id="eventFormHeader">Add New Event</h3>

                <table align="center">

                    <col width="200" style="text-align: right">
                    <col width="600" style="text-align: left">
                    <div class="name">
                        <tr class="form-table">
                            <th class="form-table"><label>Event Name</label></th>
                            <th class="form-table"><input type="text" id="txtEventName" name="name" value="" placeholder="Name"/></th>
                        </tr>


                    </div>

                    <div class="priority">
                        <tr class="form-table">
                            <th class="form-table"><label>Priority </label></th>
                            <th class="form-table">
                                <!-- TO DO: need to dynamically fill this combo box -->
                                <select class="prioritycmb" id="txtPriority" type="text" name="priority" value="">
                                    <option>Low</option>
                                    <option>Medium</option>
                                    <option>High</option>
                                </select>
                            </th>
                        </tr>
                    </div>

                    <div id="defaultSection" style="display:none">
                        <tr class="form-table">
                            <th class="form-table"><label>Type of Task </label></th>
                            <th class="form-table">
                                <select id="type" class="cmbType" type="text" name="type" value="">
                                    <option>Lecture</option>
                                    <option>Tutorial</option>
                                    <option>Group Meeting</option>
                                </select>
                            </th>
                        </tr>
                    </div>

                    <div class="subject">
                        <tr class="form-table">
                            <th class="form-table"><label>Subject</label></th>
                            <th class="form-table">
                                <select id="subject" class="prioritycmb" type="text" name="subject" value="">
                                    <option style="background-color:#b9b219">INF3012S</option>
                                    <option style="background-color: #4c8ec0">CSC3003S</option>
                                </select>
                            </th>
                        </tr>
                    </div>


                    <div>
                        <tr class="form-table">
                            <th class="form-table"><label>Start</label></th>
                            <th class="form-table">
                                <label for="appt-time">Date:</label>
                                <input type="date" name="startDate" placeholder="Start Date"
                                       required/>
                                <vaadin-date-picker label="Pick a date">
                                </vaadin-date-picker>

                                <div class="control">
                                    <label for="appt-time">Time:</label>
                                    <input type="time" id="appt-time" name="startTime" value="12:00PM" required/>
                                </div>
                            </th>
                        </tr>
                    </div>


                    <div>
                        <tr class="form-table">
                            <th class="form-table"><label>End</label></th>
                            <th class="form-table">
                                <label for="appt-time">Date:</label>
                                <input type="date" name="endDate" placeholder="End Date"/>
                                <vaadin-date-picker label="Pick a date">
                                </vaadin-date-picker>

                                <div class="control">
                                    <label for="appt-time">Time:</label>
                                    <input type="time" id="appt-time1" name="endTime" value="13:00PM"/>
                                </div>
                            </th>
                        </tr>
                    </div>


                    <div class="description">
                        <tr class="form-table">
                            <th class="form-table" style="float:top;"><label>Description </label></th>
                            <th class="form-table">
                                <textarea type="input" id="description" name="description"
                                          class="element textarea medium" maxlength=250></textarea>
                            </th>
                        </tr>
                    </div>


                    <h6>&nbsp;</h6>
                    <div>

                        <form id="recurringForm" action="#" method="POST">
                            <tr class="form-table">
                                <th class="form-table">
                                    <div>
                                        <label class="container">Recurring
                                            <input type="checkbox" id="recurTrigger" name="question"
                                                   onclick="hideShowRecurringForm()">
                                            <span class="checkmark"></span>
                                            <span class="checkmark"></span>
                                        </label>

                                    </div>
                                </th>
                                <th class="form-table">
                                    <div id="recurForm" style="display:none" style="margin-left: 50px"
                                         style="display: inline-block;">

                                        <p>Event repeats every</p>

                                        <input id="every" type="number" name="every" min="1" max="12" value="1" SIZE="3"
                                               width="5px"/> <select
                                            id="defineEvery" class="prioritycmb" type="text"
                                            name="cmbDefineEvery" value="">
                                        <option>days</option>
                                        <option>weeks</option>
                                        <option>months</option>
                                    </select>
                                        <p>on days</p>
                                        <table class="details">
                                            <tr class="details">
                                                <th class="details"><input type="checkbox" id="sun" name="chbSun"/></th>
                                                <th class="details"><input type="checkbox" id="mon" name="chbMon"/></th>
                                                <th class="details"><input type="checkbox" id="tue" name="chbTue"/></th>
                                                <th class="details"><input type="checkbox" id="wed" name="chbWed"/></th>
                                                <th class="details"><input type="checkbox" id="thu" name="chbThu"/>
                                                </th>
                                                <th class="details"><input type="checkbox" id="fri" name="chbFri"/></th>
                                                <th class="details"><input type="checkbox" id="satu" name="chbSat"/>
                                                </th>
                                            </tr>
                                            <tr class="details">
                                                <th class="details">Sun</th>
                                                <th class="details">Mon</th>
                                                <th class="details">Tue</th>
                                                <th class="details">Wed</th>
                                                <th class="details">Thu</th>
                                                <th class="details">Fri</th>
                                                <th class="details">Sat</th>
                                            </tr>
                                        </table>

                                    </div>
                        </form>

                        <script>
                            function hideShowRecurringForm() {
                                if (document.getElementById('recurTrigger').checked) {
                                    document.getElementById('recurForm').style.display = 'block';
                                }
                                else {
                                    document.getElementById('recurForm').style.display = 'none';
                                }
                            }
                        </script>
                        </th>
                        </tr>


                    </div>


                    <h6>&nbsp;</h6>
                    <div>
                        <form action="#" method="POST" id="autofillForm" style="background-color: grey">
                            <tr class="form-table">
                                <th class="form-table">
                                    <div>
                                        <label class="container">Auto-fill Tasks
                                            <input type="checkbox" id="autofillTrigger" name="chbAutofill"
                                                   onclick="hideShowAutofillSettings()">
                                            <span class="checkmark"></span>
                                        </label>

                                    </div>
                                </th>
                                <th class="form-table">
                                    <div id="wholeAutofillForm" style="display:none">

                                        Hours of Work: <input id="hoursWork" type="number" min="1" max="30" value="5"/>
                                        <div>
                                            <h6>&nbsp;</h6>
                                            <input type="checkbox" id="dispersed" name="chbDispersed"/>
                                            Disperse Tasks
                                        </div>
                                    </div>

                        </form>
                        <script type="text/javascript">
                            function hideShowAutofillSettings() {
                                if (document.getElementById('autofillTrigger').checked) {
                                    document.getElementById('wholeAutofillForm').style.display = 'block';
                                }
                                else {
                                    document.getElementById('wholeAutofillForm').style.display = 'none';
                                }
                            }

                        </script>
                        </th>
                        </tr>
                    </div>
                </table>

                <h6>&nbsp;</h6>

                <div>
                    <link rel="stylesheet"
                          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                    <!--<button class="submit"
                            style="border-top-right-radius: 25px;border-top-left-radius: 25px;border-bottom-right-radius: 25px;border-bottom-left-radius: 25px;background-color: #535353;border: 1px solid #3b3b3b;color: white;padding: 10px 24px; cursor: pointer; float: right;" onclick="saveNewEvent()">
                        <i class="fa fa-check-square"></i> Save
                    </button>-->
                    <input type="hidden" name = "isAddEvent" value="true" />
                    <input type="hidden" name = "user" value="<%=usr%>" />
                    <input type = "submit" value = "Save" style="border-top-right-radius: 25px;border-top-left-radius: 25px;border-bottom-right-radius: 25px;border-bottom-left-radius: 25px;background-color: #535353;border: 1px solid #3b3b3b;color: white;padding: 10px 24px; cursor: pointer; float: right;">
                    <script type="text/javascript">
                        function saveNewEvent() {
                            // TO DO: get data for title, start, end from form
                            //var eventName = document.getElementById("txtEventName").value;
                            //var priority = document.getElementById("txtPriority").value;
                            //var type = document.getElementById("type").value;
                            //// TO DO: finish for the other elements
                            //// TO DO: add the event to the database

                            // display the event on the calendar
                            //eventData = {
                            //    title: title,
                            //    start: start,
                            //    end: end
                            //$('#calendar').fullCalendar('renderEvent', eventData, true);
                            //$('#calendar').fullCalendar('unselect');
                            alert("This is a debug message");
                            //document.getElementById("eventcreation").submit();
                        };

                    </script>
                </div>

                <h1>&nbsp;</h1>
            </form>

        </div>
    </div>
</div>

<!-- Pop up Window Code -->
<script>

    // function called when event added with "+Add Event" button
    function showEventForm() {
        document.getElementById("eventFormHeader").textContent = "Add New Event";   // change form header
        modal.style.display = "block";
    }

    // function called when edit event clicked
    function showEventForm(name, priority, subject, start, end, description) {
        document.getElementById("eventFormHeader").textContent = "Edit Event";     // change form header
        // TO DO: fill all edit info into edit form


        modal.style.display = "block";
    }

    // function called when calendar date selected
    function showEventForm(start, end) {
        document.getElementById("eventFormHeader").textContent = "Add New Event";
        modal.style.display = "block";
    }

    // Get the modal
    var modal = document.getElementById('addEventModal');
    // Get the button that opens the modal
    var btn = document.getElementById("btnAddEvent");
    var btnEdit = document.getElementById("btnEditEvent");

    // Get the "<span" element that closes the modal
    var span = document.getElementsByClassName("close")[0];


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