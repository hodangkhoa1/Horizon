// Initialize Swiper
var swiper = new Swiper(".mySwiper", {
    speed: 2000,
    parallax: true,
    autoplay: {
        delay: 2500,
        disableOnInteraction: false
    },
    pagination: {
        el: ".swiper-pagination",
        clickable: true
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
    }
});

// Initialize SLICK
$('.filtering').slick({
    slidesToShow: 4,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
    speed: 3000,
    dots: true,
    mobileFirst: true,
    responsive: [
        {
            breakpoint: 1020,
            settings: {
                slidesToShow: 4
            }
        },
        {
            breakpoint: 830,
            settings: {
                slidesToShow: 2,
                dots: false
            }
        },
        {
            breakpoint: 750,
            settings: {
                slidesToShow: 2,
                dots: false
            }
        },
        {
            breakpoint: 576,
            settings: {
                slidesToShow: 1,
                dots: false
            }
        },
        {
            breakpoint: 480,
            settings: {
                slidesToShow: 1,
                dots: false
            }
        },

        {
            breakpoint: 412,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
                dots: false
            }
        },
        {
            breakpoint: 350,
            settings: {
                slidesToShow: 1,
                dots: false
            }
        }
    ]
});



var filtered = false;

$('.js-filter').on('click', function () {
    if (filtered === false) {
        $('.filtering').slick('slickFilter', ':even');
        $(this).text('Unfilter Slides');
        filtered = true;
    } else {
        $('.filtering').slick('slickUnfilter');
        $(this).text('Filter Slides');
        filtered = false;
    }
});

// SLICK PROMOTION
$('.center').slick({
    centerMode: true,
    centerPadding: '60px',
    slidesToShow: 3,
    autoplay: true,
    autoplaySpeed: 1000,
    speed: 1000,
    dots: true,
    arrows: false,
    responsive: [
        {
            breakpoint: 768,
            settings: {
                arrows: false,
                centerMode: true,
                centerPadding: '40px',
                slidesToShow: 3
            }
        },
        {
            breakpoint: 480,
            settings: {
                arrows: false,
                centerMode: true,
                centerPadding: '40px',
                slidesToShow: 1
            }
        }
    ]
});

function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();