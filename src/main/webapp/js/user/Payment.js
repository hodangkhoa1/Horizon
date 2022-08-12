document.querySelector('#payincash').addEventListener('focus', event => {
    event.preventDefault();
    let disabled = document.getElementsByClassName('online-payment');
    for (let i = 0; i < disabled.length; i++) {
        disabled[i].classList.add('d-none');
    }
    if (document.getElementById('cc-name').value === "") {
        if (!document.querySelector('.online-payment').classList.contains('d-none')) {
            document.querySelector('.cc-name').classList.remove('d-none');
        } else {
            document.querySelector('.cc-name').classList.add('d-none');
        }
    } else {
        document.querySelector('.cc-name').classList.add('d-none');
    }
    if (document.getElementById('cc-number').value === "") {
        if (!document.querySelector('.online-payment').classList.contains('d-none')) {
            document.querySelector('.cc-number').classList.remove('d-none');
        } else {
            document.querySelector('.cc-number').classList.add('d-none');
        }
    } else {
        document.querySelector('.cc-number').classList.add('d-none');
    }
    if (document.getElementById('cc-expiration').value === "") {
        if (!document.querySelector('.online-payment').classList.contains('d-none')) {
            document.querySelector('.cc-expiration').classList.remove('d-none');
        } else {
            document.querySelector('.cc-expiration').classList.add('d-none');
        }
    } else {
        document.querySelector('.cc-expiration').classList.add('d-none');
    }
    if (document.getElementById('cc-cvv').value === "") {
        if (!document.querySelector('.online-payment').classList.contains('d-none')) {
            document.querySelector('.cc-cvv').classList.remove('d-none');
        } else {
            document.querySelector('.cc-cvv').classList.add('d-none');
        }
    } else {
        document.querySelector('.cc-cvv').classList.add('d-none');
    }
});

document.querySelector('#paypal').addEventListener('focus', event => {
    event.preventDefault();
    let disabled = document.getElementsByClassName('online-payment');
    for (let i = 0; i < disabled.length; i++) {
        disabled[i].classList.add('d-none');
    }
    if (document.getElementById('cc-name').value === "") {
        if (!document.querySelector('.online-payment').classList.contains('d-none')) {
            document.querySelector('.cc-name').classList.remove('d-none');
        } else {
            document.querySelector('.cc-name').classList.add('d-none');
        }
    } else {
        document.querySelector('.cc-name').classList.add('d-none');
    }
    if (document.getElementById('cc-number').value === "") {
        if (!document.querySelector('.online-payment').classList.contains('d-none')) {
            document.querySelector('.cc-number').classList.remove('d-none');
        } else {
            document.querySelector('.cc-number').classList.add('d-none');
        }
    } else {
        document.querySelector('.cc-number').classList.add('d-none');
    }
    if (document.getElementById('cc-expiration').value === "") {
        if (!document.querySelector('.online-payment').classList.contains('d-none')) {
            document.querySelector('.cc-expiration').classList.remove('d-none');
        } else {
            document.querySelector('.cc-expiration').classList.add('d-none');
        }
    } else {
        document.querySelector('.cc-expiration').classList.add('d-none');
    }
    if (document.getElementById('cc-cvv').value === "") {
        if (!document.querySelector('.online-payment').classList.contains('d-none')) {
            document.querySelector('.cc-cvv').classList.remove('d-none');
        } else {
            document.querySelector('.cc-cvv').classList.add('d-none');
        }
    } else {
        document.querySelector('.cc-cvv').classList.add('d-none');
    }
});

document.querySelector('#debit').addEventListener('focus', event => {
    event.preventDefault();
    var enable = document.getElementsByClassName('online-payment');
    for (let i = 0; i < enable.length; i++) {
        enable[i].classList.remove('d-none');
        event.target.checked = true;
    }
});

document.querySelectorAll('.truck-button').forEach(button => {
    button.addEventListener('click', e => {

        e.preventDefault();

        if (document.getElementById('firstName').value === "") {
            document.querySelector('.first-name').classList.remove('d-none');
        } else {
            document.querySelector('.first-name').classList.add('d-none');
        }
        if (document.getElementById('lastName').value === "") {
            document.querySelector('.last-name').classList.remove('d-none');
        } else {
            document.querySelector('.last-name').classList.add('d-none');
        }
        if (document.getElementById('address').value === "") {
            document.querySelector('.address').classList.remove('d-none');
        } else {
            document.querySelector('.address').classList.add('d-none');
        }
        if (document.getElementById('country').value === "") {
            document.querySelector('.country').classList.remove('d-none');
        } else {
            document.querySelector('.country').classList.add('d-none');
        }
        if (document.getElementById('state').value === "") {
            document.querySelector('.state').classList.remove('d-none');
        } else {
            document.querySelector('.state').classList.add('d-none');
        }
        if (document.getElementById('zip').value === "") {
            document.querySelector('.zip').classList.remove('d-none');
        } else {
            document.querySelector('.zip').classList.add('d-none');
        }
        if (document.getElementById('cc-name').value === "") {
            if (!document.querySelector('.online-payment').classList.contains('d-none')) {
                document.querySelector('.cc-name').classList.remove('d-none');
            }
        } else {
            document.querySelector('.cc-name').classList.add('d-none');
        }
        if (document.getElementById('cc-number').value === "") {
            if (!document.querySelector('.online-payment').classList.contains('d-none')) {
                document.querySelector('.cc-number').classList.remove('d-none');
            }
        } else {
            document.querySelector('.cc-number').classList.add('d-none');
        }
        if (document.getElementById('cc-expiration').value === "") {
            if (!document.querySelector('.online-payment').classList.contains('d-none')) {
                document.querySelector('.cc-expiration').classList.remove('d-none');
            }
        } else {
            document.querySelector('.cc-expiration').classList.add('d-none');
        }
        if (document.getElementById('cc-cvv').value === "") {
            if (!document.querySelector('.online-payment').classList.contains('d-none')) {
                document.querySelector('.cc-cvv').classList.remove('d-none');
            }
        } else {
            document.querySelector('.cc-cvv').classList.add('d-none');
        }

        let validication = document.getElementsByClassName('invalid-feedback');
        let count = 0;
        let f = false;
        for (let i = 0; i < validication.length; i++) {
            if (validication[i].classList.contains('d-none')) {
                count++;
            }
        }

        if (count === validication.length) {
            f = true;
        } else {
            f = false;
        }

        console.log(f);

        let box = button.querySelector('.box'),
                truck = button.querySelector('.truck');

        if (!button.classList.contains('done') && f === true) {

            if (!button.classList.contains('animation')) {

                button.classList.add('animation');

                gsap.to(button, {
                    '--box-s': 1,
                    '--box-o': 1,
                    duration: .3,
                    delay: .5
                });

                gsap.to(box, {
                    x: 0,
                    duration: .4,
                    delay: .7
                });

                gsap.to(button, {
                    '--hx': -5,
                    '--bx': 50,
                    duration: .18,
                    delay: .92
                });

                gsap.to(box, {
                    y: 0,
                    duration: .1,
                    delay: 1.15
                });

                gsap.set(button, {
                    '--truck-y': 0,
                    '--truck-y-n': -26
                });

                gsap.to(button, {
                    '--truck-y': 1,
                    '--truck-y-n': -25,
                    duration: .2,
                    delay: 1.25,
                    onComplete() {
                        gsap.timeline({
                            onComplete() {
                                button.classList.add('done');
                            }
                        }).to(truck, {
                            x: 0,
                            duration: .4
                        }).to(truck, {
                            x: 240,
                            duration: 1
                        }).to(truck, {
                            x: 220,
                            duration: .6
                        }).to(truck, {
                            x: 530,
                            duration: .6
                        });
                        gsap.to(button, {
                            '--progress': 1,
                            duration: 2.4,
                            ease: "power2.in"
                        });
                    }
                });

            }

        } else {
            button.classList.remove('animation', 'done');
            gsap.set(truck, {
                x: 4
            });
            gsap.set(button, {
                '--progress': 0,
                '--hx': 0,
                '--bx': 0,
                '--box-s': .5,
                '--box-o': 0,
                '--truck-y': 0,
                '--truck-y-n': -26
            });
            gsap.set(box, {
                x: -24,
                y: -6
            });
        }
        setTimeout(() => {
            document.getElementById("paymentForm").submit();
        }, 6500);
    });
});

//Xử Lý API Tỉnh thành quận huyện
var districts = document.getElementById("district");
var wards = document.getElementById("ward");

function loadCityJson(currentUrl) {
    const cityList = document.getElementById("city");
    let dataCity = new Request(currentUrl + "/data/City.json");

    fetch(dataCity).then(function (resp) {
        return resp.json();
    }).then(function (data) {
        data.forEach(dataJson => cityList.innerHTML += `<option value="${dataJson.name}">${dataJson.name}</option>`);
    });
}