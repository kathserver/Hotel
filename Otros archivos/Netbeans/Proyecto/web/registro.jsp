<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.Dba"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Meta Responsive tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--Bootstrap CSS-->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!--Custom style.css-->
    <link rel="stylesheet" href="assets/css/quicksand.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <!--Font Awesome-->
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="encriptar/md5.js" type="text/javascript"></script>
        <script>
          function modificarPASS(){
              var sinCifrar =document.getElementById('password').value;           
              document.getElementById('password').value=hex_md5(sinCifrar);                    
              f1.submit();            
          }
      </script>
    <title>Vista Hermosa  ||  Registro</title>
  </head>

  <body class="login-body">
    
    <!--Login Wrapper-->
    <%
     Dba db =new Dba(); //en la clase dba poner el user y pass
     db.Conectar();        
    try{           
         PreparedStatement stmt=con.prepareStatement(""
                 + "declare "
                 + "begin"
                 + "   metodo_guardar(?,?);"
                 + "   commit;"
                 + "end;");  
         //pedir los parametros para enviar al metodo
         stmt.setInt(1,100);//1 codigo = 100  
         stmt.setString(2,"Osman Mejia"); //2 nombre = osman    
         int i=stmt.executeUpdate(); 
    } catch(Exception e){ 
           e.printStackTrace();      
    }
    db.desconectar();
    %>
    <div class="container-fluid login-wrapper">
        <div class="login-box">
            <h1 class="text-center mb-5"><img src="logo.ico">  Vista Hermosa</h1>    
            <div class="row">
                <div class="col-md-6 col-sm-6 col-12 login-box-info text-black-50 text-center">
                    <h3 class="mb-4">Ingresar</h3>
                    <p class="mb-4">Si eres n amante del aire libre, grnades vista y un buen confort a la hora de descansar, somos el lugar indicado para tu hostadia, estamos en diferentes provincias y países, solo contactanos y te sorprenderas de nustros servicios.</p>
                    <p class="text-center"><a href="index.html" class="btn btn-light">Ingresa Aquí</a></p>
                </div>
                <div class="col-md-6 col-sm-6 col-12 login-box-form p-4">
                    <h3 class="mb-2">Registro</h3>
                    <small class="text-muted bc-description">Crea una cuenta nueva!</small>
                    <form action="registro.jsp" class="mt-2" name="f1" method="POST">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-id-badge"></i></span>
                            </div>
                            <input type="text" class="form-control mt-0" placeholder="Nombre" aria-label="name" aria-describedby="basic-addon1" name="nombre" id="nombre">  
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-address-card"></i></span>
                            </div>
                            <input type="text" class="form-control mt-0" placeholder="Apellido" aria-label="name" aria-describedby="basic-addon1" name="apellido" id="apellido">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control mt-0" placeholder="User" aria-label="Username" aria-describedby="basic-addon1" name="user" id="user">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fa fa-lock"></i></span>
                            </div>
                            <input type="text" class="form-control mt-0" placeholder="Contraseña" aria-label="Password" aria-describedby="basic-addon1" name="pass" id="pass">
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fa fa-envelope"></i></span>
                            </div>
                            <input type="email" class="form-control mt-0" placeholder="ejemplo@email.com" aria-label="email" aria-describedby="basic-addon1" name="email" id="email">
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fa fa-phone"></i></span>
                            </div>
                            <input type="number" class="form-control mt-0" placeholder="555-098-444" aria-label="phone" aria-describedby="basic-addon1" name="phone" id="phone">
                        </div>
                        
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fa fa-map-marker"></i></span>
                            </div>
                                    <select name="nacionalidad" id="nacionalidad" class="custom-select" required>
                                        <option value="">Nacionalidad</option>
                                        <option value="USA">USA</option>
                                        <option value="Mexico">Mexico</option>
                                        <option value="Guatemala">Guatemala</option>
                                        <option value="Honduras">Honduras</option>
                                        <option value="Salvador">Salvador</option>
                                        <option value="Nicaragua">Nicaragua</option>
                                        <option value="Costa Rica">Costa Rica</option>
                                        <option value="Panama">Panama</option>
                                        <option value="Costa Rica">Costa Rica</option>
                                        <option value="Brasil">Brasil</option>
                                        <option value="Argentina">Argentina</option>
                                        <option value="Colombia">Colombia</option>
                                        <option value="Peru">Peru</option>
                                        <option value="Chile">Chile</option>
                                        <option value="Ecuador">Ecuador</option>
                                        <option value="Venezuela">Venezuela</option>
                                        <option value="Bolivia">Bolivia</option>
                                        <option value="Uruguay">Uruguay</option>
                                        <option value="Paraguay">Paraguay</option>
                                        <option value="Aruba">Aruba</option>
                                    </select>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-theme btn-block p-2 mb-1" onclick="modificarPASS();">Registrarme</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>    

    <!--Login Wrapper-->

    <!-- Page JavaScript Files-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery-1.12.4.min.js"></script>
    <!--Popper JS-->
    <script src="assets/js/popper.min.js"></script>
    <!--Bootstrap-->
    <script src="assets/js/bootstrap.min.js"></script>

    <!--Custom Js Script-->
    <script src="assets/js/custom.js"></script>
    <!--Custom Js Script-->
  </body>
</html>