/* ========= GLOBAL SCRIPT FOR NILAVU BASKET ========= */

/* Confirm before deleting (admin / cart) */
function confirmDelete(message) {
    if (!message) {
        message = "Are you sure you want to delete this item?";
    }
    return confirm(message);
}

/* Confirm before removing from cart */
function confirmRemove() {
    return confirm("Remove this item from cart?");
}

/* Basic login form validation */
function validateLogin() {
    var form = document.forms["loginForm"];
    if (!form) {
        return true;
    }

    var email = form["email"].value;
    var password = form["password"].value;

    if (email === "" || password === "") {
        alert("Email and Password must be filled out");
        return false;
    }
    return true;
}

/* Basic register form validation */
function validateRegister() {
    var form = document.forms["registerForm"];
    if (!form) {
        return true;
    }

    var name = form["name"].value;
    var email = form["email"].value;
    var password = form["password"].value;
    var phone = form["phone"].value;

    if (name === "" || email === "" || password === "" || phone === "") {
        alert("All fields are required");
        return false;
    }

    if (password.length < 5) {
        alert("Password must be at least 5 characters long");
        return false;
    }

    return true;
}

/* Payment confirmation */
function confirmPayment() {
    return confirm("Confirm payment?");
}

/* Show simple welcome message (optional) */
function showWelcome() {
    console.log("Welcome to Nilavu Basket!");
}


