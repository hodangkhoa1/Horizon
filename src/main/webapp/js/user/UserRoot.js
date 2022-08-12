PrintCopyRight();

function PrintCopyRight() {
    console.log("%cHello! \ud83d\ude4b", "color: #29c4a9;font-size: 16px;font-weight: 600;"),
            console.log("%cHorizon front-end was built with HTML, CSS, and lots of love. \n\nHorizon back-end was built with SQL Server, and lots of love. \n\n\ud83d\udc49 Want to learn with us? Check out ".concat(window.location.origin, "/Horizon/home"), "color: #29c4a9;font-size: 14px;");
}

//Set active cho menu bar
function setActiveMenuBar() {
    const navLink = document.querySelectorAll(".nav-link");
    document.querySelectorAll(".nav-item").forEach((item) => {
        item.classList.remove("active");
    });
    navLink.forEach((item) => {
        if (item.getAttribute("href") === window.location.pathname) {
            item.parentElement.classList.add("active");
        }
    });
}

function menuToggle() {
    const toggleMenu = document.querySelector('.menu');
    toggleMenu.classList.toggle('active');
}