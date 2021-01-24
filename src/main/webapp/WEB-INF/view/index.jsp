<%@ page import="entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Blog" %>
<%@ page import="entity.Category" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
<%
    User user = (User) session.getAttribute("user");
    List<Blog> all = (List<Blog>) request.getAttribute("all");
    int count = (int) request.getAttribute("pageCount");
    List<Category> allCategorise = (List<Category>) request.getAttribute("allCategorise");
    List<Long> categories = (List<Long>) request.getAttribute("categories");
%>
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
                                <%
                                    if (user != null) {
                                %>
                                <a href="/api/user/page">
                                    <% if (user.getImage() != null) {
                                    %>
                                    <img class="user-image6" src="/image/<%=user.getImage()%>" alt="img"
                                         style="object-fit: cover; border-radius: 200px; max-width: 11%;display: flex;"/></a>

                                <%
                                } else {
                                %>
                                <img src="/assets/images/avatardefault_92824.png" alt="img"
                                     style="object-fit: cover; border-radius: 200px;max-width: 11%;display: flex;"/></a>

                                <%
                                    }
                                %>
                                <a href="/api/user/page">
                                    <h5 style="color: white; margin-left: 65px; margin-top: -35px;"><%=user.getName()%> <%=user.getSurname()%>
                                    </h5>
                                </a>
                                </a>
                                <%
                                    }
                                %>


                            </div><!-- /.intro-socail-share -->
                            <nav class="navigation">
                                <div class="menu-wrapper">
                                    <div class="menu-content">
                                        <ul class="mainmenu">
                                            <li><a class="active" href="/api">Home</a></li>
                                            <%

                                                if (user != null) {
                                            %>
                                            <li><a href="/api/login" style="display: none">Login</a></li>
                                            <li><a class="active" href="/api/register"
                                                   style="display: none">register</a>
                                            </li>
                                            <li><a href="/api/user/blog">My Blog</a></li>
                                            <li><a href="/api/blog/create">Create Blog</a></li>
                                            <li><a href="/api/user/page">My Page</a></li>
                                            <%
                                            } else {
                                            %>
                                            <li><a href="/api/login">Login</a></li>
                                            <li><a href="/api/register">register</a></li>
                                            <li><a href="/api/user/blog" style="display: none">My Blog</a></li>
                                            <li><a href="/api/blog" style="display: none">Create Blog</a></li>
                                            <li><a href="/api/user/page" style="display: none">My Page</a></li>
                                            <%
                                                }
                                            %>
                                        </ul> <!-- /.menu-list -->
                                    </div> <!-- /.hours-content-->
                                </div><!-- /.menu-wrapper -->
                            </nav>
                            <div class="header-right-area">
                                <div class="search-wrap">
                                    <div class="search-btn">
                                        <i class="fas fa-search"></i>
                                    </div>
                                    <div class="search-form">
                                        <form action="/api">
                                            <input type="hidden" value="0" name="page">
                                            <%
                                                for (Long categoryId : categories) {
                                            %>
                                            <input type="hidden" name="categoryId" value="<%=categoryId%>">
                                           <%
                                                }
                                            %>
                                            <input type="search" name="search" placeholder="Search">
                                            <button type="submit"><i class="fas fa-search"></i></button>
                                        </form>
                                    </div>
                                </div>
                                <!--~./ search-wrap ~-->
                                <%
                                    if (user == null) {
                                %>
                                <form action="/api/logout" method="get" style="display: none">
                                    <button type="submit" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-log-out"></span> Log out
                                    </button>
                                </form>
                                <%

                                } else {

                                %>
                                <form action="/api/logout" method="get">
                                    <button type="submit" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-log-out"></span> Log out
                                    </button>
                                </form>
                                <%
                                    }

                                %>

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


    <div class="main-wrapper">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-8 main-wrapper-content">
                    <!--~~~~~ Start Site Main ~~~~~-->
                    <main class="site-main">
                        <div class="row masonry-posts">
                            <!--~~~~~ Start Post ~~~~~-->

                            <%
                                for (Blog blog : all) {
                            %>
                            <div class="col-lg-6 col-md-6 grid-item">
                                <article class="post hentry post-grid style-two">
                                    <div class="entry-thumb">
                                        <figure class="thumb-wrap">
                                            <%
                                                if (blog.getImage() != null) {
                                            %>
                                            <a href="/api/post/<%=blog.getId()%>">
                                                <img src="/image/<%=blog.getImage()%>" alt="post"/>
                                            </a>
                                            <%
                                            } else {
                                            %>
                                            <a href="/api/post/<%=blog.getId()%>">
                                                <img src="/assets/images/post/homeTwo/grid/post1.jpg" alt="post"/>
                                            </a>
                                            <%
                                                }
                                            %>

                                        </figure>
                                        <!--./ thumb-wrap -->
                                    </div>
                                    <!--./ entry-thumb -->
                                    <div class="content-entry-wrap">

                                        <%
                                            for (Category category : blog.getCategoryList()) {
                                        %>
                                        <div class="entry-category">
                                            <a class="cat"><%=category.getName()%>
                                            </a>

                                        </div>
                                        <%
                                            }
                                        %>

                                        <!--./ entry-category -->
                                        <h3 class="entry-title">
                                            <a href="/api/post/<%=blog.getId()%>"><%=blog.getTitle()%>
                                            </a>
                                        </h3>
                                        <!--./ entry-title -->
                                        <div class="entry-meta-content">
                                            <div class="entry-author">
                                                By <a><%=blog.getUser().getName()%>
                                            </a>
                                            </div>
                                            <!--./ entry-date -->
                                            <div class="entry-date">
                                                <%
                                                    SimpleDateFormat sm = new SimpleDateFormat("dd MMMMM yyyy");
                                                    String blogDate = sm.format(blog.getCreatedDate());
                                                %>

                                                On <span><%=blogDate%></span>
                                            </div>
                                            <!--./ entry-date -->
                                        </div>
                                        <!--./ entry-meta-content -->
                                        <div class="entry-content">
                                            <div class="entry-summary">
                                                <p>
                                                    <%=blog.getDescription()%>
                                                </p>
                                            </div>
                                            <div class="read-more-wrap">
                                                <a class="read-more" href="/api/post/<%=blog.getId()%>">Read More</a>
                                            </div>
                                            <br>
                                            <br>
                                        </div>
                                    </div>
                                    <!--./ content-entry-wrap -->
                                </article>
                            </div>

                            <%
                                }
                            %>

                            <!--~./ end post ~-->


                        </div>
                    </main>
                    <!--~./ end site main ~-->

                    <!--~~~~~ Start Paging Navigation ~~~~~-->
                    <nav class="navigation paging-navigation style-one pd-t-15">
                        <ul class="nav-links">


                            <%

                                String page1 = request.getParameter("page");
                                int pageCount = 0;
                                String searchValue = (String) request.getAttribute("searchValue");
                                if (page1 != null && !page1.isEmpty()) {
                                    pageCount = Integer.parseInt(page1);
                                }
                                StringBuilder categoryParamBuilder = new StringBuilder();
                                for (Long categoryId : categories) {
                                    categoryParamBuilder
                                            .append("&categoryId=")
                                            .append(categoryId);
                                }
                                for (int i = 0; i < count; i++) {
                                    if (pageCount == i) {

                            %>

                            <li class="active"><a
                                    href="/api?page=<%=i + "&search="+ searchValue + categoryParamBuilder.toString()%>"
                                    class="page-numbers"><%=i + 1%>
                            </a></li>

                            <%
                            } else {
                            %>
                            <li><a href="/api?page=<%=i + "&search=" + searchValue + categoryParamBuilder.toString()%>"
                                   class="page-numbers"><%=i + 1%>
                            </a></li>
                            <%
                                    }
                                }
                            %>

                        </ul>
                    </nav>
                    <!--~./ end paging navigation ~-->
                </div>

                <!--~~~~~ Start sidebar ~~~~~-->
                <div class="col-lg-4">
                    <!-- Sidebar Items -->
                    <div class="sidebar-items style-two">
                        <!--~~~~~ Start About Me Widget ~~~~~-->


                        <!--~~~~~ Start Categories Widget ~~~~~-->
                        <aside class="widget widget_categories">
                            <h4 class="widget-title">
                                Categories
                            </h4>
                            <!-- /.widget-title -->
                            <div class="widget-content">
                                <form action="/api" method="get">
                                    <input type="hidden" name="search" value="<%=searchValue%>">
                                    <ul>
                                        <%

                                            for (Category category : allCategorise) {
                                                if (categories.contains(category.getId())) {
                                        %>

                                        <li>
                                            <a href="#"><%=category.getName()%> <input class="count" name="categoryId"
                                                                                       value="<%=category.getId()%>"
                                                                                       type="checkbox" checked></a>
                                        </li>

                                        <%
                                        } else {
                                        %>
                                        <li>
                                            <a href="#"><%=category.getName()%> <input class="count" name="categoryId"
                                                                                       value="<%=category.getId()%>"
                                                                                       type="checkbox"></a>
                                        </li>

                                        <%
                                                }

                                            }
                                        %>

                                    </ul>

                                    <button type="submit" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-log-out"></span>Filter
                                    </button>
                                </form>
                            </div>
                            <!-- /.widget-content -->
                        </aside>
                        <!--~./ end categories widget ~-->

                        <!--~./ end Advertisement widget ~-->
                    </div>
                    <!--  /.sidebar-items -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
        </div>
    </div>
    <!--~./ end main wrapper ~-->

    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        Start Site Footer
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
    <footer class="site-footer pd-t-120">

        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                    Start Footer Bottom Area
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
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
<script src="/assets/js/main.js"></script>
<!-- main-js -->
</body>

</html>