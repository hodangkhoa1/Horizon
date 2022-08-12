function deleteProduct(valueDelete, urlServlet) {
    $.ajax({
        url: urlServlet,
        type: "get",
        data: {
            courseID: valueDelete
        },
        success: function(data) {
            const tableBody = document.querySelector("#table-body");
            tableBody.innerHTML = data;
        }
    });
}