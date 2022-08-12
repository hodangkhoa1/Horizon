PrintCopyRight();

function PrintCopyRight() {
    console.log("%cHello! \ud83d\ude4b", "color: #29c4a9;font-size: 16px;font-weight: 600;"),
            console.log("%cHorizon front-end was built with HTML, CSS, and lots of love. \n\nHorizon back-end was built with SQL Server, and lots of love. \n\n\ud83d\udc49 Want to learn with us? Check out ".concat(window.location.origin, "/Horizon/home"), "color: #29c4a9;font-size: 14px;");
}

function activeSidebarLink() {
    const sidebarLink = document.querySelectorAll(".sidebar-link");
    sidebarLink.forEach((item) => {
        item.classList.remove("active");
    });
    sidebarLink.forEach((item) => {
        if (item.getAttribute("href") === window.location.pathname) {
            item.classList.add("active");
        }
    });
}

$('.setting-btn').click(function () {
    $('.sidebar .setting-show').toggleClass("show");
    $('.sidebar .setting').toggleClass("rotate");
});

function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
}

function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}