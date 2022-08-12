function disableButtonUser(urlServlet, userId, actionButton) {
    $.ajax({
        url: urlServlet,
        type: "get",
        data: {
            userID: userId,
            action: actionButton
        },
        success: function (data) {
            const tableAccountBody = document.querySelector("#table-account-body");
            tableAccountBody.innerHTML = data;
        }
    });
}