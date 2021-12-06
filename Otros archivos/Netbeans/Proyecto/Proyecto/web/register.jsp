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
    
    
    String foto = null;
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String nacionalidad = request.getParameter("nacionalidad");
    String correo = request.getParameter("email");
    String num = request.getParameter("phone");
    String usuario = request.getParameter("user");
    String pass = request.getParameter("pass");
    String passw = request.getParameter("passv");
    

    Dba db = new Dba(); //Instancia clase DBA
    db.Conectar();

   

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

    try {
        mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
        mensaje.setSubject("VISTA HERMOSA Creacion de Cuenta");

        String titulo = "Bienvenid@ "+"  "+nombre+"  "+apellido + "";
        String cuerpo1 = "usuario: " +"  "+usuario + "";
        String cuerpo2 = "password:"+"  "+passw + "";
        String cuerpo3 = "correo: " +"  "+correo + "";
        String cuerpo4 = " contacto" +"  "+num + "";
        String cuerpo5 = "nacionalidad" +"  "+nacionalidad + "";

        mensaje.setText(titulo);
        mensaje.setText(cuerpo1);
        mensaje.setText(cuerpo2);
        mensaje.setText(cuerpo3);
        mensaje.setText(cuerpo4);
        mensaje.setText(cuerpo5);
        /*Envio Mensaje de texto*/
        BodyPart parte1 = new MimeBodyPart();
        BodyPart parte2 = new MimeBodyPart();
        BodyPart parte3 = new MimeBodyPart();
        BodyPart parte4 = new MimeBodyPart();
        BodyPart parte5 = new MimeBodyPart();
        parte1.setContent("<b>" + titulo + "</b><br>", "text/html");
        parte2.setContent("<b>" + cuerpo1 + "</b><br>", "text/html");
        parte3.setContent("<b>" + cuerpo2 + "</b><br>", "text/html");
        parte4.setContent("<b>" + cuerpo3 + "</b><br>", "text/html");
        parte5.setContent("<b>" + cuerpo4 + "</b>", "text/html");

        MimeMultipart todaslasPartes = new MimeMultipart();
        todaslasPartes.addBodyPart(parte1);
        todaslasPartes.addBodyPart(parte2);
        todaslasPartes.addBodyPart(parte3);
        todaslasPartes.addBodyPart(parte4);
        todaslasPartes.addBodyPart(parte5);
        mensaje.setContent(todaslasPartes);

        Transport transport = s.getTransport("smtp");
        transport.connect("smtp.gmail.com", remitente, clave);
        transport.sendMessage(mensaje, mensaje.getAllRecipients());
        transport.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    //------------Ingreso y creacion de Usuario del Cliente---------------------
    
        try {
            PreparedStatement stmt = con.prepareStatement(""
                    + "declare "
                    + "begin"
                    + "   INGRESAR_USUARIO(?,?,?,?);"
                    + "   commit;"
                    + "end;");
            //pedir los parametros para enviar al metodo
            stmt.setString(1, usuario);
            stmt.setString(2, pass);
            stmt.setInt(3, 3);
            stmt.setString(4, foto);
            //"usuario, nombre, apellido, nacionalidad"); 
            out.print("<script> alert('Usuario creado Exitosamente')</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    
   


%>
