<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 1/11/2021
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- Specific Meta
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="description" content="Blog And Magazine HTML5 Template"/>
    <meta name="keywords"
          content="HTML5, Template, Design, blog, blogger, clean, flat, food, html, magazine, modern, news, personal, photographer, template, white  "/>

    <!-- Titles
    ================================================== -->
    <title>EasyArt | Personal Blog HTML Template</title>

    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="/assets/images/favicon.ico"/>
    <link rel="apple-touch-icon" sizes="72x72" href="/assets/images/android-icon-72x72.png"/>
    <link rel="apple-touch-icon" sizes="114x114" href="/assets/images/apple-icon-144x144.png"/>

    <!-- Custom Font
    ================================================== -->
    <link
            href="https://fonts.googleapis.com/css2?family=Barlow+Semi+Condensed:wght@400;500;600;700;800&family=Barlow:wght@400;500;600;700&family=Roboto+Slab:wght@400;500;600;700;800&family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/css/magnific-popup.css"/>
    <link rel="stylesheet" href="/assets/css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="/assets/css/simple-scrollbar.css"/>
    <link rel="stylesheet" href="/assets/css/fontawesome.all.min.css"/>
    <link rel="stylesheet" href="/assets/css/style.css"/>

    <script src="/assets/js/modernizr.min.js"></script>
</head>

<body>
<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        Start Preloader
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
<div class="preloader">
    <div class="preloader-inner">
        <div class="preloader-icon">
            <span></span>
            <span></span>
        </div><!-- /preloader-icon -->
    </div><!-- /preloader-inner -->
</div><!-- /preloader -->

<div class="site-content">
    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            Start Site Header
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
    <header class="site-header header-style-one intro-element">
        <div class="navigation-area">
            <div class="container-medium">
                <div class="row">
                    <div class="col-12">
                        <div class="site-navigation">
                            <div class="intro-socail-share">

                            </div><!-- /.intro-socail-share -->
                            <nav class="navigation">
                                <div class="menu-wrapper">
                                    <div class="menu-content">
                                        <ul class="mainmenu">
                                            <li><a href="/api">Home</a></li>
                                            <li><a href="/api/login">Login</a></li>
                                            <li><a class="active"  href="/api/register">register</a></li>


                                        </ul> <!-- /.menu-list -->
                                    </div> <!-- /.hours-content-->
                                </div><!-- /.menu-wrapper -->
                            </nav>
                            <div class="header-right-area">
                                <!--~./ search-wrap ~-->
                                <!--~./ header card area ~-->

                                <div class="hamburger-menus">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div>
                            </div><!-- /.header-top-right-area -->
                        </div><!-- /.site-navigation -->
                    </div><!-- /.col-12 -->
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div><!-- /.navigation-area -->
        <div class="header-logo-area add-pattern">
            <div class="container-medium">
                <div class="site-branding text-center">
                    <a href="/api">
                        <img src="/assets/images/logo/logo2.png" alt="Site Logo"/>
                    </a>
                </div><!-- /.site-branding -->
            </div>
        </div><!-- /.header-logo-area -->

        <div class="mobile-sidebar-menu sidebar-menu">
            <div class="overlaybg"></div>
        </div>
    </header>
    <!--~~./ end site header ~~-->
    <!--~~~ Sticky Header ~~~-->
    <div id="sticky-header" class="active"></div>
    <!--~./ end sticky header ~-->

    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        Start Contact Block
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
    <div class="contact-block">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="contact-content-area">
                        <div class="contact-content text-center ">
                            <h2 class="heading">Register</h2>
                        </div>
                        <div class="contact-form-area">
                            <form id="contact_form" class="contact-form" action="/api/register" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="row">

                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="name">name</label>
                                                    <input class="form-controller" id="name" name="name" type="text">
                                                    <span id="nameErrorMessage" class="error" >This field is required.</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="surname">surname</label>
                                                    <input class="form-controller" id="surname" name="surname"
                                                           type="text">
                                                    <span id="surnameErrorMessage" class="error" >This field is required.</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="username">username</label>
                                                    <input class="form-controller" id="username" name="username"
                                                           type="text">
                                                    <span id="usernameErrorMessage" class="error" >This field is required.</span>
                                                    <%
                                                         String username = request.getParameter("existUsername");
                                                        if (username != null) {%>
                                                              <span id="usernameExistErrorMessage" class="error_exist">This username is already exist</span>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>

                                            <!--./ col-lg-12-->
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="password">Password</label>
                                                    <input class="form-controller" id="password" name="password"
                                                           type="password">
                                                    <span id="passwordErrorMessage" class="error" >This field is required.</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="image">image</label>
                                                    <input class="form-controller" id="image" name="image" type="file">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div><!-- /.row -->
                                <div class="col-lg-8">

                                    <button  type="submit" class="btn btn-primary" style=" margin-left: 475px;">Submit</button>
                                </div>
                            </form><!-- /.contact-form -->
                        </div><!-- /.contact-form-area -->
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="footer-bottom-content">

                        <div class="copyright-text text-center">
                            <p>
                                Copyright - 2021 By Team
                            </p>
                        </div>
                        <!--~./ end copyright text ~-->
                    </div>
                </div>
                <!--~./ col-12 ~-->
            </div>
        </div>
    </div>
    <!--~./ end footer bottom area ~-->
    </footer>
    <!--~./ end site footer ~-->
</div>
<!--~~./ end site content ~~-->

<!-- All The JS Files
================================================== -->
<script src="/assets/js/jquery.js"></script>
<script src="/assets/js/popper.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/plugins.js"></script>
<script src="/assets/js/imagesloaded.pkgd.min.js"></script>
<script src="/assets/js/simple-scrollbar.min.js"></script>
<script src="/assets/js/jquery.magnific-popup.min.js"></script>
<script src="/assets/js/masonry.pkgd.min.js"></script>
<script src="/assets/js/theia-sticky-sidebar.min.js"></script>
<script src="/assets/js/ResizeSensor.min.js"></script>
<script src="/assets/js/owl.carousel.min.js"></script>
<script src="/assets/js/scrolla.jquery.min.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCO5gB5AYjVEtuZxzRDMCOQ8_PEXikYRcg"></script>
<script src="/assets/js/maps.js"></script>
<script src="/assets/js/contact.js"></script>
<script src="/assets/js/main.js"></script>
<!-- main-js -->
</body>

</html>
