
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

//space

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