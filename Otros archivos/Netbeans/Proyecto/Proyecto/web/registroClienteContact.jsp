<%-- 
    Document   : registroCliente
    Created on : 06-dic-2021, 0:24:54
    Author     : kgmez
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
 //------------------Ingreso de contacto del Cliente-------------------------
    String usuario=request.getParameter("cinco");
    String num = request.getParameter("seis");
    int tipo = Integer.parseInt(request.getParameter("siete"));
    Dba db = new Dba(); //Instancia clase DBA
    db.Conectar();
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String user = "hotel";
    String password = "mihotel";
    Connection con = DriverManager.getConnection(url, user, password);
        try {
            //consulta del id del cliente recien ingresado
            db.query.execute("SELECT ID_CLIENTE FROM CLIENTE WHERE USUARIO=" + usuario + "");
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
                stmt.setInt(1, tipo);
                stmt.setInt(2, id_cliente);
                stmt.setString(3, num);
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

