<%@ page import="entity.User" %>
<%@ page import="entity.Blog" %>
<%@ page import="entity.Category" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="entity.Comment" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 1/19/2021
  Time: 11:10 PM
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
<%
    User user = (User) session.getAttribute("user");
    Blog blog = (Blog) request.getAttribute("blog");
    List<Comment> comments = (List<Comment>) request.getAttribute("comments");
    int count = comments.size();
%>
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
                                         style="object-fit: cover; border-radius: 200px; display: flex; max-width: 11%;"/></a>

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
                                            <%
                                                if (user != null) {
                                            %>
                                            <li><a href="/api">Home</a></li>
                                            <li><a href="/api/user/blog">My Blog</a></li>
                                            <li><a href="/api/blog/create">Create Blog</a></li>
                                            <li><a href="/api/user/page">My Page</a></li>

                                            <%
                                            } else {
                                            %>
                                            <li><a href="/api">Home</a></li>
                                            <li><a href="/api/login">Login</a></li>
                                            <li><a href="/api/register">Register</a></li>
                                            <%
                                                }
                                            %>


                                        </ul> <!-- /.menu-list -->
                                    </div> <!-- /.hours-content-->
                                </div><!-- /.menu-wrapper -->
                            </nav>
                            <div class="header-right-area">
                                <!--~./ search-wrap ~-->
                                <!--~./ header card area ~-->

                                <%

                                    if (user != null) {
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


    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        Start Main Wrapper
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
    <div class="main-wrapper pd-b-100">
        <!-- Blog Items -->
        <div class="blog-single-page">
            <article class="post single-post single-post-four">
                <div class="container">
                    <div class="post-thumbnail-area">
                        <figure class="post-thumb">
                            <%
                                if (blog.getImage() != null) {
                            %>
                            <img src="/image/<%=blog.getImage()%>" style="margin-left: 200px;" alt="Blog Image"/>
                            <%
                            } else {
                            %>
                            <img src="/assets/images/post/single/one/single3.jpg"  alt="Blog Image"/>
                            <%
                                }
                            %>


                        </figure><!-- /.post-thumb -->
                    </div>
                    <div class="entry-header">
                        <div class="entry-meta-content">

                            <div class="info">
                                <div class="author-name">
                                    By <a href="#"><%=blog.getUser().getName()%> <%=blog.getUser().getSurname()%>
                                </a>
                                </div>
                                <div class="entry-date">
                                    <%
                                        SimpleDateFormat sm = new SimpleDateFormat("dd MMMMM yyyy");
                                        String format = sm.format(blog.getCreatedDate());
                                    %>
                                    On <span><%=format%></span>
                                </div>
                                <!--./ entry-time -->
                            </div>
                        </div>
                        <h3 class="entry-title"><%=blog.getTitle()%>
                        </h3>
                        <!--./ entry-title -->
                        <div class="entry-category">
                            <%
                                for (Category category : blog.getCategoryList()) {
                            %>

                            <a class="cat"><%=category.getName()%>
                            </a>
                            <%
                                }
                            %>
                        </div>

                        <!--./ entry-category -->
                    </div><!-- /.entry-header -->
                    <div class="post-details">
                        <div class="entry-content">
                            <p><%=blog.getDescription()%>
                            </p>
                        </div><!--  /.entry-content -->
                    </div><!--  /.post-details -->
                </div>
            </article><!-- /.post -->

            <div class="container">

                <hr style="size: 10px;  color: #808080 ">
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                        Start Related Posts Block
                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

                <div id="comments" class="comments-area">
                    <div class="comments-main-content">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="comments-title"><%=count%> Comments</h3>
                                <!--/.comments-title-->
                            </div>
                            <!--/.col-md-12-->
                        </div>
                        <!--/.row-->
                        <%
                            for (Comment comment : comments) {
                        %>
                        <div class="row">
                            <div class="col-md-12">
                                <ol class="comment-list">
                                    <li class="comment">
                                        <div class="comment-body">
                                            <div class="comment-meta">
                                                <div class="comment-author vcard">
                                                    <div class="author-img">
                                                        <%
                                                            if (comment.getUser().getImage() != null) {
                                                        %>
                                                        <img alt="Maria" src="/image/<%=comment.getUser().getImage()%>"
                                                             class="avatar photo">
                                                        <%
                                                        } else {
                                                        %>

                                                        <img src="/assets/images/avatardefault_92824.png" alt="img"
                                                            class="avatar photo"/></a>

                                                        <%
                                                            }
                                                        %>

                                                    </div>
                                                </div>
                                                <!--/.comment-author-->
                                                <div class="comment-metadata"><b
                                                        class="author"><%=comment.getUser().getName()%>
                                                </b>
                                                </div>
                                                <!--/.comment-metadata-->
                                            </div>
                                            <!--/.comment-meta-->
                                            <div class="comment-details">
                                                <div class="comment-content">
                                                    <p><%=comment.getText()%>
                                                    </p>
                                                </div>
                                                <!--/.comment-content-->
                                                <div class="comment-footer">
                                                    <%
                                                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm dd MMMMMM yyyy");
                                                        String commentDateFormat = simpleDateFormat.format(comment.getCreatedDate());
                                                    %>
                                                    <span class="date"><%=commentDateFormat%></span>
                                                </div>
                                            </div><!-- /.comment-details-->
                                        </div>

                                    </li>
                                </ol>
                                <!--/.comment-list-->
                            </div>
                            <!--/.col-md-12-->
                        </div>

                        <%
                            }

                        %>

                        <!--/.row-->
                    </div><!-- /.comments-main-content -->
                </div><!-- /.comments-area -->
                <%
                    if (user != null) {
                %>
                <div class="comment-respond">
                    <form action="/api/post/comment" class="comment-form" method="post">
                        <input type="hidden" name="blogId" value="<%=blog.getId()%>">
                        <h3 class="comment-reply-title">Leave your comment</h3>
                        <div class="row">
                            <div class="col-12">
                                <textarea class="form-control" rows="4" cols="50" name="text"
                                          placeholder="Your message here"></textarea>
                            </div><!-- /.col-12 -->
                            <div class="form-submit clearfix">
                                <button class="btn btn-default">Post <i class="fas fa-arrow-right"></i></button>
                            </div><!-- /.subimt -->
                        </div><!-- /.row -->
                    </form>
                </div>
                <%
                    }
                %>

            </div>
        </div><!--  /.blog-latest-items -->
    </div>
    <!--~./ end main wrapper ~-->

    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Start Subscribe Section
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->


    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            Start Site Footer
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
    <footer class="site-footer footer-style-five">
        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                Start Instagram Widget Area
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

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
