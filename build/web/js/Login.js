/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
document.addEventListener('DOMContentLoaded', function() {
    document.querySelector('.img-btn').addEventListener('click', function() {
        document.querySelector('.cont').classList.toggle('s-signup');
    });
});

function validateForm() {
    var name = document.getElementById("signUpName").value;
    var email = document.getElementById("signUpEmail").value;
    var address = document.getElementById("signUpAddress").value;
    var phone = document.getElementById("signUpPhone").value;
    var password = document.getElementById("signUpPassword").value;
    var confirmPassword = document.getElementById("signUpConfirmPassword").value;

    var nameError = document.getElementById("signUpNameError");
    var emailError = document.getElementById("signUpEmailError");
    var addressError = document.getElementById("signUpAddressError");
    var phoneError = document.getElementById("signUpPhoneError");
    var passwordError = document.getElementById("signUpPasswordError");
    var confirmPasswordError = document.getElementById("signUpConfirmPasswordError");

    var isValid = true;

    // Name validation
    if (name.trim() === "") {
        nameError.innerHTML = "Name is required";
        isValid = false;
    } else {
        nameError.innerHTML = "";
    }

    // Email validation
    if (email.trim() === "") {
        emailError.innerHTML = "Email is required";
        isValid = false;
    } else {
        emailError.innerHTML = "";
    }

    // Address validation
    if (address.trim() === "") {
        addressError.innerHTML = "Address is required";
        isValid = false;
    } else {
        addressError.innerHTML = "";
    }

    // Phone number validation
    if (phone.trim() === "") {
        phoneError.innerHTML = "Phone number is required";
        isValid = false;
    } else {
        phoneError.innerHTML = "";
    }

    // Password validation
    if (password.trim() === "") {
        passwordError.innerHTML = "Password is required";
        isValid = false;
    } else {
        passwordError.innerHTML = "";
    }

    // Confirm password validation
    if (password.trim() !== "") {
        if (confirmPassword.trim() === "") {
            confirmPasswordError.innerHTML = "Confirm Password is required";
            isValid = false;
        } else if (password !== confirmPassword) {
            confirmPasswordError.innerHTML = "Passwords do not match";
            isValid = false;
        } else {
            confirmPasswordError.innerHTML = "";
        }
    }

    return isValid;
}

function validateSignInForm() {
    var email = document.getElementById("signInEmail").value;
    var password = document.getElementById("signInPassword").value;

    if (email.trim() === "") {
        alert("Please enter your email address");
        return false;
    }

    if (password.trim() === "") {
        alert("Please enter your password");
        return false;
    }

    return true;
}




