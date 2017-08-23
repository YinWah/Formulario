<%-- 
    Document   : Altas
    Created on : 22/08/2017, 08:05:49 PM
    Author     : Yin Wah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@page import="java.io.*,java.sql.*" %> 
        <%
            String nombre = request.getParameter("Nombre");
            String paterno = request.getParameter("Paterno");
            String materno = request.getParameter("Materno");
            String edad = request.getParameter("Edad");
            String escuela = request.getParameter("Escuela");
            
            Connection con = null;
            Statement sta = null;
            ResultSet r= null;
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/formulario","root","n0m3l0");
                sta = con.createStatement();
                 sta.executeUpdate("insert into Datos values('"+nombre+"','"
                        +paterno+"','"
                        +materno+"','"
                        +edad+"','"
                        +escuela+"')");
                 %>
                <script>alert('Registro listo')</script>
                <%
                con.close();
                response.sendRedirect("index.html");
            }
            catch(SQLException error){
                out.print(error.toString());
            }
            %> 
    </body>
</html>
