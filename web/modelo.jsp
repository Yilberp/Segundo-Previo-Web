<%-- 
    Document   : modelo
    Created on : 28/05/2020, 08:49:24 AM
    Author     : Mindchift
--%>
<%@page import="BaseDatos.Conectar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String marca = "";
    if (request.getParameter("MARCA") != null) {
        marca = request.getParameter("MARCA");
    }
    Statement consulta = null;
    ResultSet rs = null;
    Conectar con = new Conectar();
    String sql = "select MODELO from tabla where MARCA ='"
            + marca + "'";
    consulta = con.conn.createStatement();
    rs = consulta.executeQuery(sql);
    String cad = "";
    while (rs.next()) {
        cad = cad + rs.getString("MODELO") + "&";
    }
    out.print(cad);
%>