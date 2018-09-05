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
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />

    <!-- User Data -->
    <%@ include file="UserInfo.jsp"%>

    <title>Student Time Management System: My Subjects</title>
    <!-- Logo -->
    <img src="img/Capture.PNG" alt="Logo" width="15%" height="15%">

    <!-- Notifications Header -->

    <%


        // testing data - no database
        //int numNote = 3; // replace hard coded number with get method
        //Notification note = new Notification(1, "senderid", "prmkim003", 1, false);

        // gte today's date - automatically fills the date field for adding an event
        Map<String, String[]> map = request.getParameterMap();
        if (map.containsKey("isAddSubject") && map.get("isAddSubject").equals("true")){
            DBManager.newSubject(new Subjects(
                map.get("name")[0],
                map.get("colour")[0],
                usr)
            );
        }
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
            <li><a href="DashboardPage.jsp" > <i class="fa fa-home" style="font-size:24px"></i> Home</a></li>
            <li><a href="index.jsp"><i class="fa fa-calendar" style="font-size:24px"></i> Schedule</a></li>
            <li><a href="ToDoPage.jsp"><i class="fa fa-tasks" style="font-size:24px"></i> To Do List</a></li>
            <li><a href="MentorsPage.jsp"><i class="fa fa-mortar-board" style="font-size:24px"></i> Mentorship</a></li>
            <li><a href="TeamPage.jsp"><i class="fa fa-group" style="font-size:24px"></i> My Teams</a></li>
            <li><a href="SubjectsPage.jsp" class="active"><i class="fa fa-book" style="font-size:24px"></i> My Subjects</a></li>
            <li style="float:right"><a class="active" href="#HelpPage.jsp"><i class="fa fa-question-circle" style="font-size:24px"></i> Help</a></li>
        </ul>
    </nav>

    <!-- Calendar Settings -->

</head>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script>

    <!-- 
     Name = Subject Name
     Age = Priority
     City = Colour
     ID = too mainstream.-->
    <style>
        body {
            font-family:sans-serif;
        }
        table td, table th {
            padding:5px;
        }
    </style>

<div id="contacts">
    <table>
        <thead>
        <tr>
            <th class="sort" data-sort="name">Subject</th>
            <th class="sort" data-sort="age">Priority</th>
            <th class="sort" data-sort="city">Colour</th>
            <th colspan="2">
                <input type="text" class="search" placeholder="Search contact" />
            </th>
        </tr>
        </thead>
        <tbody class="list">
        <tr>
            <td class="id" style="display:none;">1</td>
            <td class="name">Mathematics</td>
            <td class="age">27</td>
            <td  bgcolor="#FF0000" class="city"></td>
            <td class="edit"><button class="edit-item-btn">Edit</button></td>
            <td class="remove"><button class="remove-item-btn">Remove</button></td>
        </tr>
        <tr>
            <td class="id" style="display:none;">2</td>
            <td class="name">Computer Science</td>
            <td class="age">-132</td>
            <td bgcolor="green" class="city"></td>
            <td class="edit"><button class="edit-item-btn">Edit</button></td>
            <td class="remove"><button class="remove-item-btn">Remove</button></td>
        </tr>
        <tr>
            <td class="id" style="display:none;">3</td>
            <td class="name">History</td>
            <td class="age">-23</td>
            <td bgcolor="yellow" class="city"></td>
            <td class="edit"><button class="edit-item-btn">Edit</button></td>
            <td class="remove"><button class="remove-item-btn">Remove</button></td>
        </tr>
        <tr>
            <td class="id" style="display:none;">4</td>
            <td class="name">Hockey</td>
            <td class="age">26</td>
            <td bgcolor="pink"  class="city"></td>
            <td class="edit"><button class="edit-item-btn">Edit</button></td>
            <td class="remove"><button class="remove-item-btn">Remove</button></td>
        </tr>
        </tbody>
    </table>
    <table>
        <td class="name">
            <input type="hidden" id="id-field" />
            <input type="text" id="name-field" name="name" placeholder="Subject" />
        </td>
        <td class="age">
            <input type="number" id="age-field" name="priority" placeholder="Priority" />
        </td>
        <td class="city">
            <input type="text" id="city-field" name="colour" placeholder="Colour" />
        </td>
        <td class="add">
            <!--<button id="add-btn">Add</button>-->
            <input type="hidden" name="isAddSubject" value="true">
            <input type="submit" id="add-btn" value="Add">
            <button id="edit-btn">Edit</button>
        </td>
    </table>

</div>

<script>
    var options = {
        valueNames: [ 'id', 'name', 'age', 'city' ]
    };

    // Init list
    var contactList = new List('contacts', options);

    var idField = $('#id-field'),
        nameField = $('#name-field'),
        ageField = $('#age-field'),
        cityField = $('#city-field'),
        addBtn = $('#add-btn'),
        editBtn = $('#edit-btn').hide(),
        removeBtns = $('.remove-item-btn'),
        editBtns = $('.edit-item-btn');

    // Sets callbacks to the buttons in the list
    refreshCallbacks();

    addBtn.click(function() {
        contactList.add({
            id: Math.floor(Math.random()*110000),
            name: nameField.val(),
            age: ageField.val(),
            city: cityField.val()
        });
        clearFields();
        refreshCallbacks();
    });

    editBtn.click(function() {
        var item = contactList.get('id', idField.val())[0];
        item.values({
            id:idField.val(),
            name: nameField.val(),
            age: ageField.val(),
            city: cityField.val()
        });
        clearFields();
        editBtn.hide();
        addBtn.show();
    });

    function refreshCallbacks() {
        // Needed to add new buttons to jQuery-extended object
        removeBtns = $(removeBtns.selector);
        editBtns = $(editBtns.selector);

        removeBtns.click(function() {
            var itemId = $(this).closest('tr').find('.id').text();
            contactList.remove('id', itemId);
        });

        editBtns.click(function() {
            var itemId = $(this).closest('tr').find('.id').text();
            var itemValues = contactList.get('id', itemId)[0].values();
            idField.val(itemValues.id);
            nameField.val(itemValues.name);
            ageField.val(itemValues.age);
            cityField.val(itemValues.city);

            editBtn.show();
            addBtn.hide();
        });
    }

    function clearFields() {
        nameField.val('');
        ageField.val('');
        cityField.val('');
    }
</script>
</html>