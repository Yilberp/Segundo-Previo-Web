<%-- 
    Document   : vehiculosreg
    Created on : 25/05/2020, 08:07:34 PM
    Author     : Mindchift
--%>

<%@page import="BaseDatos.Conectar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String cedula = "";
    if (request.getParameter("cedula") != null) {
        cedula = request.getParameter("cedula");
    }
    Statement consulta = null;
    ResultSet rs = null;
    Conectar con = new Conectar();
    String sql = "select placa from vehiculo where id_persona ='"
            + cedula + "'";
    consulta = con.conn.createStatement();
    rs = consulta.executeQuery(sql);
    String cad = "";
    while (rs.next()) {
        cad = cad + rs.getString("placa") + "&";
    }
    out.print(cad);
%>