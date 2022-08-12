const questions = document.querySelectorAll('.question');

questions.forEach((question) => question.addEventListener('click', () => {
    if(question.parentNode.classList.contains('active')) {
        question.parentNode.classList.toggle('active');
    } else {
        questions.forEach((question) => question.parentNode.classList.remove('active'));
        question.parentNode.classList.add('active');
    }
}));

function loadFileJson(currentUrl) {
    const questionsAnswer = document.querySelector('.questions__accordions');
    let dataFAQ = new Request(currentUrl + "/data/FAQ.json");

    fetch(dataFAQ).then(function (resp) {
        return resp.json();
    }).then(function (data) {
        data.forEach(dataJson => questionsAnswer.innerHTML += `<div class="questions-answer__accordions">
                                <div class="question">
                                    <h3 class="title__question">${dataJson.title}</h3>
                                    <img src="./images/icon-arrow-down.svg" alt="image">
                                </div>
                                <div class="answer">${dataJson.content}</div>
                            </div>`);
    });
}