<%-- 
    Document   : autenticacion
    Created on : 03-13-2020, 02:09:01 AM
    Author     : Stheph
--%>

<%@page import="java.sql.*"%> 
<%@page import="database.*"%>
<%  
            try{

           Dba db =new Dba(); //en la clase dba poner el user y pass
           db.Conectar();
           ResultSet rs=db.query.getResultSet();
           String centinela="n";
           while(rs.next()){ 
            if( request.getParameter("username").equals(rs.getString(1) )  &&
            request.getParameter("password").equals(rs.getString(2))){
                if(rs.getString(3).equals(1)){
                    request.getRequestDispatcher("../Administrador/index.jsp").forward(request, response);
                }
                if(rs.getString(3).equals(2)){
                    request.getRequestDispatcher("../Colaborador/index.jsp").forward(request, response);
                }
                if(rs.getString(3).equals(3)){
                    request.getRequestDispatcher("../Cliente/index.jsp").forward(request, response);
                }
             
                                          centinela="s";
                    }
           }
           if(centinela.equals("s")){
            //guardar variables de session
            session.setAttribute("s_user", request.getParameter("username"));
            session.setAttribute("s_pass", request.getParameter("password"));
           }
           else{
               out.print("<div class=\"swal-modal\" role=\"dialog\" aria-modal=\"true\"><div class=\"swal-icon swal-icon--error\">"
                       + "<div class=\"swal-icon--error__x-mark\">"
                       + "<span class=\"swal-icon--error__line swal-icon--error__line--left\"></span>"
                       + "<span class=\"swal-icon--error__line swal-icon--error__line--right\"></span>"
                       + "</div></div><div class=\"swal-title\" style=\"\">Oh No!</div>"
                       + "<div class=\"swal-text\" style=\"\">El usuario no existe, Preciona el botón Ok!</div>"
                       + "<div class=\"swal-footer\"><div class=\"swal-button-container\">"
                       + "<button class=\"swal-button swal-button--confirm\">OK</button>"
                       + "<div class=}\"swal-button__loader}\"><div></div><div></div><div></div></div>");
               request.getRequestDispatcher("index.html").forward(request, response);
           }           
           db.desconectar();
           }
            catch(Exception e){     e.printStackTrace();      }
        %>




