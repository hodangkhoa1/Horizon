PrintCopyRight();

function PrintCopyRight() {
    console.log("%cHello! \ud83d\ude4b", "color: #29c4a9;font-size: 16px;font-weight: 600;"),
            console.log("%cHorizon front-end was built with HTML, CSS, and lots of love. \n\nHorizon back-end was built with SQL Server, and lots of love. \n\n\ud83d\udc49 Want to learn with us? Check out ".concat(window.location.origin, "/Horizon/home"), "color: #29c4a9;font-size: 14px;");
}

const buttonSignin = document.querySelector("#sign_in_btn");
const buttonSignup = document.querySelector("#sign_up_btn");
const container = document.querySelector(".body_container");

//Check những trường hợp ở ô nhập username sign in
const usernameSigninInput = document.querySelector("#signinUsername"),
        usernameSigninField = document.querySelector("#signinUsernameField"),
        errorUsernameSignin = document.querySelector("#username_error_signin"),
        iconCheckUsernameSignin = document.querySelector(".signin_username_icon_check"),
        iconErrorUsernameSignin = document.querySelector(".signin_username_icon_error");

//Check những trường hợp ở ô nhập password sign in
const passwordSigninInput = document.querySelector("#signinPassword"),
        passwordSigninField = document.querySelector("#signinPasswordField"),
        errorPasswordSignin = document.querySelector("#password_error_signin"),
        iconCheckPasswordSignin = document.querySelector(".signin_password_icon_check"),
        iconErrorPasswordSignin = document.querySelector(".signin_password_icon_error");

//Check những trường hợp ở ô nhập username sign up
const usernameSignupInput = document.querySelector("#signupUsername"),
        usernameSignupField = document.querySelector("#signupUsernameField"),
        errorUsernameSignup = document.querySelector("#username_error_signup"),
        iconCheckUsernameSignup = document.querySelector(".signup_username_icon_check"),
        iconErrorUsernameSignup = document.querySelector(".signup_username_icon_error");

//Check những trường hợp ở ô nhập email sign up
const emailSignupInput = document.querySelector("#signupEmail"),
        emailSignupField = document.querySelector("#signupEmailField"),
        errorEmailSignup = document.querySelector("#email_error_signup"),
        iconCheckEmailSignup = document.querySelector(".signup_email_icon_check"),
        iconErrorEmailSignup = document.querySelector(".signup_email_icon_error");

//Check những trường hợp ở ô nhập password sign up
const passwordSignupInput = document.querySelector("#signupPassword"),
        passwordSignupField = document.querySelector("#signupPasswordField"),
        errorPasswordSignup = document.querySelector("#password_error_signup"),
        iconCheckPasswordSignup = document.querySelector(".signup_password_icon_check"),
        iconErrorPasswordSignup = document.querySelector(".signup_password_icon_error");

//Check những trường hợp ở ô nhập confirm password sign up
const confirmPasswordInput = document.querySelector("#confirmPassword"),
        confirmPasswordField = document.querySelector("#confirmPasswordField"),
        errorConfirmPassword = document.querySelector("#confirm_password_error_signup"),
        iconCheckConfirmPassword = document.querySelector(".confirm_password_icon_check"),
        iconErrorConfirmPassword = document.querySelector(".confirm_password_icon_error");

//Loader
const loader = document.querySelector("#preloader");

//Hàm check email
function validateEmail(email) {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

buttonSignup.addEventListener('click', () => {
    container.classList.add("sign_up_mode");
    usernameSigninField.style.border = 'transparent';
    errorUsernameSignin.innerHTML = '';
    passwordSigninField.style.border = 'transparent';
    errorPasswordSignin.innerHTML = '';
    iconCheckUsernameSignin.style.display = 'none';
    iconErrorUsernameSignin.style.display = 'none';
    iconCheckPasswordSignin.style.display = 'none';
    iconErrorPasswordSignin.style.display = 'none';
    usernameSigninInput.value = "";
    passwordSigninInput.value = "";
});

buttonSignin.addEventListener('click', () => {
    container.classList.remove("sign_up_mode");
    usernameSignupField.style.border = 'transparent';
    errorUsernameSignup.innerHTML = '';
    emailSignupField.style.border = 'transparent';
    errorEmailSignup.innerHTML = '';
    passwordSignupField.style.border = 'transparent';
    errorPasswordSignup.innerHTML = '';
    iconCheckUsernameSignup.style.display = 'none';
    iconErrorUsernameSignup.style.display = 'none';
    iconCheckEmailSignup.style.display = 'none';
    iconErrorEmailSignup.style.display = 'none';
    iconCheckPasswordSignup.style.display = 'none';
    iconErrorPasswordSignup.style.display = 'none';
    usernameSignupInput.value = "";
    emailSignupInput.value = "";
    passwordSignupInput.value = "";
    confirmPasswordInput.value = "";
    confirmPasswordField.style.border = 'transparent';
    errorConfirmPassword.innerHTML = '';
    iconCheckConfirmPassword.style.display = 'none';
    iconErrorConfirmPassword.style.display = 'none';
});

//Event cho ô nhập username của sign in
usernameSigninInput.addEventListener('input', function () {
    const isEmpty = this.value === '';

    if (isEmpty) {
        usernameSigninField.style.border = '1px solid red';
        errorUsernameSignin.innerHTML = 'Please enter your Username';
        iconErrorUsernameSignin.style.display = 'block';
        iconCheckUsernameSignin.style.display = 'none';
    } else {
        usernameSigninField.style.border = '1px solid green';
        errorUsernameSignin.innerHTML = '';
        iconErrorUsernameSignin.style.display = 'none';
        iconCheckUsernameSignin.style.display = 'block';
    }
});

//Event cho ô nhập password của sign in
passwordSigninInput.addEventListener('input', function () {
    const isEmpty = this.value === '';

    if (isEmpty) {
        passwordSigninField.style.border = '1px solid red';
        errorPasswordSignin.innerHTML = 'Please enter your Password';
        iconCheckPasswordSignin.style.display = 'none';
        iconErrorPasswordSignin.style.display = 'block';
    } else {
        passwordSigninField.style.border = '1px solid green';
        errorPasswordSignin.innerHTML = '';
        iconCheckPasswordSignin.style.display = 'block';
        iconErrorPasswordSignin.style.display = 'none';
    }
});

//Event cho ô nhập username của sign up
usernameSignupInput.addEventListener('input', function () {
    const isEmpty = this.value === '';

    if (isEmpty) {
        usernameSignupField.style.border = '1px solid red';
        errorUsernameSignup.innerHTML = 'Please enter your Username';
        iconCheckUsernameSignup.style.display = 'none';
        iconErrorUsernameSignup.style.display = 'block';
    } else if (this.value.length > 25) {
        usernameSignupField.style.border = '1px solid red';
        errorUsernameSignup.innerHTML = 'Please enter username less than 25 characters';
        iconCheckUsernameSignup.style.display = 'block';
        iconErrorUsernameSignup.style.display = 'none';
    } else {
        usernameSignupField.style.border = '1px solid green';
        errorUsernameSignup.innerHTML = '';
        iconCheckUsernameSignup.style.display = 'block';
        iconErrorUsernameSignup.style.display = 'none';
    }
});

//Event cho ô nhập email của sign up
emailSignupInput.addEventListener('input', function () {
    const isEmpty = this.value === '';

    if (isEmpty) {
        emailSignupField.style.border = '1px solid red';
        errorEmailSignup.innerHTML = 'Please enter your Email';
        iconCheckEmailSignup.style.display = 'none';
        iconErrorEmailSignup.style.display = 'block';
    } else if (!validateEmail(this.value)) {
        emailSignupField.style.border = '1px solid red';
        errorEmailSignup.innerHTML = 'Wrong email format';
        iconCheckEmailSignup.style.display = 'none';
        iconErrorEmailSignup.style.display = 'block';
    } else {
        emailSignupField.style.border = '1px solid green';
        errorEmailSignup.innerHTML = '';
        iconCheckEmailSignup.style.display = 'block';
        iconErrorEmailSignup.style.display = 'none';
    }
});

//Event cho ô nhập password của sign up
passwordSignupInput.addEventListener('input', function () {
    const isEmpty = this.value === '';

    if (isEmpty) {
        passwordSignupField.style.border = '1px solid red';
        errorPasswordSignup.innerHTML = 'Please enter your Password!';
        iconCheckPasswordSignup.style.display = 'none';
        iconErrorPasswordSignup.style.display = 'block';
    } else if (this.value.length < 8) {
        passwordSignupField.style.border = '1px solid red';
        errorPasswordSignup.innerHTML = 'Your password must be at least 8 characters!';
        iconCheckPasswordSignup.style.display = 'none';
        iconErrorPasswordSignup.style.display = 'block';
    } else if (this.value.search(/[a-z]/i) < 0) {
        passwordSignupField.style.border = '1px solid red';
        errorPasswordSignup.innerHTML = 'Your password must contain at least one letter!';
        iconCheckPasswordSignup.style.display = 'none';
        iconErrorPasswordSignup.style.display = 'block';
    } else if (this.value.search(/[0-9]/) < 0) {
        passwordSignupField.style.border = '1px solid red';
        errorPasswordSignup.innerHTML = 'Your password must contain at least one digit!';
        iconCheckPasswordSignup.style.display = 'none';
        iconErrorPasswordSignup.style.display = 'block';
    } else {
        passwordSignupField.style.border = '1px solid green';
        errorPasswordSignup.innerHTML = '';
        iconCheckPasswordSignup.style.display = 'block';
        iconErrorPasswordSignup.style.display = 'none';
    }
});

//Event cho ô nhập confirm password của sign up
confirmPasswordInput.addEventListener('input', function () {
    const isEmpty = this.value === '';

    if (isEmpty) {
        confirmPasswordField.style.border = '1px solid red';
        errorConfirmPassword.innerHTML = 'Please enter confirm Password!';
        iconCheckConfirmPassword.style.display = 'none';
        iconErrorConfirmPassword.style.display = 'block';
    } else if (confirmPasswordInput.value !== passwordSignupInput.value) {
        confirmPasswordField.style.border = '1px solid red';
        errorConfirmPassword.innerHTML = 'Password does not match!';
        iconCheckConfirmPassword.style.display = 'none';
        iconErrorConfirmPassword.style.display = 'block';
    } else {
        confirmPasswordField.style.border = '1px solid green';
        errorConfirmPassword.innerHTML = '';
        iconCheckConfirmPassword.style.display = 'block';
        iconErrorConfirmPassword.style.display = 'none';
    }
});

window.addEventListener("load", function () {
    loader.style.display = "none";
});

function preventBack() {
    window.history.forward();
}
setTimeout("preventBack()", 0);
window.onunload = function () {
    null;
};