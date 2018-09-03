
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="persist.DBManager" %>
<%@ page import="entity.Users" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />

    <!-- User Data -->
    <%
        String usr;
        try {
            usr = request.getParameter("lis_person_sourcedid").toString();
        } catch (Exception e){
            usr = "default";
        }
        if (!DBManager.isStored(usr)){
            DBManager.newUser(new Users(usr));
        }
    %>

    <title>Student Time Management System: To Do List</title>
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
            <li><a href="index.jsp"><i class="fa fa-calendar" style="font-size:24px"></i> Schedule</a></li>
            <li><a href="ToDoPage.jsp" class="active"><i class="fa fa-tasks" style="font-size:24px"></i> To Do List</a></li>
            <li><a href="MentorsPage.jsp"><i class="fa fa-mortar-board" style="font-size:24px"></i> Mentorship</a></li>
            <li><a href="TeamPage.jsp"><i class="fa fa-group" style="font-size:24px"></i> My Teams</a></li>
            <li><a href="SubjectsPage.jsp"><i class="fa fa-book" style="font-size:24px"></i> My Subjects</a></li>
            <li style="float:right"><a class="active" href="#HelpPage.jsp"><i class="fa fa-question-circle" style="font-size:24px"></i> Help</a></li>
        </ul>
    </nav>

    <!-- Calendar Settings -->

</head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#myInput1").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myUL li").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
    <style>


        body {
            margin: 0;
            min-width: 250px;
        }

        /* Include the padding and border in an element's total width and height */
        * {
            box-sizing: border-box;
        }

        /* Remove margins and padding from the list */
        ul {
            margin: 0;
            padding: 0;
        }

        /* Style the list items */
        ul li {
            cursor: pointer;
            position: relative;
            padding: 12px 8px 12px 40px;
            list-style-type: none;
            background: #eee;
            font-size: 18px;
            transition: 0.2s;

            /* make the list items unselectable */
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        /* Set all odd list items to a different color (zebra-stripes) */
        ul li:nth-child(odd) {
            background: #f9f9f9;
        }

        /* Darker background-color on hover */
        ul li:hover {
            background: #ddd;
        }

        /* When clicked on, add a background color and strike out text */
        ul li.checked {
            background: #888;
            color: #fff;
            text-decoration: line-through;
        }

        /* Add a "checked" mark when clicked on */
        ul li.checked::before {
            content: '';
            position: absolute;
            border-color: #fff;
            border-style: solid;
            border-width: 0 2px 2px 0;
            top: 10px;
            left: 16px;
            transform: rotate(45deg);
            height: 15px;
            width: 7px;
        }

        /* Style the close button */
        .close {
            position: absolute;
            right: 0;
            top: 0;
            padding: 12px 16px 12px 16px;
        }

        .close:hover {
            background-color: #f44336;
            color: white;
        }

        /* Style the header */
        .header {
            background-color: black;
            padding: 30px 40px;
            color: white;
            text-align: center;
        }

        /* Clear floats after the header */
        .header:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Style the input */
        input {
            margin: 0;
            border: none;
            border-radius: 0;
            width: 75%;
            padding: 10px;
            float: left;
            font-size: 16px;
        }

        /* Style the "Add" button */
        .addBtn {
            padding: 10px;
            width: 25%;
            background: #d9d9d9;
            color: #555;
            float: left;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            border-radius: 0;
        }

        .addBtn:hover {
            background-color: #bbb;
        }
    </style>

<body>



<div id="myDIV" class="header">
    <h2 style="margin:5px">My To Do List</h2>
    <input type="text" id="myInput" placeholder="Title...">
    <span onclick="newElement()" class="addBtn">Add</span>
    <input id="myInput1" type="text" placeholder="Search..">

</div>


<ul id="myUL">
    <li>Hit the gym</li>
    <li class="checked">Pay bills</li>
    <li>Meet George</li>
    <li>Buy eggs</li>
    <li>Read a book</li>
    <li>Organize office</li>
</ul>

<script>
    // Create a "close" button and append it to each list item
    var myNodelist = document.getElementsByTagName("LI");
    var i;
    for (i = 0; i < myNodelist.length; i++) {
        var span = document.createElement("SPAN");
        var txt = document.createTextNode("\u00D7");
        span.className = "close";
        span.appendChild(txt);
        myNodelist[i].appendChild(span);
    }

    // Click on a close button to hide the current list item
    var close = document.getElementsByClassName("close");
    var i;
    for (i = 0; i < close.length; i++) {
        close[i].onclick = function() {
            var div = this.parentElement;
            div.style.display = "none";
        }
    }

    // Add a "checked" symbol when clicking on a list item
    var list = document.querySelector('ul');
    list.addEventListener('click', function(ev) {
        if (ev.target.tagName === 'LI') {
            ev.target.classList.toggle('checked');
        }
    }, false);

    // Create a new list item when clicking on the "Add" button
    function newElement() {
        var li = document.createElement("li");
        var inputValue = document.getElementById("myInput").value;
        var t = document.createTextNode(inputValue);
        li.appendChild(t);
        if (inputValue === '') {
            alert("You must write something!");
        } else {
            document.getElementById("myUL").appendChild(li);
        }
        document.getElementById("myInput").value = "";

        var span = document.createElement("SPAN");
        var txt = document.createTextNode("\u00D7");
        span.className = "close";
        span.appendChild(txt);
        li.appendChild(span);

        for (i = 0; i < close.length; i++) {
            close[i].onclick = function() {
                var div = this.parentElement;
                div.style.display = "none";
            }
        }
    }
</script>

</body>
</html>
