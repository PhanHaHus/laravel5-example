<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <!-- Facebook APP ID -->
        <meta property="fb:app_id" content="12345"/>

        <meta name="keywords" content="Car-Dealer, auto-salon, automobile, business, car, car-gallery, car-selling-template, cars, dealer, marketplace, mobile, real estate, responsive, sell, vehicle" />
        <meta name="description" content="Auto Dealer HTML - Responsive HTML Auto Dealer Template" />

        <!-- Open Graph -->
        <meta property="og:site_name" content="Auto Dealer HTML"/>
        <meta property="og:title" content="Gallery" />
        <meta property="og:url" content="http://localhost/12_gallery.html" />
        <meta property="og:image" content="http://cdn.winterjuice.com/example/autodealer/image.jpg" />
        <meta property="og:description" content="{{ trans('front/site.title') }}" />

        <!-- Page Title -->
        <title>{{ trans('front/site.title') }}</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/nprogress.css" />
        <link rel="stylesheet" type="text/css" href="css/style980.css" />
        <link rel="stylesheet" type="text/css" href="css/style800.css" />
        <link rel="stylesheet" type="text/css" href="css/style700.css" />
        <link rel="stylesheet" type="text/css" href="css/style600.css" />
        <link rel="stylesheet" type="text/css" href="css/style500.css" />
        <link rel="stylesheet" type="text/css" href="css/style400.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.fancybox-1.3.4.css" media="screen" />
        <!--[if IE]>
        <link href="css/style_ie.css" rel="stylesheet" type="text/css">
        <![endif]-->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.bxslider.js"></script>
        <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
        <script type="text/javascript" src="js/jquery.selectik.js"></script>
        <script type="text/javascript" src="js/jquery.mousewheel-3.0.4.pack.js"></script>
        <script type="text/javascript" src="js/jquery.fancybox-1.3.4.pack.js"></script>
        <script type="text/javascript" src="js/jquery.countdown.js"></script>
        <script type="text/javascript" src="js/jquery.checkbox.js"></script>
        <script type="text/javascript" src="js/nprogress.js"></script>
        <script type="text/javascript" src="js/js.js"></script>
    </head>
    <body class="index">
    <!--BEGIN HEADER-->
    <div id="header">
        <div class="top_info">
            <div class="logo">
                <a href="#">Example<span>Exam</span></a>
            </div>
            <div class="header_contacts">
                <div class="phone">01234657980</div>
                <div>WinterJuice, LLC, 1875 South Grant Street, Suite 680, San Mateo, CA 94402</div>
            </div>
            <div class="socials">
                <a href="#"><img src="images/fb_icon.png" alt=""></a>
                <a href="#"><img src="images/twitter_icon.png" alt=""></a>
                <a href="#"><img src="images/in_icon.png" alt=""></a>
            </div>
        </div>
        <div class="bg_navigation">
            <div class="navigation_wrapper">
                <div id="navigation">
                    <span>Home</span>
                    <ul>
                        <li class="current"><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">News</a></li>
                        <li><a href="#">For Salers</a></li>
                        <li><a href="#">Contacts</a></li>
                    </ul>
                </div>
                <div id="search_form">
                    <form method="get" action="#">
                        <input type="text" onblur="if(this.value=='') this.value='Search on site';" onfocus="if(this.value=='Search on site') this.value='';" value="Search on site" class="txb_search"/>
                        <input type="submit" value="Search" class="btn_search"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--EOF HEADER-->
    <!--BEGIN CONTENT-->

        @yield('content')

    <!--EOF CONTENT-->
    <!--BEGIN FOOTER-->
        @extends('partials.footer')
    <!--EOF FOOTER-->
    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
    <script>
        (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
        function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
        e=o.createElement(i);r=o.getElementsByTagName(i)[0];
        e.src='//www.google-analytics.com/analytics.js';
        r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
        ga('create','UA-XXXXX-X');ga('send','pageview');
    </script>
    <script>
        //loading like youtube
        $(document).ready(function () {
            NProgress.start();
            NProgress.configure({easing: 'ease', speed: 500});
            NProgress.configure({showSpinner: true});
        });
        jQuery(window).load(function () {
            NProgress.done();
        });
        $(document).ready(function() {
            $('.fb-comments').attr("data-href", document.URL);
        });
    </script>
    @yield('scripts')
    </body>
</html>