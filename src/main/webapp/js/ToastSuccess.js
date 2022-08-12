function ToastSuccess() {
    const toast = document.querySelector(".toast-success"),
            progress = document.querySelector(".success-progress");

    toast.classList.add("active");
    progress.classList.add("active");

    setTimeout(() => {
        toast.classList.remove("active");
    }, 5000);

    setTimeout(() => {
        progress.classList.remove("active");
    }, 5300);
}

function CloseToastSuccess() {
    const toast = document.querySelector(".toast-success"),
            progress = document.querySelector(".success-progress");

    toast.classList.remove("active");

    setTimeout(() => {
        progress.classList.remove("active");
    }, 300);
}