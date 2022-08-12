document.querySelector('.profile-button').addEventListener('click', event => {
    event.preventDefault();
    let feedback = document.getElementsByClassName('invalid-feedback');
    let value = document.getElementsByClassName('form-control');
    for (let i = 0; i < value.length; i++) {
        if (value[i].value === "") {
            feedback[i].classList.remove('d-none');
            document.querySelector('.profile-button').classList.add('error');
            document.querySelector('.profile-button').classList.remove('success');
        } else {
            feedback[i].classList.add('d-none');
            document.querySelector('.profile-button').classList.remove('error');
            document.querySelector('.profile-button').classList.add('success');
        }
    }
});

var animateButton = function (e) {

    e.preventDefault;
    if (document.querySelector('.profile-button').classList.contains('error')) {

        e.target.classList.remove('animate');

        e.target.classList.add('animate-error');

        e.target.classList.add('animate-error');
        setTimeout(function () {
            e.target.classList.remove('animate-error');
        }, 2000);
    } else {
        e.target.classList.remove('animate-error');

        e.target.classList.add('animate');

        e.target.classList.add('animate');
        setTimeout(function () {
            e.target.classList.remove('animate');
        }, 5000);
        setTimeout(() => {
            document.getElementById("formProfile").submit();
        }, 5500);
    }
};

var classname = document.getElementsByClassName("button");

for (var f = 0; f < classname.length; f++) {
    classname[f].addEventListener('click', animateButton, false);
}