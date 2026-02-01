/* ========= GLOBAL SCRIPT FOR NILAVU BASKET ========= */

/* Confirm before deleting a product (admin) */
function confirmDelete() {
    return confirm("Are you sure you want to delete this item?");
}

/* Confirm before removing from cart */
function confirmRemove() {
    return confirm("Remove this item from cart?");
}

/* Basic login form validation */
function validateLogin() {
    var email = document.forms["loginForm"]["email"].value;
    var password = document.forms["loginForm"]["password"].value;

    if (email === "" || password === "") {
        alert("Email and Password must be filled out");
        return false;
    }
    return true;
}

/* Basic register form validation */
function validateRegister() {
    var name = document.forms["registerForm"]["name"].value;
    var email = document.forms["registerForm"]["email"].value;
    var password = document.forms["registerForm"]["password"].value;
    var phone = document.forms["registerForm"]["phone"].value;

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
