<%-- 
    Document   : register
    Created on : 05-dic-2021, 17:11:18
    Author     : kgmez
--%>
<%@page import="database.randomPass"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Properties"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@page import="java.sql.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.Dba"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.BodyPart"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem"%>

<%
      
    // --------------------- Variables  --------------------------------------
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String nacionalidad = request.getParameter("nacionalidad");
    String correo = request.getParameter("email");
    String num = request.getParameter("phone");
    int cont = 0;

    Dba db = new Dba(); //Instancia clase DBA
    db.Conectar();

    //---------------generador usuario y passeord----------------
    String passw,pass,usuario;
    int cant=(int)(Math.random());
    randomPass rp= new randomPass();
    passw=rp.hacerPassword(cant);
    pass=rp.convert(passw);
    usuario=rp.hacerPassword(cant);
    
    // ------------ Variables para conexion Base de datos   ------------------
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String user = "hotel";
    String password = "mihotel";
    Connection con = DriverManager.getConnection(url, user, password);
    
    // ----------------para enviar correo---------------------------------------
    
        String remitente = "visahermosa.contacto@gmail.com";
        String clave = "visahermosa";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.user", remitente);
        props.put("mail.smtp.clave", clave);

        javax.mail.Session s = javax.mail.Session.getDefaultInstance(props);
        MimeMessage mensaje = new MimeMessage(s);
        out.print("<script> alert('Entramos')</script>");
        
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
            mensaje.setSubject("VISTA HERMOSA Creacion de Cuenta");
            
            String titulo="Bienvenido" + nombre + apellido + "";
            String cuerpo = "usuario: " + usuario + ""
                    + "password: " + passw + ""
                    + "correo: " + correo + ""
                    + " contacto" + num + "";
            out.print("<script> alert('"+passw+"')</script>");
            out.print("<script> alert('"+pass+"')</script>");
            mensaje.setText(cuerpo);
            /*Envio Mensaje de texto*/
            BodyPart parte1= new MimeBodyPart();
            BodyPart parte2= new MimeBodyPart();
            parte1.setContent("<b>"+titulo+"</b>", "text/html");
            parte2.setContent("<b>"+cuerpo+"</b>", "text/html");

            MimeMultipart todaslasPartes = new MimeMultipart();
            todaslasPartes.addBodyPart(parte1);
            todaslasPartes.addBodyPart(parte2);
            mensaje.setContent(todaslasPartes);

            Transport transport = s.getTransport("smtp");
            transport.connect("smtp.gmail.com", remitente, clave);
            transport.sendMessage(mensaje, mensaje.getAllRecipients());
            transport.close();
            System.out.println("Correo Enviado");
            out.print("<script> alert('Correo Enviado Exitosamente')</script>");
            request.getRequestDispatcher("index.html").forward(request, response);
        

    //------------Ingreso y creacion de Usuario del Cliente---------------------
   /*
    try {
        PreparedStatement stmt = con.prepareStatement(""
                + "declare "
                + "begin"
                + "   INGRESAR_USUARIO(?,?,?,?);"
                + "   commit;"
                + "end;");
        //pedir los parametros para enviar al metodo
        stmt.setInt(1, 200);//1 codigo = 100  
        stmt.setString(4, "" + usuario + " " + pass + " " + 3 + " null ");
        //"usuario, nombre, apellido, nacionalidad"); 
        cont = cont + 1;
    } catch (Exception e) {
        e.printStackTrace();
    }

    //--------------------Ingreso del Cliente---------------------------------------
    if (cont == 1) {
        try {
            //consulta del id del cliente recien ingresado
            db.query.execute("SELECT ID_USER into v_idUsuario FROM USUARIO WHERE USUARIO=" + usuario + "");
            ResultSet rs1 = db.query.getResultSet();
            int id_usuario = Integer.parseInt(rs1.getString(1));

            //Ingreso del Cliente
            try {
                PreparedStatement stmt = con.prepareStatement(""
                        + "declare "
                        + "begin"
                        + "   INGRESAR_CLIENTE(?,?,?,?);"
                        + "   commit;"
                        + "end;");
                //pedir los parametros para enviar al metodo
                stmt.setInt(1, 200);//1 codigo = 100  
                stmt.setString(4, " " + id_usuario + " " + nombre + " " + apellido + " " + nacionalidad + " ");
                //"usuario, nombre, apellido, nacionalidad"); 
                cont = cont + 1;
            } catch (Exception e) {
                e.printStackTrace();
            }

            db.desconectar();
        } catch (Exception e) {
            out.println(e);
            e.printStackTrace();
        }
    }
    //------------------Ingreso de contacto del Cliente-------------------------
    if (cont == 2) {
        try {
            //consulta del id del cliente recien ingresado
            db.query.execute("SELECT ID_CLIENTE FROM CLIENTE WHERE ID_USER=" + usuario + "");
            ResultSet rs2 = db.query.getResultSet();
            int id_cliente = Integer.parseInt(rs2.getString(1));

            //Ingreso de Usuario e imagen
            try {
                PreparedStatement stmt = con.prepareStatement(""
                        + "declare "
                        + "begin"
                        + "   INGRESAR_CNTCLIENTE(?,?,?);"
                        + "   commit;"
                        + "end;");
                //pedir los parametros para enviar al metodo
                stmt.setInt(1, 200);//1 codigo = 100  
                stmt.setString(3, "" + 1 + " " + correo + " " + id_cliente + "");
                stmt.setString(3, "" + 2 + " " + num + " " + id_cliente + "");
                //"usuario, nombre, apellido, nacionalidad"); 
                cont = cont + 1;
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("index.html").forward(request, response);
            db.desconectar();
        } catch (Exception e) {
            out.println(e);
            e.printStackTrace();
        }
    }
            */ 
    
    
%>
