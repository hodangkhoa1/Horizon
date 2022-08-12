const totalMoney = 0;

function buttonAdd(className) {
    let value = parseInt(document.querySelector(className).value);
    document.querySelector(className).value = value + 1;
}

function buttonMinus(className) {
    let value = parseInt(document.querySelector(className).value);
    document.querySelector(className).value = value - 1;
    if (parseInt(document.querySelector(className).value) <= 0) {
        document.querySelector(className).value = 1;
    }
}

document.querySelectorAll('.button').forEach(button => button.addEventListener('click', e => {
        e.preventDefault();
        if (!button.classList.contains('delete')) {

            button.classList.add('delete');

            setTimeout(() => button.classList.remove('delete'), 2200);
            setTimeout(() => {
                document.getElementById("formDelete").submit();
            }, 2500);

        }
    }));

function blurHandler(className) {
    let value = parseInt(document.querySelector(className).value);
    if (value <= 0) {
        document.querySelector(className).value = 1;
    } else {
        document.querySelector(className).value = value;
    }
}

function theNumberOfProducts() {
    var amont = [], price = [], total = [];

    document.querySelectorAll(".number").forEach((item) => {
        amont.push(Number(item.value));
    });

    document.querySelectorAll("#price").forEach((item) => {
        const removeComma = item.innerText.replace(/,/g, '');
        price.push(Number(removeComma.split(" VNĐ")[0]));
    });

    for (let i = 0; i < amont.length; i++) {
        for (let j = 0; j < price.length; j++) {
            if (i === j) {
                total.push(amont[i] * price[i]);
            }
        }
    }

    var formatter = new Intl.NumberFormat('vi', {
        style: 'currency',
        currency: 'VND'
    });

    for (let i = 0; i < total.length; i++) {
        document.querySelectorAll("#totalPrice").forEach((item) => {
            const replaceString = formatter.format(total[i]).replace(/\./g, ",");
            item.innerHTML = replaceString.replace("₫", "VNĐ");
            i++;
        });
    }

    var payment = 0;
    for (let i = 0; i < total.length; i++) {
        payment += Number(total[i]);
    }
    totalMoney = payment;
    const totalPaymentString = formatter.format(payment).replace(/\./g, ",");
    document.getElementById("totalPayment").innerHTML = totalPaymentString.replace("₫", "VNĐ");
}

function changePayment(urlServlet) {
    window.location.href = `${urlServlet}/payment?total=${totalMoney}`;
}