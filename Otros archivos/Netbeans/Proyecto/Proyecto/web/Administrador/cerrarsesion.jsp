<%-- 
    Document   : cerrarsesion
    Created on : 05-dic-2021, 21:46:21
    Author     : kgmez
--%>


<%
                session.invalidate();
                response.sendRedirect("../index.html");

%>
