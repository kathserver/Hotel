<%-- 
    Document   : registroCliente
    Created on : 06-dic-2021, 0:34:12
    Author     : kgmez
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.Dba"%>
<%@page import="java.sql.ResultSet"%>
<%
    String nombre = request.getParameter("uno");
    String apellido = request.getParameter("dos");
    String nacionalidad = request.getParameter("tres");
    String usuario=request.getParameter("cuatro");
    Dba db = new Dba(); //Instancia clase DBA
    db.Conectar();
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String user = "hotel";
    String password = "mihotel";
    Connection con = DriverManager.getConnection(url, user, password);
try {
            //consulta del id del cliente recien ingresado
            db.query.execute("SELECT ID_USER into v_idUsuario FROM USUARIO WHERE USUARIO=" + usuario + "");
            ResultSet rs1 = db.query.getResultSet();
            int iduser = Integer.parseInt(rs1.getString(1));

            //Ingreso del Cliente
            try {
                PreparedStatement stmt = con.prepareStatement(""
                        + "declare "
                        + "begin"
                        + "   INGRESAR_CLIENTE(?,?,?,?);"
                        + "   commit;"
                        + "end;");
                //pedir los parametros para enviar al metodo
                stmt.setInt(1, iduser);
                stmt.setString(2, nombre);
                stmt.setString(3, apellido);
                stmt.setString(4, nacionalidad);
                //"usuario, nombre, apellido, nacionalidad"); 
            } catch (Exception e) {
                e.printStackTrace();
            }

            db.desconectar();
        } catch (Exception e) {
            out.println(e);
            e.printStackTrace();
        }
%>
