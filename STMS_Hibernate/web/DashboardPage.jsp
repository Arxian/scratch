
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="generators.*"%>
<%@ page import="persist.DBManager" %>
<%@ page import="entity.Users" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />

    <!-- User Data -->
    <%@include file="UserInfo.jsp"%>
    <title>Student Time Management System: Home</title>
    <!-- Logo -->
    <img src="img/Capture.PNG" alt="Logo" width="15%" height="15%">

    <!-- Notifications Header -->

    <%


        // testing data - no database
        //int numNote = 3; // replace hard coded number with get method
       // Notification note = new Notification(1, "senderid", "prmkim003", 1, false);

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
            } else if (typeNum == 4) {
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <ul>
            <li><a href="DashboardPage.jsp" class="active"> <i class="fa fa-home" style="font-size:24px"></i> Home</a></li>
            <li><a href="index.jsp"><i class="fa fa-calendar" style="font-size:24px"></i> Schedule</a></li>
            <li><a href="ToDoPage.jsp"><i class="fa fa-tasks" style="font-size:24px"></i> To Do List</a></li>
            <li><a href="MentorsPage.jsp"><i class="fa fa-mortar-board" style="font-size:24px"></i> Mentorship</a></li>
            <li><a href="TeamPage.jsp"><i class="fa fa-group" style="font-size:24px"></i> My Teams</a></li>
            <li><a href="SubjectsPage.jsp"><i class="fa fa-book" style="font-size:24px"></i> My Subjects</a></li>
            <li style="float:right"><a class="active" href="#HelpPage.jsp"><i class="fa fa-question-circle" style="font-size:24px"></i> Help</a></li>
        </ul>
    </nav>

    <!-- Calendar Settings -->

</head>
<body>

<link href='fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='fullcalendar/lib/moment.min.js'></script>
<script src='fullcalendar/lib/jquery.min.js'></script>
<script src='fullcalendar/fullcalendar.min.js'></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!--<link href='ToDoList.css' rel='stylesheet' />-->
<script src='ToDoListJS.js'></script>

<script type="text/javascript">
    // Load google charts
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    // Draw the chart and set the chart values
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Task', 'Active Events'],
            <%=DBManager.activityCountJson(usr)%>
        ]);

        // Optional; add a title and set the width and height of the chart
        var options = {'title':'My Average Day', 'width':700, 'height':360};

        // Display the chart inside the <div> element with id="piechart"
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
    }
</script>

<script>

    $(document).ready(function() {
        $('#calendar').fullCalendar({

            header: {
                left: 'prev,next ',
                center: 'title',
                right: 'listDay,listWeek,listMonth,listYear'
            },

            // customize the button names,
            // otherwise they'd all just say "list"
            views: {
                listDay: {buttonText: 'Day'},
                listWeek: {buttonText: 'Week'},
                listMonth: {buttonText: 'Month'},
                listYear: {buttonText: 'Year'}
            },

            defaultView: 'listWeek',
            defaultDate: '2018-09-02',
            navLinks: true, // can click day/week names to navigate views
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            events: <%=EventGenerator.allEvents()%>,


            eventRender: function eventRender( event ) {

                $('#type_selector').selectedIndex
                return ['all', event.type].indexOf($('#type_selector').val())>=0
            },


            eventClick: function(calEvent, jsEvent, view) {
                jsEvent.preventDefault();
                alert('Notes: ' + calEvent.description);
                // alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                // alert('View: ' + view.name);

                // change the border color just for fun
                $(this).css('border-color', 'red');

            },

        });

        $('#type_selector').on('change',function(){
            $('#calendar').fullCalendar('rerenderEvents');
        })


    });



</script>


<style>

    body {
        margin: 40px 10px;
        padding: 0;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        font-size: 14px;
    }

    #calendar {
        max-width: 900px;
        margin: 0 auto;
    }
    .container {  position: relative; }

    .topright {
        -webkit-flex: 3;
        -ms-flex: 3;
        flex: 3;
        background-color: #f1f1f1;
        padding: 10px;
    }

    section {
        display: -webkit-flex;
        display: flex;
    }



    #wrapper{
        margin-left:auto;
        margin-right:auto;
        height:auto;
        width:auto;
    }
    #piechart{
        float:left;
    }
    #two{
        float:left;
    }

</style>
<section>

    <section style="border: black" style="border-width: thin" style= "background-color: pink">
        <div id="wrapper">
            <div  style="background-color: #bce8f1" id="piechart">
            </div>

            <div>
                <div id="myDIV" class="header">
                    <h4 style="margin:5px">My To Do List</h4>
                    <input type="text" id="myInput" placeholder="Title...">
                    <span onclick="newElement()" class="addBtn">Add</span>
                </div>

                <ul id="myUL" class="tdl">
                    <li>Hit the gym</li>
                    <li class="checked">Pay bills</li>
                    <li>Meet George</li>
                    <li>Buy eggs</li>
                    <li>Read a book</li>
                    <li>Organize office</li>
                </ul>

            </div>
        </div>
    </section>


    <div id = "List" class='topright' >
        <h2 style="position: relative" > Upcoming Events</h2>

        <div>
            <select style="width: 100px"  style="right: 16px" id="type_selector">
                <option value="all">All</option>
                <option value="Event">Events</option>
                <option value="toDo">To Do</option>
            </select>
        </div>

        <div  id='calendar'></div>
    </div>

</section>

</body>
</html>
