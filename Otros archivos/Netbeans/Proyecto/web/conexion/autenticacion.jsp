<%-- 
    Document   : autenticacion
    Created on : 03-13-2020, 02:09:01 AM
    Author     : Stheph
--%>

<%@page import="java.sql.*"%> 
<%@page import="database.*"%>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Meta Responsive tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--Favicon Icon-->
    <link rel="icon" href="../logo.ico" type="image/x-icon">
    <!--Bootstrap CSS-->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <!--Custom style.css-->
    <link rel="stylesheet" href="../assets/css/quicksand.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <!--Font Awesome-->
    <link rel="stylesheet" href="../assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <!--Animate CSS-->
    <link rel="stylesheet" href="../assets/css/animate.min.css">
    <!--Chartist CSS-->
    <link rel="stylesheet" href="../assets/css/chartist.min.css">
    <!--Map-->
    <link rel="stylesheet" href="../assets/css/jquery-jvectormap-2.0.2.css">

    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <title>Vista Hermosa  ||  Verificando</title>
  </head>
  <body>
      <!--Page loader-->
    <div class="lo ader-wrapper">
        <div class="loader-circle">
            <div class="loader-wave"></div>
        </div>
    </div>
    <!--Page loader-->
    <%  
    String usuario,pass,roll;
    usuario = request.getParameter("username");
    pass=request.getParameter("password");
            try{

           Class.forName("oracle.jdbc.driver.OracleDriver");
           Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hotel","mihotel");
           PreparedStatement ps = conn.prepareStatement("select USUARIO,PASS,ID_TIPO from USUARIO;");
           ResultSet rs=ps.executeQuery();
           String centinela="n";
           while(rs.next()){ 
            if( usuario.equals(rs.getString(1) )  && pass.equals(rs.getString(2))){
                roll=rs.getString(3);
                session.setAttribute("s_roll", roll);
                if(roll.equals("1")){ 
                    request.getRequestDispatcher("../Administrador/index.jsp").forward(request, response);
                }
                if(roll.equals("2")){
                    request.getRequestDispatcher("../Colaborador/index.jsp").forward(request, response);
                }
                if(roll.equals("3")){
                    request.getRequestDispatcher("../Cliente/index.jsp").forward(request, response);
                }
             
                                          centinela="s";
                    }
           }
           if(centinela.equals("s")){
            //guardar variables de session
            session.setAttribute("s_user", usuario);
            out.print("<div class=\"swal-modal\" role=\"dialog\" aria-modal=\"true\"><div class=\"swal-icon swal-icon--success\">"
                       + "<div class=\"swal-icon--success__x-mark\">"
                       + "<span class=\"swal-icon--success__line swal-icon--success__line--left\"></span>"
                       + "</div></div><div class=\"swal-title\" style=\"\">Correcto!</div>"
                       + "<div class=\"swal-text\" style=\"\">El usuario existe, Preciona el botón Ok!</div>"
                       + "<div class=\"swal-footer\"><div class=\"swal-button-container\">"
                       + "<button class=\"swal-button swal-button--confirm\">OK</button>"
                       + "<div class=}\"swal-button__loader}\"><div></div><div></div><div></div></div>");
           }
           else{
               out.print("<div class=\"swal-modal\" role=\"dialog\" aria-modal=\"true\"><div class=\"swal-icon swal-icon--error\">"
                       + "<div class=\"swal-icon--error__x-mark\">"
                       + "<span class=\"swal-icon--error__line swal-icon--error__line--left\"></span>"
                       + "</div></div><div class=\"swal-title\" style=\"\">Oh No!</div>"
                       + "<div class=\"swal-text\" style=\"\">El usuario no existe, Preciona el botón Ok!</div>"
                       + "<div class=\"swal-footer\"><div class=\"swal-button-container\">"
                       + "<button class=\"swal-button swal-button--confirm\">OK</button>"
                       + "<div class=}\"swal-button__loader}\"><div></div><div></div><div></div></div>");
               request.getRequestDispatcher("index.html").forward(request, response);
           }           
           
           }
            
            catch(Exception e){     e.printStackTrace(); 
            out.print("<div class=\"swal-modal\" role=\"dialog\" aria-modal=\"true\"><div class=\"swal-icon swal-icon--error\">"
                       + "<div class=\"swal-icon--error__x-mark\">"
                       + "<span class=\"swal-icon--error__line swal-icon--error__line--left\"></span>"
                       + "</div></div><div class=\"swal-title\" style=\"\">Oh No!</div>"
                       + "<div class=\"swal-text\" style=\"\">El usuario no existe, Preciona el botón Ok!</div>"
                       + "<div class=\"swal-footer\"><div class=\"swal-button-container\">"
                       + "<button class=\"swal-button swal-button--confirm\">OK</button>"
                       + "<div class=}\"swal-button__loader}\"><div></div><div></div><div></div></div>");
            }
        %>
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
  </body> 
</html>



