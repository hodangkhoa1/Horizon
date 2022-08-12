const viewMore = document.querySelector(".view-more");

function searchByName(valueSearch, urlServlet) {
    const textSearch = valueSearch.value;

    $.ajax({
        url: urlServlet,
        type: "get",
        data: {
            search: textSearch
        },
        success: function (data) {
            const productList = document.querySelector("#product-list");
            productList.innerHTML = data;
            viewMore.style.display = "none";
        }
    });
}

function showLoadMoreButton() {
    viewMore.style.display = "block";
}

function category(categoryId, urlServlet, getID) {

    if (getID.id.match(categoryId)) {
        const categoryButton = document.getElementById(getID.id);
        if (categoryButton.className.match("list-group-item list-group-item-action")) {
            categoryButton.classList.add("active");
        } else {
            categoryButton.classList.remove("active");
        }
    }

    $.ajax({
        url: urlServlet,
        type: "get",
        data: {
            categoryId: categoryId
        },
        success: function (data) {
            const productList = document.querySelector("#product-list");
            productList.innerHTML = data;
            viewMore.style.display = "none";
        }
    });
}

function loadMore(totalCourses, urlServlet) {
    const productAmount = document.querySelectorAll(".product-amount").length;
    viewMore.innerHTML = `
                    <div class="spinner-loader">
                        <div class="spinner-border text-primary" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                        <p class="spinner-title">Please Wait ...</p>
                    </div>
                `;

    $.ajax({
        url: urlServlet,
        type: "get",
        data: {
            productExits: productAmount
        },
        success: function (data) {
            const productList = document.querySelector("#product-list");
            productList.innerHTML += data;
        }
    }).done(() => {
        if (totalCourses <= (productAmount + 9)) {
            viewMore.style.display = "none";
        } else {
            viewMore.innerHTML = `<button onclick="loadMore('${totalCourses}', '${urlServlet}')" class="button-view">Load more</button>`;
        }
    });
}

const showErrorBox = document.querySelector("#error-box");
const bodyTag = document.getElementsByTagName("BODY")[0];

function buttonAddCart(userID, urlServlet) {
    if (userID === "") {
        bodyTag.style.overflowY = 'hidden';
        bodyTag.style.height = '100%';
        showErrorBox.innerHTML = `
            <div class="error-popup">
                <div class="wrapper">
                    <div class="content">
                        <div class="warn-icon">
                            <span><i class="uil uil-exclamation"></i></span>
                        </div>
                        <h2>No Login Detected!</h2>
                        <p>You are not logged in. Please login to use all website functions.</p>
                        <div class="buttons">
                            <button onclick="window.location.href='login';" id="login-btn">Login</button>
                            <button onclick="closeErrorBox()" id="cancel-btn">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        `;
    } else {
        window.location.href = urlServlet;
    }
}

function closeErrorBox() {
    showErrorBox.innerHTML = '';
    bodyTag.style.overflowY = 'scroll';
    bodyTag.style.height = null;
}

const microphoneWrapper = document.querySelector(".microphone-wrapper");
const bodyForMicrophoneBox = document.getElementsByTagName("BODY")[0];
const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
const microphoneHeader = document.querySelector(".microphone-header__prompt");
const microphoneFooterLabel = document.querySelector(".microphone-footer-label");
const microphoneBodyText = document.querySelector(".microphone-body-text");

function activeMicrophone(urlServlet) {
    if (SpeechRecognition !== undefined) {
        let recognition = new SpeechRecognition();

        recognition.onstart = () => {
            microphoneHeader.innerHTML = "Listening...";
            microphoneFooterLabel.innerHTML = "";
            microphoneBodyText.innerHTML = "";
        };

        recognition.onspeechend = () => {
            microphoneHeader.innerHTML = "Microphone is off. Please speak again.";
            microphoneFooterLabel.innerHTML = "Tap the microphone to try again";
            recognition.stop();
        };

        recognition.onresult = (result) => {
            microphoneBodyText.innerHTML = `${result.results[0][0].transcript}`;
            console.log(`${result.results[0][0].transcript}`);

            $.ajax({
                url: urlServlet,
                type: "get",
                data: {
                    search: `${result.results[0][0].transcript}`
                },
                success: function (data) {
                    const productList = document.querySelector("#product-list");
                    productList.innerHTML = data;
                    viewMore.style.display = "none";
                    hideMicrophoneBox();
                }
            });
        };

        recognition.start();
    }
}

function showMicrophoneBox(urlServlet) {
    microphoneWrapper.classList.add('active');
    bodyForMicrophoneBox.style.overflowY = 'hidden';
    activeMicrophone(urlServlet);
}

function hideMicrophoneBox() {
    microphoneWrapper.classList.remove('active');
    bodyForMicrophoneBox.style.overflowY = 'scroll';
}

let navExpand = document.querySelector(".nav__expand");
let nav = document.querySelector(".nav");
let navListItem = document.querySelectorAll(".nav__listitem");

navExpand.addEventListener("click", () => {
    nav.classList.toggle("nav-closed");
});

navListItem.forEach((link) => link.addEventListener("click", listActive));

function listActive() {
    navListItem.forEach((link) => link.classList.remove("nav__listitem-active"));
    this.classList.add("nav__listitem-active");
}