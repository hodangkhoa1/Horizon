let value = null;
let count;
let countnull;

document.querySelector('.password-button').addEventListener('click', event => {
    event.preventDefault();
    let feedback = document.getElementsByClassName('invalid-feedback');
    value = document.getElementsByClassName('form-control');
    count = 0;
    countnull = 0;
    for (let i = 0; i < value.length; i++) {
        if (value[i].value != "") {
            feedback[i].classList.add('d-none');
            count++;
        } else {
            countnull++;
            feedback[i].classList.remove('d-none');
        }
    }
    if (count == value.length) {
        document.querySelector('.password-button').classList.remove('error');
        document.querySelector('.password-button').classList.add('success');
    } else {
        document.querySelector('.password-button').classList.add('error');
        document.querySelector('.password-button').classList.remove('success');
    }
    let unmatch = document.getElementsByClassName('new-password');
    let correct = 0;
    for (let i = 0; i < unmatch.length - 1; i++) {
        for (let j = i + 1; j < unmatch.length; j++) {
            if (document.querySelector('#current-password').value != "" && unmatch[i].value != "" || unmatch[j].value != "" && unmatch[i].value != unmatch[j].value) {
                correct = 0;
//                document.querySelector('.unmatch-password').classList.remove('d-none');
                document.querySelector('.password-button').classList.add('error');
                document.querySelector('.password-button').classList.remove('success');
            } else {
                correct = 1;
                document.querySelector('.unmatch-password').classList.add('d-none');
            }
        }
    }
});

var animateButton = function (event) {

    event.preventDefault();
    if (document.querySelector('.password-button').classList.contains('error')) {

        event.target.classList.remove('animate');

        event.target.classList.add('animate-error');

        event.target.classList.add('animate-error');

        document.querySelector('#position').classList.add('position');

        if (countnull === 3) {
            document.querySelector('.login-form').classList.add('password-size');
            document.querySelector('.login-form').classList.remove('password-size-1');
            document.querySelector('.login-form').classList.remove('password-size-2');
            document.querySelector('.login-form').classList.remove('password-size-3');
        } else if (countnull === 2) {
            document.querySelector('.login-form').classList.remove('password-size');
            document.querySelector('.login-form').classList.add('password-size-1');
            document.querySelector('.login-form').classList.remove('password-size-2');
            document.querySelector('.login-form').classList.remove('password-size-3');
        } else if (countnull === 1 || document.querySelector('#current-password'.value !== "")) {
            if (!document.querySelector('.unmatch-password').classList.contains('d-none')) {
                document.querySelector('.login-form').classList.remove('password-size');
                document.querySelector('.login-form').classList.remove('password-size-1');
                document.querySelector('.login-form').classList.add('password-size-2');
                document.querySelector('.login-form').classList.remove('password-size-3');
            } else {
                document.querySelector('.login-form').classList.remove('password-size');
                document.querySelector('.login-form').classList.add('password-size-1');
                document.querySelector('.login-form').classList.remove('password-size-2');
                document.querySelector('.login-form').classList.remove('password-size-3');
            }
        } else {
            document.querySelector('.login-form').classList.remove('password-size');
            document.querySelector('.login-form').classList.remove('password-size-1');
            document.querySelector('.login-form').classList.remove('password-size-2');
            document.querySelector('.login-form').classList.remove('password-size-3');
        }

        setTimeout(function () {
            document.querySelector('#position').classList.remove('position');
            event.target.classList.remove('animate-error');
        }, 2000);
        
    } else {
        event.target.classList.remove('animate-error');

        event.target.classList.add('animate');

        event.target.classList.add('animate');
        setTimeout(function () {
            event.target.classList.remove('animate');
        }, 5000);
        setTimeout(() => {
            document.getElementById("formChangePassword").submit();
        }, 5500);
    }
};

var classname = document.getElementsByClassName("button");

for (var f = 0; f < classname.length; f++) {
    classname[f].addEventListener('click', animateButton, false);
}

//document.querySelector('.close-unmatch').addEventListener('click', event => {
//    event.preventDefault();
//    document.querySelector('.login-form').classList.remove('password-size');
//    document.querySelector('.login-form').classList.remove('password-size-1');
//    document.querySelector('.login-form').classList.remove('password-size-2');
//    document.querySelector('.login-form').classList.add('password-size-3');
//    document.querySelector('.unmatch-password').classList.add('d-none');
//});