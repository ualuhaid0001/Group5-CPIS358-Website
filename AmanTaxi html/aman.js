/* Simple demo */
var demoRides = [
    { id: 1, child: "Sara", pickup: "Home", dropoff: "School", time: "07:30", status: "Requested" },
    { id: 2, child: "Omar", pickup: "School", dropoff: "Home", time: "14:00", status: "Accepted" },
    { id: 3, child: "Lena", pickup: "Home", dropoff: "Grandparents", time: "16:00", status: "Completed" }
];

/* ---------------- login ---------------- */

function login() {
    var user = document.getElementById("username").value;
    var pass = document.getElementById("password").value;
    var role = document.getElementById("role").value;

    if (user === "" || pass === "" || role === "") {
        alert("Please fill in all fields.");
        return false;
    }

    if (pass !== "1234") {
        alert("Wrong, remember username(role), password(1234).");
        return false;
    }

    if (role === "parent" && user === "parent") {
        window.location.href = "parent.html";
    } else if (role === "driver" && user === "driver") {
        window.location.href = "driver.html";
    } else if (role === "admin" && user === "admin") {
        window.location.href = "admin.html";
    } else if (role === "child" && user === "child") {
        window.location.href = "child.html";
    } else {
        alert("User and role do not match in this prototype.");
    }

    return false;
}

/* ---------------- signup ---------------- */

function validateSignup() {
    var name = document.getElementById("suName").value;
    var email = document.getElementById("suEmail").value;
    var pass1 = document.getElementById("suPass1").value;
    var pass2 = document.getElementById("suPass2").value;

    if (name === "" || email === "" || pass1 === "" || pass2 === "") {
        alert("All fields are required.");
        return false;
    }

    if (email.indexOf("@") === -1) {
        alert("Please enter a valid email address.");
        return false;
    }

    if (pass1.length < 4) {
        alert("Password should be at least 4 characters.");
        return false;
    }

    if (pass1 !== pass2) {
        alert("Passwords do not match.");
        return false;
    }

    alert("Please login with the demo accounts.");
    window.location.href = "login.html";
    return false;
}

/* ---------------- parent ---------------- */

function initParentPage() {
    var msg = document.getElementById("parentWelcome");
    if (msg) {
        msg.innerHTML = "Welcome, Parent. Use the form below to request a ride for your child.";
    }
}

function bookRide() {
    var childName = document.getElementById("childName").value;
    var pickup = document.getElementById("pickupLocation").value;
    var dropoff = document.getElementById("dropoffLocation").value;
    var time = document.getElementById("pickupTime").value;

    if (childName === "" || pickup === "" || dropoff === "" || time === "") {
        alert("Please fill in all ride details.");
        return false;
    }

    var table = document.getElementById("parentRidesBody");
    var row = table.insertRow(table.rows.length);

    var cellId = row.insertCell(0);
    var cellChild = row.insertCell(1);
    var cellPick = row.insertCell(2);
    var cellDrop = row.insertCell(3);
    var cellTime = row.insertCell(4);
    var cellStatus = row.insertCell(5);

    cellId.innerHTML = table.rows.length;
    cellChild.innerHTML = childName;
    cellPick.innerHTML = pickup;
    cellDrop.innerHTML = dropoff;
    cellTime.innerHTML = time;
    cellStatus.innerHTML = "Requested";

    alert("Ride request added to the table (demo only).");
    return false;
}

function parentSOS() {
    alert("SOS sent to AmanTaxi or the Police (demo). Please rest assured.");
}


/* ---------------- general ---------------- */

function goHome() {
    window.location.href = "index.html";
}

function toggleDarkMode() {
    var body = document.body;
    var current = body.className;

    if (current.indexOf("dark-mode") === -1) {
        body.className = (current + " dark-mode").trim();
    } else {
        body.className = current.replace("dark-mode", "").trim();
    }
}
