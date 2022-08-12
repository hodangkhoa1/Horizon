<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Us ${sessionScope.LOGIN_USER != null ? "| ".concat(sessionScope.LOGIN_USER.userName) : ""}</title>
        <!-- ICON ON WEB BAR -->
        <link rel="icon" type="image/png" sizes="200x138" href="./images/iconHorizon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.lineicons.com/3.0/lineicons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- UN ICONS -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <!-- CSS -->
        <link href="./css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/contact.css">
        <link href="./css/ScrollBackToTop.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/NavBar.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/Contact.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FooterPage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../../layouts/ScrollBackToTop.html"></jsp:include>
        <jsp:include page="../../layouts/user/NavBar.jsp"></jsp:include>
            <section class="contact_body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="contact-us section">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-6 offset-lg-3">
                                            <div class="section-heading">
                                                <h6>Contact Us</h6>
                                                <h4>Get In Touch With Us <em>Now</em></h4>
                                                <div class="line-dec"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <form action="https://formspree.io/f/mgedaope" method="post" id="contact">
                                                <div class="row">
                                                    <div class="col-lg-12 d-none d-lg-block">
                                                        <div class="contact-dec">
                                                            <img src="./images/contact-dec.png" alt="">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-5">
                                                        <div id="map">
                                                            <iframe
                                                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6052656125307!2d106.80785771534771!3d10.84148986095256!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1635469937260!5m2!1svi!2s"
                                                                width="100%" height="571" style="border:0;"
                                                                allowfullscreen="" loading="lazy"></iframe>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-7">
                                                        <div class="fill-form">
                                                            <div class="row">
                                                                <div class="col-lg-4">
                                                                    <div class="info-post">
                                                                        <div class="icon">
                                                                            <img src="./images/undraw_chatting_re_j55r.svg"
                                                                                 alt="">
                                                                            <span>028 7300 1866</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div class="info-post">
                                                                        <div class="icon">
                                                                            <img src="./images/undraw_confidential_letter_w6ux.svg"
                                                                                 alt="">
                                                                            <span>khoahdse150849@fpt.edu.vn</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <div class="info-post">
                                                                        <div class="icon">
                                                                            <img src="./images/undraw_my_location_re_r52x.svg"
                                                                                 alt="">
                                                                            <span>Trường Đại học FPT</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <fieldset>
                                                                        <input type="text" name="Name" id="name" placeholder="Name" autocomplete="on" value="${sessionScope.LOGIN_USER.userName}">
                                                                    </fieldset>
                                                                    <fieldset>
                                                                        <input type="text" name="Email" id="email" placeholder="Your email" value="${sessionScope.LOGIN_USER.email}">
                                                                    </fieldset>
                                                                    <fieldset>
                                                                        <input type="text" name="Subject" id="subject" placeholder="Subject">
                                                                    </fieldset>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <fieldset>
                                                                        <textarea type="text" name="Message"
                                                                                  class="form-control" id="message"
                                                                                  placeholder="Message"></textarea>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <fieldset>
                                                                        <button type="submit" id="form-submit"
                                                                                class="main-button">Send Message Now</button>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        <jsp:include page="../../layouts/user/FooterPage.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
        <!-- Root Page -->
        <script src="./js/user/UserRoot.js"></script>
        <!-- Scroll Back To Top -->
        <script src="./js/ScrollBackToTop.js"></script>
        <script type="text/javascript">
            setActiveMenuBar();
        </script>
    </body>
</html>
