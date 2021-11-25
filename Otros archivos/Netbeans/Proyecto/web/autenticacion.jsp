<%@page import="java.sql.*"%> 
<%@page import="database.*"%>
<%  
            try{
              Dba db =new Dba(); //en la clase dba poner el user y pass
               db.Conectar();
           db.query.execute("select USUARIO, PASS, ID_TIPO from hotel.USUARIO");
           ResultSet rs=db.query.getResultSet();
           String centinela="n";
           
           while(rs.next()){ 
              
            if( request.getParameter("username").equals(rs.getString(1))  &&
            request.getParameter("password").equals(rs.getString(2))){
                String r=rs.getString(3);
                if(r.equals("1")){
                    request.getRequestDispatcher("Administrador/index.html").forward(request, response);
                }
                if(r.equals("2")){
                        request.getRequestDispatcher("Colaborador/index.html").forward(request, response);
                }
                if(r.equals("3")){
                        request.getRequestDispatcher("Cliente/index.html").forward(request, response);
                }
             
                                          centinela="s";
                    }
           }
           if(centinela.equals("s")){
            //Guardamos variables de sesión
            session.setAttribute("s_user", request.getParameter("username"));
            session.setAttribute("s_pass", request.getParameter("password"));
            //Llamando al jsp correspondiente
           }
           else{
               out.print("<script>alert('El usuario que ingresó no existe.')</script>");
               request.getRequestDispatcher("index.html").forward(request, response);
           }           
           db.desconectar();
           }
            catch(Exception e){     e.printStackTrace();      }
        %>