<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="description" content="" >
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Meta Responsive tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--Bootstrap CSS-->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <!--Custom style.css-->
    <link rel="stylesheet" href="../assets/css/quicksand.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <!--Font Awesome-->
    <link rel="stylesheet" href="../assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <!--Animate CSS-->
    <link rel="stylesheet" href="../assets/css/chartist.min.css">
    <!--Fullcalendar CSS-->
    <link rel="stylesheet" href="../assets/css/fullcalendar-3.9.0/fullcalendar.min.css">
    <link rel="stylesheet" href="../assets/css/fullcalendar-3.9.0/fullcalendar.print.min.css"  media='print'>
    <!--Bootstrap Calendar-->
    <link rel="stylesheet" href="../assets/js/calendar/bootstrap_calendar.css">
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <title>Sleek Admin</title>
  </head>
  <body>
    <!--Page loader-->
    <div class="loader-wrapper">
        <div class="loader-circle">
            <div class="loader-wave"></div>
        </div>
    </div>
    <!--Page loader-->
    
    <!--Page Wrapper-->

    <div class="container-fluid">

        <!--Header-->
        <div class="row header shadow-sm">
            
            <!--Logo-->
            <div class="col-sm-3 pl-0 text-center header-logo">
               <div class="bg-dark mr-3 pt-3 pb-2 mb-0">
                <h3 class="logo"><a href="index.jsp" class="text-secondary logo"><img src="../logo.ico" style="width:20%;">
                    Vista Hermosa </a></h3>
               </div>
            </div>
            <!--Logo-->

            <!--Header Menu-->
            <div class="col-sm-9 header-menu pt-2 pb-0">
                <div class="row">
                    
                    <!--Menu Icons-->
                    <div class="col-sm-4 col-8 pl-0">
                        <!--Toggle sidebar-->
                        <span class="menu-icon" onclick="toggle_sidebar()">
                            <span id="sidebar-toggle-btn"></span>
                        </span>
                        <!--Toggle sidebar-->
                        <!--Notification icon-->
                        <div class="menu-icon">
                            <a class="" href="#" onclick="toggle_dropdown(this); return false" role="button" class="dropdown-toggle">
                                <i class="fa fa-bell"></i>
                                <span class="badge badge-danger">5</span>
                            </a>
                            <div class="dropdown dropdown-left bg-white shadow border">
                                <a class="dropdown-item" href="#"><strong>Notifications</strong></a>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item">
                                    <div class="media">
                                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-primary">
                                            <i class="fa fa-bookmark"></i>
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mt-0"><strong>Meeting</strong></h6>
                                            <p>You have a meeting by 8:00</p>
                                            <small class="text-success">09:23am</small>
                                        </div>
                                    </div>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item">
                                    <div class="media">
                                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-secondary">
                                            <i class="fa fa-link"></i>
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mt-0"><strong>Events</strong></h6>
                                            <p>Launching new programme</p>
                                            <small class="text-success">09:23am</small>
                                        </div>
                                    </div>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item">
                                    <div class="media">
                                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-warning">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mt-0"><strong>Personnel</strong></h6>
                                            <p>New employee arrival</p>
                                            <small class="text-success">09:23am</small>
                                        </div>
                                    </div>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-center link-all" href="#">See all notifications ></a>
                            </div>
                        </div>
                        <!--Notication icon-->
                    </div>
                    <!--Menu Icons-->

                    <!--Search box and avatar-->
                    <div class="col-sm-8 col-4 text-right flex-header-menu justify-content-end">
                        <div class="search-rounded mr-3">
                            <input type="text" class="form-control search-box" placeholder="Enter keywords.." />
                        </div>
                        <div class="mr-4">
                            <a class="" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="../assets/img/client-img2.png" alt="Donna" class="rounded-circle" width="40px" height="40px">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right mt-13" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="#"><i class="fa fa-user pr-2"></i> Profile</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i class="fa fa-th-list pr-2"></i> Tasks</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i class="fa fa-book pr-2"></i> Projects</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i class="fa fa-power-off pr-2"></i> Logout</a>
                            </div>
                        </div>
                    </div>
                    <!--Search box and avatar-->
                </div>    
            </div>
            <!--Header Menu-->
        </div>
        <!--Header-->

        <!--Main Content-->

        <div class="row main-content">
            <!--Sidebar left-->
            <div class="col-sm-3 col-xs-6 sidebar pl-0">
                <div class="inner-sidebar mr-3">
                    <!--Image Avatar-->
                    <div class="avatar text-center">
                        <img src="../assets/img/client-img2.png" alt="" class="rounded-circle" />
                        <p><strong>Donna Snider</strong></p>
                        <span class="text-theme small"><strong>Cliente</strong></span>
                    </div>
                    <!--Image Avatar-->

                    <!--Sidebar Navigation Menu-->
                    <div class="sidebar-menu-container">
                        <ul class="sidebar-menu mt-4 mb-4">
                            <li class="parent">
                                <a href="index.jsp" class=""><i class="fa fa-dashboard mr-3"> </i>
                                    <span class="none">Principal </i></span>
                                </a>
                            </li>
                            </li>
                            <li class="parent">
                                <a href="reservar.jsp" class=""><i class="fa fa-calendar mr-3"></i>
                                    <span class="none">Reservar </span>
                                </a>
                            </li>
                            <li class="parent">
                                <a href="servicios.jsp" class=""><i class="fa fa-puzzle-piece mr-3"></i>
                                    <span class="none">Servicios </span>
                                </a>
                            </li>
                            <li class="parent">
                                <a href="ubicar.jsp" class=""><i class="fa fa-map-marker mr-3"></i>
                                    <span class="none">Ubicanos! </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!--Sidebar Naigation Menu-->
                </div>
            </div>
            <!--Sidebar left-->

            <!--Content right-->
            <div class="col-sm-9 col-xs-12 content pt-3 pl-0">
                <h5 class="mb-0" ><strong>Reservar</strong></h5>
                <span class="text-secondary">Principal <i class="fa fa-angle-right"></i> Reservar</span>
                
                <div class="row mt-3">
                    <div class="col-md-12 col-sm-12">
                        <!--Full Calendar-->
                        <div class="mt-1 mb-3 p-3 button-container bg-white border shadow-sm lh-sm">
                            <div class="email-msg">
                                
                                <div class="table-responsive" id="calendarFull"></div>

                            </div>
                        </div>
                        <!--/Email messages-->

                    </div>
                </div>
                
                

                <!--Footer-->
                <div class="row mt-5 mb-4 footer">
                    <div class="col-sm-8">
                        <span>&copy; All rights reserved 2021 designed by <a class="text-theme"
                                href="#">JK-Fusion</a></span>
                    </div>
                    <div class="col-sm-4 text-right">
                        <a href="#" class="ml-2">Contact Us</a>
                        <a href="#" class="ml-2">Support</a>
                    </div>
                </div>
                <!--Footer-->


            </div>
        </div>

        <!--Main Content-->

    </div>

    <!--Page Wrapper-->

    <!-- Page JavaScript Files-->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/jquery-1.12.4.min.js"></script>
    <!--Popper JS-->
    <script src="../assets/js/popper.min.js"></script>
    <!--Bootstrap-->
    <script src="../assets/js/bootstrap.min.js"></script>
    <!--Sweet alert JS-->
    <script src="../assets/js/sweetalert.js"></script>
    <!--Progressbar JS-->
    <script src="../assets/js/progressbar.min.js"></script>
    <!--Flot.JS-->
    <script src="../assets/js/charts/jquery.flot.min.js"></script>
    <script src="../assets/js/charts/jquery.flot.pie.min.js"></script>
    <script src="../assets/js/charts/jquery.flot.categories.min.js"></script>
    <script src="../assets/js/charts/jquery.flot.stack.min.js"></script>
    <!--Echarts-->
    <script src="../assets/js/charts/echarts.min.js"></script>
    <script src="../assets/js/charts/echarts-data.js"></script>
    <!--Charts JS-->
    <script src="../assets/js/charts/chart.min.js"></script>
    <script src="../assets/js/charts/demo.js"></script>
    <!--Maps-->
    <script src="../assets/js/maps/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="../assets/js/maps/jquery-jvectormap-world-mill-en.js"></script>
    <script src="../assets/js/maps/jvector-maps.js"></script>
    <!--Full calendar-->
    <script src="../assets/css/fullcalendar-3.9.0/lib/moment.min.js"></script>
    <script src="../assets/css/fullcalendar-3.9.0/fullcalendar.min.js"></script>
    <script src="../assets/js/full-calendar.js"></script>
    <!--Nice select-->
    <script src="../assets/js/jquery.nice-select.min.js"></script>

    <!--Custom Js Script-->
    <script src="../assets/js/custom.js"></script>
    <!--Custom Js Script-->
    <script>
        //Nice select
        $('.bulk-actions').niceSelect();
    </script>
  </body>
</html>