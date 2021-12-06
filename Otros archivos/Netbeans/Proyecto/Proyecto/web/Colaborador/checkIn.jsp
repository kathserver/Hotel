<!DOCTYPE html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Meta Responsive tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--Favicon Icon-->
    <link rel="icon" href="logo.ico" type="image/x-icon">
    <!--Bootstrap CSS-->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!--Custom style.css-->
    <link rel="stylesheet" href="assets/css/quicksand.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <!--Font Awesome-->
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <!--Animate CSS-->
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <!--Chartist CSS-->
    <link rel="stylesheet" href="assets/css/chartist.min.css">
    <!--Map-->
    <link rel="stylesheet" href="assets/css/jquery-jvectormap-2.0.2.css">
    <!--Bootstrap Calendar-->
    <link rel="stylesheet" href="assets/js/calendar/bootstrap_calendar.css">
    <!--Nice select -->
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <!--Tarjeta CSS -->
    <link rel="stylesheet" href="assets/css/tarjeta.css">

    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <title>Vista Hermosa || Binvenido Colaborador</title>
</head>

<body>
    <!--Page loader-->
    <div class="loader-wrapper">
        <div class="loader-circle">
            <div class="loader-wave"></div>
        </div>
    </div>
    <!--Page loader-->
<%
    HttpSession nsession = request.getSession(false);
if(nsession!=null) {
%>
    <!--Page Wrapper-->

    <div class="container-fluid">

        <!--Header-->
        <div class="row header shadow-sm">

            <!--Logo-->
            <div class="col-sm-3 pl-0 text-center header-logo">
                <div class="bg-secondary mr-3 pt-3 pb-2 mb-0">
                    <h3 class="logo"><a href="index.jsp" class="text-secondary logo"><img src="../logo.ico"
                                style="width:20%;">
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
                            <a class="" href="#" onclick="toggle_dropdown(this); return false" role="button"
                                class="dropdown-toggle">
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

                        <!--Inbox icon-->
                        <span class="menu-icon">
                            <i class="fa fa-th-large"></i>
                        </span>
                    </div>
                    <!--Menu Icons-->

                    <!--Search box and avatar-->
                    <div class="col-sm-8 col-4 text-right flex-header-menu justify-content-end">
                        <div class="search-rounded mr-3">
                            <input type="text" class="form-control search-box" placeholder="Enter keywords.." />
                        </div>
                        <div class="mr-4">
                            <a class="" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <img src="../assets/img/profile.jpg" alt="Adam" class="rounded-circle" width="40px"
                                    height="40px">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right mt-13" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="perfil.jsp"><i class="fa fa-user pr-2"></i> Perfil</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="checkIn.jsp"><i class="fa fa-th-list pr-2"></i> Tarea</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="cerrarsesion.jsp"><i class="fa fa-power-off pr-2"></i> Salir</a>
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
                        <img src="../assets/img/profile.jpg" alt="" class="rounded-circle" />
                        <p><strong>Jonathan Clarke</strong></p>
                        <span class="text-theme small"><strong>Colaborador</strong></span>
                    </div>
                    <!--Image Avatar-->

                    <!--Sidebar Navigation Menu-->
                    <div class="sidebar-menu-container">
                        <ul class="sidebar-menu mt-4 mb-4">
                            <li class="parent">
                                <a href="index.jsp" class=""><i class="fa fa-dashboard mr-3"> </i>
                                    <span class="none">Dashboard </span>
                                </a>
                            </li>
                            <li class="parent">
                                <a href="#" onclick="toggle_menu('ul_element'); return false" class=""><i
                                        class="fa fa-puzzle-piece mr-3"></i>
                                    <span class="none">Elementos <i
                                            class="fa fa-angle-down pull-right align-bottom"></i></span>
                                </a>
                                <ul class="children" id="ul_element">
                                    <li class="child"><a href="checkIn.jsp" class="ml-4"><i
                                                class="fa fa-angle-right mr-2"></i>
                                            Check In</a></li>
                                    <li class="child"><a href="checkOut.jsp" class="ml-4"><i
                                                class="fa fa-angle-right mr-2"></i>
                                            Check Out</a></li>
                                </ul>
                            </li>
                            <li class="parent">
                                <a href="reserva.jsp" class=""><i class="fa fa-calendar-o mr-3"> </i>
                                    <span class="none">Realizar Reserva </span>
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
                <h5 class="mb-3"><strong>Check In</strong></h5>

                <div class="mt-1 mb-4 button-container">
                    <div class="row pl-0">
                        <!--Dashboard Profile card-->
                        <div class="col-lg-4 col-md-4 col-sm-4 card-pro mb-4">
                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="media">
                                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-secondary">
                                            <i class="fa fa-bed "></i>
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mt-0"><strong>Reservacion 1</strong></h6>
                                            <p class="mb-3 text-info"><strong>Pedro Canaca</strong></p>


                                        </div>
                                    </div>

                                    <div class="mt-4 mb-4">
                                        <div class="row user-about">
                                            <div class="col-sm-4 col-4 border-right text-center">
                                                <h5>20/12</h5>
                                                <p>Fecha</p>
                                            </div>
                                            <div class="col-sm-4 col-4 text-center">
                                                <h4>2</h4>
                                                <p>Personas</p>
                                            </div>
                                            <div class="col-sm-4 col-4 border-left text-center">
                                                <h4>1</h4>
                                                <p>Habi.</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="dropdown-divider"></div>

                                    <p class="mb-3 mt-3 text-center p-space">
                                        Lorem ipsum dolor sit ametetur adipisicing elit, sed do eiusmod tempor
                                        incididunt adipisicing elit, sed do
                                    </p>
                                    <div class="align-self-center">
                                        <button class="btn btn-dark" data-toggle="modal" data-target="#orderObserva">
                                            <i class="fa fa-eye"></i>
                                        </button>
                                        <button class="btn btn-primary" data-toggle="modal" data-target="#orderReserva">
                                            <i class="fa fa-plus"></i> Check In
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Dashboard Profile card-->

                        <!--Order Info Modal-->
                        <div class="modal fade" id="orderObserva" tabindex="-1" role="dialog"
                            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle">Detalles de Reservacion 1
                                        </h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="media align-self-center">
                                            <img class="align-self-center mr-3 rounded-circle"
                                                src="../assets/img/home-right-admin-img.png" width="80px" height="80px"
                                                alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h6 class="mt-0">Cliente: <strong>Pedro Canaca</strong></h6>
                                                <p class="mb-3 text-info">
                                                    <strong> Id:</strong> 3 
                                                    <strong> Nacionalidad:</strong> Hondureño <br>
                                                    <strong> Contactos:</strong> 
                                                    Telefono: 9347-3218 
                                                    Correo: Pcanaca22@gmail.com
                                                </p>
                                            </div>
                                        </div>

                                        <div class="mt-4 mb-4">
                                            <div class="row user-about">
                                                <div class="col-sm-4 col-4 border-right">
                                                    <h6>20/12/2021</h6>
                                                    <p>Fecha Llegada</p>
                                                </div>
                                                <div class="col-sm-4 col-4">
                                                    <h6>23/12/2021</h6>
                                                    <p>Fecha Salida</p>
                                                </div>
                                                <div class="col-sm-4 col-4 border-left">
                                                    <h6>1</h6>
                                                    <p>id Habit.</p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="dropdown-divider"></div>

                                        <p class="mb-3 mt-3 p-space">
                                            <strong> Servicios Contratados:</strong>
                                            <div class="row">
                                                <div class="col-sm-2">
                                                    <div class="align-self-center rounded-circle notify-icon bg-secondary">
                                                        <i class="fa fa-taxi "></i>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="align-self-center rounded-circle notify-icon bg-secondary">
                                                        <i class="fa fa-glass "></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Order Info Modal-->
                        
                           <!--Order Info Modal2-->
                        <div class="modal fade" id="orderReserva" tabindex="-1" role="dialog"
                            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle"><strong>Reservacion 1</strong>
                                        </h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="media align-self-center">
                                            <img class="align-self-center mr-3 rounded-circle"
                                                src="../assets/img/home-right-admin-img.png" width="80px" height="80px"
                                                alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h6 class="mt-0">Cliente: <strong>Pedro Canaca</strong></h6>
                                                <p class="mb-3 text-info">
                                                    <strong> Id:</strong> 3 
                                                    <strong> Nacionalidad:</strong> Hondureño <br>
                                                    <strong> Contactos:</strong> 
                                                    Telefono: 9347-3218 
                                                    Correo: Pcanaca22@gmail.com
                                                </p>
                                            </div>
                                        </div>
                                        <div class="dropdown-divider"></div>

                                        <p class="mb-3 mt-3 p-space">
                                            <strong> Informacion de Tarjeta</strong>
                                            <form class="form-horizontal mt-4 mb-5">
                                                <div class="form-group owner">
                                                    <label for="owner">Owner</label>
                                                    <input type="text" class="form-control" id="owner">
                                                </div>
                                                <div class="form-group CVV ">
                                                    <label for="cvv">CVV</label>
                                                    <input type="text" class="form-control w-15" id="cvv">
                                                </div>
                                                <div class="form-group" id="card-number-field">
                                                    <label for="cardNumber">Numero Tarjeta</label>
                                                    <input type="text" class="form-control " id="cardNumber">
                                                </div>
                                                <div class="form-group" id="expiration-date">
                                                    <label>Fecha de Expiracion</label>
                                                    <select>
                                                        <option value="01">Enero</option>
                                                        <option value="02">Febrero</option>
                                                        <option value="03">Marzo</option>
                                                        <option value="04">Abril</option>
                                                        <option value="05">Mayo</option>
                                                        <option value="06">Junio</option>
                                                        <option value="07">Julio</option>
                                                        <option value="08">Augosto</option>
                                                        <option value="09">Septiembre</option>
                                                        <option value="10">Octubre</option>
                                                        <option value="11">Noviembre</option>
                                                        <option value="12">Dciembre</option>
                                                    </select>
                                                    <select>
                                                        <option value="16"> 2021</option>
                                                        <option value="17"> 2022</option>
                                                        <option value="18"> 2023</option>
                                                        <option value="19"> 2024</option>
                                                        <option value="20"> 2025</option>
                                                        <option value="21"> 2026</option>
                                                    </select>
                                                </div>
                                                <div class="form-group" id="pay-now">
                                                    <button type="submit" class="btn btn-default"  id="confirm-purchase" data-dismiss="modal">Confirmar</button>
                                                </div>
                                            </form>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Order Info Modal-->

                        <!--Reservacion 2-->
                        <div class="col-lg-4 col-md-4 col-sm-4 card-pro mb-4">
                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="media">
                                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-secondary">
                                            <i class="fa fa-bed "></i>
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mt-0"><strong>Reservacion 2</strong></h6>
                                            <p class="mb-3 text-info"><strong>Arnold Maradiaga</strong></p>


                                        </div>
                                    </div>

                                    <div class="mt-4 mb-4">
                                        <div class="row user-about">
                                            <div class="col-sm-4 col-4 border-right text-center">
                                                <h5>30/11</h5>
                                                <p>Fecha</p>
                                            </div>
                                            <div class="col-sm-4 col-4 text-center">
                                                <h4>1</h4>
                                                <p>Personas</p>
                                            </div>
                                            <div class="col-sm-4 col-4 border-left text-center">
                                                <h4>1</h4>
                                                <p>Habi.</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="dropdown-divider"></div>

                                    <p class="mb-3 mt-3 text-center p-space">
                                        Lorem ipsum dolor sit ametetur adipisicing elit, sed do eiusmod tempor
                                        incididunt adipisicing elit, sed do
                                    </p>
                                    <div class="align-self-center">
                                        <button class="btn btn-dark" data-toggle="modal" data-target="#orderReserva">
                                            <i class="fa fa-eye"></i>
                                        </button>
                                        <button type="button" class="btn btn-primary">
                                            <i class="fa fa-plus"></i> Check In
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--reservacion 2-->

                        <!--reservacion 3-->
                        <div class="col-lg-4 col-md-4 col-sm-4 card-pro mb-4">
                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="media">
                                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-secondary">
                                            <i class="fa fa-bed "></i>
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mt-0"><strong>Reservacion 3</strong></h6>
                                            <p class="mb-3 text-info"><strong>Penelope Cruz</strong></p>


                                        </div>
                                    </div>

                                    <div class="mt-4 mb-4">
                                        <div class="row user-about">
                                            <div class="col-sm-4 col-4 border-right text-center">
                                                <h5>15/12</h5>
                                                <p>Fecha</p>
                                            </div>
                                            <div class="col-sm-4 col-4 text-center">
                                                <h4>4</h4>
                                                <p>Personas</p>
                                            </div>
                                            <div class="col-sm-4 col-4 border-left text-center">
                                                <h4>2</h4>
                                                <p>Habi.</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="dropdown-divider"></div>

                                    <p class="mb-3 mt-3 text-center p-space">
                                        Lorem ipsum dolor sit ametetur adipisicing elit, sed do eiusmod tempor
                                        incididunt adipisicing elit, sed do
                                    </p>
                                    
                                    <div class="align-self-center">
                                        <button class="btn btn-dark" data-toggle="modal" data-target="#orderReserva">
                                            <i class="fa fa-eye"></i>
                                        </button>
                                        <button type="button" class="btn btn-primary">
                                            <i class="fa fa-plus"></i> Check In
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--reservacion 3-->

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
         <%
        }else{
             //request.getRequestDispatcher("../index.html").forward(request, response);
                session.invalidate();
                response.sendRedirect("../index.html");
}
    %>

        <!--Main Content-->

    </div>

    <!--Page Wrapper-->

    <!-- Page JavaScript Files-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery-1.12.4.min.js"></script>
    <!--Popper JS-->
    <script src="assets/js/popper.min.js"></script>
    <!--Bootstrap-->
    <script src="assets/js/bootstrap.min.js"></script>
    <!--Sweet alert JS-->
    <script src="assets/js/sweetalert.js"></script>
    <!--Progressbar JS-->
    <script src="assets/js/progressbar.min.js"></script>
    <!--Flot.JS-->
    <script src="assets/js/charts/jquery.flot.min.js"></script>
    <script src="assets/js/charts/jquery.flot.pie.min.js"></script>
    <script src="assets/js/charts/jquery.flot.categories.min.js"></script>
    <script src="assets/js/charts/jquery.flot.stack.min.js"></script>
    <!--Chart JS-->
    <script src="assets/js/charts/chart.min.js"></script>
    <!--Chartist JS-->
    <script src="assets/js/charts/chartist.min.js"></script>
    <script src="assets/js/charts/chartist-data.js"></script>
    <script src="assets/js/charts/demo.js"></script>
    <!--Maps-->
    <script src="assets/js/maps/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="assets/js/maps/jquery-jvectormap-world-mill-en.js"></script>
    <script src="assets/js/maps/jvector-maps.js"></script>
    <!--Bootstrap Calendar JS-->
    <script src="assets/js/calendar/bootstrap_calendar.js"></script>
    <script src="assets/js/calendar/demo.js"></script>
    <!--Nice select-->
    <script src="assets/js/jquery.nice-select.min.js"></script>

    <!--Custom Js Script-->
    <script src="assets/js/custom.js"></script>
    <!--Tarjeta-->
    <script src="assets/js/tarjeta.js"></script>
    <!--Custom Js Script-->
    <script>
        //Nice select
        $('.bulk-actions').niceSelect();
    </script>
</body>

</html>