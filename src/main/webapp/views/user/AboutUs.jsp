<%-- 
    Document   : AboutUs
    Created on : Mar 22, 2022, 2:47:32 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us ${sessionScope.LOGIN_USER != null ? "| ".concat(sessionScope.LOGIN_USER.userName) : ""}</title>
        <!-- BOOTSTRAP 5 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <!-- UN ICONS -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <!-- ICON ON WEB BAR -->
        <link rel="icon" type="image/png" sizes="200x138" href="./images/iconHorizon.png">
        <!-- CSS -->
        <link href="./css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href="./css/ScrollBackToTop.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/NavBar.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/AboutUs.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FooterPage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../../layouts/ScrollBackToTop.html"></jsp:include>
        <jsp:include page="../../layouts/user/NavBar.jsp"></jsp:include>
        <section class="about-us">
            <div class="animated">
              <div class="bird-title">
                <h1>HORIZON TEAM</h1>
              </div>

              <div class="bird-container bird-container--one">
                <div class="bird bird--one"></div>
              </div>

              <div class="bird-container bird-container--two">
                <div class="bird bird--two"></div>
              </div>

              <div class="bird-container bird-container--three">
                <div class="bird bird--three"></div>
              </div>

              <div class="bird-container bird-container--four">
                <div class="bird bird--four"></div>
              </div>

            </div>

            <div class="aboutUs"
              style="background-image: url(./images/bg15.png); background-repeat: no-repeat; background-size: contain; background-position: center right;">
              <div class="container">
                <div class="row">
                  <div class="col-lg-6 aboutUs__img">
                    <img src="./images/pic1.jpg" class="aboutUs__img-overflow" alt="">
                  </div>

                  <div class="col-lg-6 aboutUs__content ms-2 ms-md-0">
                    <div class="aboutUs--title">
                      <h6>About Us</h6>
                      <h2>Build Horizon Website Better</h2>
                      <p>Proin laoreet leo vel enim gravida, at porttitor metus ultricies. Cras eu velit enim. Vivamus
                        blandit, dolor ut aliquet rutrum, ex elit mattis sapien, non molestie felis neque et nulla.
                        Sed euismod turpis id nibh suscipit semper. Pellentesque dapibus risus arcu.</p>
                    </div>
                    <ul class="list--check">
                      <div class="list">
                        <i class="far fa-check-circle"></i>
                        <li>We support programs that create advancement opportunities for people.</li>
                      </div>
                      <div class="list">
                        <i class="far fa-check-circle"></i>
                        <li>Get a view of events and trends. Be updated on our recent news.</li>
                      </div>
                      <div class="list">
                        <i class="far fa-check-circle"></i>
                        <li>Finally, it all comes down to people. Creating a winning team.</li>
                      </div>
                      <div class="list">
                        <i class="far fa-check-circle"></i>
                        <li>Get a view of events and trends. Be updated on our recent news.</li>
                      </div>
                    </ul>

                    <button class="gradient-btn mr-20 d-none d-md-block">LEARN MORE</button>
                  </div>
                </div>
              </div>
            </div>

            <div
            style="background-image: url(./images/bg4.png); background-repeat: no-repeat; background-size: contain; background-position: center right;">
              <div class="container">
                <div class="row pt-5 pb-5 d-flex justify-content-center align-items-center">
                  <div class="members col-12 col-lg-6 col-xl-4 pb-5 d-flex justify-content-center align-items-center">
                    <div class="profile">
                      <div class="mask-shadow" =""></div>
                      <div class="card">
                        <div class="card-body cart-content">
                          <div class="content-top">
                            <div class="title">
                              <h3 class="card-title">Hồ Đăng Khoa</h3>
                            </div>
                            <h6>Leader</h6>
                            <p class="card-text">
                              "Chưa có ai có thể viết được một phần mềm hoàn hảo, bạn cũng vậy."
                            </p>
                          </div>

                          <div class="social">
                            <ul class="profile-social-links">
                              <li>
                                <a onClick="javascript:window.open('mailto:khoahdse150849@fpt.edu.vn', 'my-window');event.preventDefault()"
                                  href="mailto:khoahdse150849@fpt.edu.vn">
                                  <img src="./images/gmail.png" />
                                </a>
                              </li>

                              <li>
                                <a href="https://twitter.com/tutsplus">
                                  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/social-twitter.svg" />
                                </a>
                              </li>

                              <li>
                                <a href="https://www.facebook.com/HK1107">
                                  <i class="fab fa-facebook"></i>
                                </a>
                              </li>
                            </ul>
                          </div>

                        </div>
                      </div>
                      <div class="img-top">
                        <div class="img-team">
                          <img src="./images/khoa.jpg" class="card-img-top" alt="Hồ Đăng Khoa" />
                        </div>
                      </div>

                    </div>

                  </div>

                  <div class="members col-12 col-lg-6 col-xl-4 pb-5 d-flex justify-content-center align-items-center">
                    <div class="profile">
                      <div class="mask-shadow" =""></div>
                      <div class="card">
                        <div class="card-body cart-content">
                          <div class="content-top">
                            <div class="title">
                              <h3 class="card-title">Nguyễn Cao Ngọc Ngân</h3>
                            </div>
                            <h6>WEB DESIGNER</h6>
                            <p class="card-text">
                              "Cuộc sống không bao giờ ngược đãi ta nếu ta sống thiện, làm việc thiện. Và luật nhân quả sẽ đến
                              với
                              ta."
                            </p>
                          </div>

                          <div class="social">
                            <ul class="profile-social-links">
                              <li>
                                <a onClick="javascript:window.open('mailto:nganncnse150413@fpt.edu.vn', 'my-window');event.preventDefault()"
                                  href="mailto:nganncnse150413@fpt.edu.vn">
                                  <img src="./images/gmail.png" />
                                </a>
                              </li>

                              <li>
                                <a href="https://twitter.com/tutsplus">
                                  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/social-twitter.svg" />
                                </a>
                              </li>

                              <li>
                                <a href="https://www.facebook.com/profile.php?id=100063891461203">
                                  <i class="fab fa-facebook"></i>
                                </a>
                              </li>
                            </ul>
                          </div>

                        </div>
                      </div>
                      <div class="img-top">
                        <div class="img-team">
                          <img src="./images/ngan.jpg" class="card-img-top" alt="Nguyễn Cao Ngọc Ngân" />
                        </div>
                      </div>

                    </div>

                  </div>

                  <div class="members col-12 col-lg-6 col-xl-4 pb-5 d-flex justify-content-center align-items-center">
                    <div class="profile">
                      <div class="mask-shadow" =""></div>
                      <div class="card">
                        <div class="card-body cart-content">
                          <div class="content-top">
                            <div class="title">
                              <h3 class="card-title">Lê Thành Lân</h3>
                            </div>
                            <h6>WEB DESIGNER</h6>
                            <p class="card-text">
                              "Appreciate what we have. Because once we lose it, it is not certain that we can get it back."
                            </p>
                          </div>

                          <div class="social">
                            <ul class="profile-social-links">
                              <li>
                                <a onClick="javascript:window.open('mailto:lanltse150360@fpt.edu.vn', 'my-window');event.preventDefault()"
                                  href="mailto:lanltse150360@fpt.edu.vn">
                                  <img src="./images/gmail.png" />
                                </a>
                              </li>

                              <li>
                                <a href="https://twitter.com/tutsplus">
                                  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/social-twitter.svg" />
                                </a>
                              </li>

                              <li>
                                <a href="https://www.facebook.com/ThanhLanFPTU/">
                                  <i class="fab fa-facebook"></i>
                                </a>
                              </li>
                            </ul>
                          </div>

                        </div>
                      </div>
                      <div class="img-top">
                        <div class="img-team">
                          <img src="./images/lan.png" class="card-img-top" alt="Lê Thành Lân" />
                        </div>
                      </div>

                    </div>

                  </div>

                  <div class="members col-12 col-lg-6 col-xl-4 pb-5 d-flex justify-content-center align-items-center">
                    <div class="profile">
                      <div class="mask-shadow" =""></div>
                      <div class="card">
                        <div class="card-body cart-content">
                          <div class="content-top">
                            <div class="title">
                              <h3 class="card-title">Phạm Ngọc Long</h3>
                            </div>
                            <h6>WEB DESIGNER</h6>
                            <p class="card-text">
                              "The best or nothing!"
                            </p>
                          </div>

                          <div class="social">
                            <ul class="profile-social-links">
                              <li>
                                <a onClick="javascript:window.open('mailto:longpnse150888@fpt.edu.vn', 'my-window');event.preventDefault()"
                                  href="mailto:longpnse150888@fpt.edu.vn">
                                  <img src="./images/gmail.png" />
                                </a>
                              </li>

                              <li>
                                <a href="https://twitter.com/tutsplus">
                                  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/social-twitter.svg" />
                                </a>
                              </li>

                              <li>
                                <a href="https://www.facebook.com/phamlong.19/">
                                  <i class="fab fa-facebook"></i>
                                </a>
                              </li>
                            </ul>
                          </div>

                        </div>
                      </div>
                      <div class="img-top">
                        <div class="img-team">
                          <img src="./images/long.jpg" class="card-img-top" alt="Phạm Ngọc Long" />
                        </div>
                      </div>
                      </a>
                    </div>

                  </div>

                  <div class="members col-12 col-lg-6 col-xl-4 pb-5 d-flex justify-content-center align-items-center">
                    <div class="profile">
                      <div class="mask-shadow" =""></div>
                      <div class="card">
                        <div class="card-body cart-content">
                          <div class="content-top">
                            <div class="title">
                              <h3 class="card-title">Nguyễn Văn Hải Nam</h3>
                            </div>
                            <h6>information seekers</h6>
                            <p class="card-text">
                              "Think different!"
                            </p>
                          </div>

                          <div class="social">
                            <ul class="profile-social-links">
                              <li>
                                <a onClick="javascript:window.open('mailto:namnvhse150925@fpt.edu.vn', 'my-window');event.preventDefault()"
                                  href="mailto:namnvhse150925@fpt.edu.vn">
                                  <img src="./images/gmail.png" />
                                </a>
                              </li>

                              <li>
                                <a href="https://twitter.com/tutsplus">
                                  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/social-twitter.svg" />
                                </a>
                              </li>

                              <li>
                                <a href="https://www.facebook.com/hainam1010">
                                  <i class="fab fa-facebook"></i>
                                </a>
                              </li>
                            </ul>
                          </div>

                        </div>
                      </div>
                      <div class="img-top">
                        <div class="img-team">
                          <img src="./images/nam.png" class="card-img-top" alt="Nguyễn Văn Hải Nam" />
                        </div>
                      </div>

                    </div>

                  </div>
                </div>
              </div>
            </div>
        </section>
        <jsp:include page="../../layouts/user/FooterPage.jsp"></jsp:include>
        
        <!-- BOOTSTRAP 5 -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <!-- JQUERY -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Root Page -->
        <script src="./js/user/UserRoot.js"></script>
        <!-- Scroll Back To Top -->
        <script src="./js/ScrollBackToTop.js"></script>
        <script type="text/javascript">
            setActiveMenuBar();
        </script>
    </body>
</html>
