<%-- 
    Document   : Support
    Created on : Mar 20, 2022, 2:19:22 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Support ${sessionScope.LOGIN_USER != null ? "| ".concat(sessionScope.LOGIN_USER.userName) : ""}</title>
        <!-- BOOTSTRAP 5 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <!-- UN ICONS -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <!-- ICON ON WEB BAR -->
        <link rel="icon" type="image/png" sizes="200x138" href="./images/iconHorizon.png">
        <!-- FONT GOOGLE -->
        <link href="https://fonts.googleapis.com/css?family=Heebo:300,400" rel="stylesheet">
        <!-- CSS -->
        <link href="./css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href="./css/ScrollBackToTop.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/NavBar.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/Support.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FooterPage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../../layouts/ScrollBackToTop.html"></jsp:include>
        <jsp:include page="../../layouts/user/NavBar.jsp"></jsp:include>
        <div>
            <div class="uk-section section-hero uk-position-relative uk-scrollspy-inview uk-animation-slide-bottom-medium"
                data-uk-scrollspy="cls: uk-animation-slide-bottom-medium; repeat: true">
                <div class="uk-container uk-container-small">
                    <p class="hero-image uk-text-center"><img src="./images/knowledge.svg" alt="Hero"></p>
                    <h1 class="uk-heading-medium uk-text-center uk-margin-remove-top">How can we help you?</h1>
                    <p class="uk-text-lead uk-text-center">Search or browse in depth articles and videos on everything on
                        our awesome
                        product, from basic setup to advanced features and everyday use</p>
                    <div class="hero-search">
                        <div class="uk-position-relative">
                            <form class="uk-search uk-search-default uk-width-1-1" name="search-hero">
                                <span class="uk-search-icon-flip uk-icon uk-search-icon" data-uk-search-icon=""><svg
                                        width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                        data-svg="search-icon">
                                        <circle fill="none" stroke="#000" stroke-width="1.1" cx="9" cy="9" r="7"></circle>
                                        <path fill="none" stroke="#000" stroke-width="1.1" d="M14,14 L18,18 L14,14 Z">
                                        </path>
                                    </svg></span>
                                <div class="awesomplete"><input id="search-hero" class="uk-search-input uk-box-shadow-large"
                                        type="search" placeholder="Search for answers" autocomplete="off" data-minchars="1"
                                        data-maxitems="30" aria-expanded="false" aria-owns="awesomplete_list_1"
                                        role="combobox">
                                    <ul hidden="" role="listbox" id="awesomplete_list_1"></ul><span class="visually-hidden"
                                        role="status" aria-live="assertive" aria-atomic="true">Type 1 or more characters for
                                        results.</span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="uk-section">
            <div class="uk-container">
                <h2 class="uk-h1 uk-text-center">Browse Topics</h2>
                <p class="uk-text-lead uk-text-center">Chose an option that you need help with or search above</p>
                <div class="uk-grid-match uk-text-center uk-margin-medium-top uk-grid" data-uk-grid="">
                    <div class="uk-first-column">
                        <div
                            class="uk-card uk-card-default uk-box-shadow-medium uk-card-hover uk-card-body uk-inline border-radius-large border-xlight">
                            <a class="uk-position-cover" href="doc.html"></a>
                            <span data-uk-icon="icon: cog; ratio: 3.4" class="uk-icon"><svg width="68" height="68"
                                    viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="cog">
                                    <circle fill="none" stroke="#000" cx="9.997" cy="10" r="3.31"></circle>
                                    <path fill="none" stroke="#000"
                                        d="M18.488,12.285 L16.205,16.237 C15.322,15.496 14.185,15.281 13.303,15.791 C12.428,16.289 12.047,17.373 12.246,18.5 L7.735,18.5 C7.938,17.374 7.553,16.299 6.684,15.791 C5.801,15.27 4.655,15.492 3.773,16.237 L1.5,12.285 C2.573,11.871 3.317,10.999 3.317,9.991 C3.305,8.98 2.573,8.121 1.5,7.716 L3.765,3.784 C4.645,4.516 5.794,4.738 6.687,4.232 C7.555,3.722 7.939,2.637 7.735,1.5 L12.263,1.5 C12.072,2.637 12.441,3.71 13.314,4.22 C14.206,4.73 15.343,4.516 16.225,3.794 L18.487,7.714 C17.404,8.117 16.661,8.988 16.67,10.009 C16.672,11.018 17.415,11.88 18.488,12.285 L18.488,12.285 Z">
                                    </path>
                                </svg></span>
                            <h3 class="uk-card-title uk-margin">Getting Started</h3>
                            <p>Get started fast with installation and theme setup instructions</p>
                        </div>
                    </div>
                    <div>
                        <div
                            class="uk-card uk-card-default uk-box-shadow-medium uk-card-hover uk-card-body uk-inline border-radius-large border-xlight">
                            <a class="uk-position-cover" href="doc.html"></a>
                            <span data-uk-icon="icon: settings; ratio: 3.4" class="uk-icon"><svg width="68" height="68"
                                    viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="settings">
                                    <ellipse fill="none" stroke="#000" cx="6.11" cy="3.55" rx="2.11" ry="2.15"></ellipse>
                                    <ellipse fill="none" stroke="#000" cx="6.11" cy="15.55" rx="2.11" ry="2.15"></ellipse>
                                    <circle fill="none" stroke="#000" cx="13.15" cy="9.55" r="2.15"></circle>
                                    <rect x="1" y="3" width="3" height="1"></rect>
                                    <rect x="10" y="3" width="8" height="1"></rect>
                                    <rect x="1" y="9" width="8" height="1"></rect>
                                    <rect x="15" y="9" width="3" height="1"></rect>
                                    <rect x="1" y="15" width="3" height="1"></rect>
                                    <rect x="10" y="15" width="8" height="1"></rect>
                                </svg></span>
                            <h3 class="uk-card-title uk-margin">Product Features</h3>
                            <p>Lean about all the theme options, features and how to use them</p>
                        </div>
                    </div>
                    <div>
                        <div
                            class="uk-card uk-card-default uk-box-shadow-medium uk-card-hover uk-card-body uk-inline border-radius-large border-xlight">
                            <a class="uk-position-cover" href="doc.html"></a>
                            <span data-uk-icon="icon: code; ratio: 3.4" class="uk-icon"><svg width="68" height="68"
                                    viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="code">
                                    <polyline fill="none" stroke="#000" stroke-width="1.01" points="13,4 19,10 13,16">
                                    </polyline>
                                    <polyline fill="none" stroke="#000" stroke-width="1.01" points="7,4 1,10 7,16">
                                    </polyline>
                                </svg></span>
                            <h3 class="uk-card-title uk-margin">Customization</h3>
                            <p>Get help or tailor the theme to your specific requirements</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="uk-section section-featured">
            <div class="uk-container uk-container-small">
                <h2 class="uk-h1 uk-text-center">Popular Articles</h2>
                <p class="uk-text-center uk-text-lead">Selected featured articles to get you started fast</p>
                <ul class="uk-list uk-list-large uk-margin-medium-top">
                    <li><a class="uk-box-shadow-hover-small" href="doc.html">Frequently asked questions about switching to
                            our product</a></li>
                    <li><a class="uk-box-shadow-hover-small" href="doc.html">Adding user media in application profile
                            settings page</a></li>
                    <li><a class="uk-box-shadow-hover-small" href="doc.html">Creating your first piece of content item</a>
                    </li>
                    <li><a class="uk-box-shadow-hover-small" href="doc.html">Setting up video lightbox boxes section and
                            content</a></li>
                </ul>
            </div>
        </div>

        <div class="uk-section section-videos">
            <div class="uk-container uk-container-small">
                <h2 class="uk-h1 uk-text-center">Video Tutorials</h2>
                <p class="uk-text-lead uk-text-center">Watch screencasts to get you started fast with product</p>
                <div class="uk-grid-match uk-text-center uk-margin-medium-top uk-grid" data-uk-grid=""
                    data-uk-lightbox="">
                    <div class="uk-first-column">
                        <div
                            class="uk-card uk-card-default uk-box-shadow-small uk-box-shadow-hover-medium uk-card-body uk-inline border-radius-large border-xlight">
                            <a class="uk-position-cover" href="#"
                                data-caption="Getting Started"></a>
                            <span data-uk-icon="icon: play-circle; ratio: 3.4" class="uk-icon"><svg width="68" height="68"
                                    viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="play-circle">
                                    <polygon fill="none" stroke="#000" stroke-width="1.1" points="8.5 7 13.5 10 8.5 13">
                                    </polygon>
                                    <circle fill="none" stroke="#000" stroke-width="1.1" cx="10" cy="10" r="9"></circle>
                                </svg></span>
                            <h3 class="uk-card-title uk-margin">Getting Started</h3>
                            <p>Word the to embarrassed he homeless assistant</p>
                        </div>
                    </div>
                    <div>
                        <div
                            class="uk-card uk-card-default uk-box-shadow-small uk-box-shadow-hover-medium uk-card-body uk-inline border-radius-large border-xlight">
                            <a class="uk-position-cover" href="#" data-caption="What is Figma"></a>
                            <span data-uk-icon="icon: play-circle; ratio: 3.4" class="uk-icon"><svg width="68" height="68"
                                    viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="play-circle">
                                    <polygon fill="none" stroke="#000" stroke-width="1.1" points="8.5 7 13.5 10 8.5 13">
                                    </polygon>
                                    <circle fill="none" stroke="#000" stroke-width="1.1" cx="10" cy="10" r="9"></circle>
                                </svg></span>
                            <h3 class="uk-card-title uk-margin">What is Figma</h3>
                            <p>Their a least are family question now that pur</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="uk-section">
            <div class="uk-container uk-container-small">
                <h2 class="uk-h1 uk-text-center">Frequently asked questions</h2>
                <p class="uk-text-center uk-text-lead">Find quick answers to frequent pre-sale questions asked by customers
                </p>
                <ul class="uk-margin-medium-top uk-accordion" data-uk-accordion="multiple: true">
                    <li>
                        <a class="uk-accordion-title uk-box-shadow-hover-small" href="#">Do you provide customer
                            support?</a>
                        <div class="article-content uk-accordion-content link-primary" hidden="" aria-hidden="true">
                            <p>Having support for your purchased item means that we will be available to you to iron out any
                                potential issues you have in using the item.</p>
                            <h4>The item support period</h4>
                            <p>The item includes support for 6 months from the purchase date. If you’re about to purchase
                                the
                                item, you’ll have the option to purchase extended item support, increasing the item support
                                period up to a maximum of 12 months from the date of purchase.</p>
                            <h4>What else is included?</h4>
                            <p>Answering questions about how to use the item
                                Answering technical questions about the item (and included third party assets)
                                Help with defects in the item or included third-party assets
                                Item updates to ensure ongoing compatibility and to resolve security vulnerabilities
                                Updates to ensure the item works as described and is protected against major security
                                concerns
                                Included version updates for all items</p>
                            <h4>What’s not included in item support?</h4>
                            <p>Item support does not include services to modify or extend the item beyond the original
                                features,
                                style and functionality described on the item page. For customization services that will
                                help
                                you tailor the item to your specific requirements, we recommend contacting us to see if we
                                privately offer paid customization service.</p>
                            <ul>
                                <li>Installation of the item</li>
                                <li>Hosting, server environment, or software</li>
                                <li>Help from authors of included third-party assets</li>
                            </ul>
                            <h4>Contacting support</h4>
                            <p>Support is provided Mon - Fri through item <a href="#">support</a> page.</p>
                        </div>
                    </li>
                    <li>
                        <a class="uk-accordion-title uk-box-shadow-hover-small" href="#">Are updates and bug fixes included
                            in
                            the cost of the item?</a>
                        <div class="article-content uk-accordion-content link-primary" hidden="" aria-hidden="true">
                            <p>Regardless of whether you have support or not:</p>
                            <ul>
                                <li>When we release an update, it will be available for you to download for free</li>
                                <li>You can report bugs</li>
                                <li>You can expect us to keep the item in good working order, working as described and
                                    protected
                                    against major security issues</li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a class="uk-accordion-title uk-box-shadow-hover-small" href="#">Can I extend or renew my item
                            support?</a>
                        <div class="article-content uk-accordion-content link-primary" hidden="" aria-hidden="true">
                            <h4>Item support option</h4>
                            <p>The support options available to you depend on when you make the support purchase.</p>
                            <ul>
                                <li>A support upgrade is 6 months of additional support that can be purchased at the time of
                                    buying the item.</li>
                                <li>A support extension is 6 months of support that can be purchased at any time after the
                                    initial purchase of the item, provided the current support period hasn’t expired.</li>
                                <li>A support renewal is 6 months of support that can be purchased after any existing
                                    support
                                    for an item has expired.</li>
                            </ul>
                            <h4>How do I renew or extend my support?</h4>
                            <p>In order to extend or renew an item’s support offering, you must have less than 6 months of
                                the
                                existing support period remaining and also the author must still be offering support on
                                their
                                item.</p>
                            <p>To renew the support component on an item, please follow these steps:</p>
                            <ul>
                                <li>Log in to your account</li>
                                <li>Hover over your username and click ‘Downloads’ from the drop-down menu.</li>
                                <li>The downloads section displays a list of all the items purchased using your account.
                                </li>
                                <li>Click on ‘Renew support now!’ or ‘Extend now’ next to the item you wish to renew the
                                    item
                                    support for and that’s it!</li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a class="uk-accordion-title uk-box-shadow-hover-small" href="#">Does the item come with
                            installation
                            and setup documentation?</a>
                        <div class="article-content uk-accordion-content link-primary" hidden="" aria-hidden="true">
                            <p>Yes, all our items come with either bundled documentation located in your “All files &amp;
                                documentation” download zip or online documentation.</p>
                        </div>
                    </li>
                    <li>
                        <a class="uk-accordion-title uk-box-shadow-hover-small" href="#">Do you provide customization
                            services
                            for your items?</a>
                        <div class="article-content uk-accordion-content link-primary" hidden="" aria-hidden="true">
                            <p>Item support does not include services to modify or extend the item beyond the original
                                features,
                                style and functionality described on the item page.</p>
                            <p>For customization services that will help you tailor the item to your specific requirements,
                                please <a href="#">contact us</a> to see if we are available to offer paid customization
                                service or check out service
                                providers on <a href="#">Envato Studio</a>.</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
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
    </body>
</html>
