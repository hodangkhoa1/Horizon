function confirmDeleteAccount(urlServlet, userEmail) {
    Swal.fire({
        title: 'Are you sure?',
        text: "Do you want to delete your account?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: urlServlet,
                type: "get",
                data: {
                    userEmail: userEmail
                }
            });
        }
    });
}