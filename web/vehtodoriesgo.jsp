<%-- 
    Document   : vehtodoriesgo
    Created on : 28/05/2020, 10:14:03 AM
    Author     : Mindchift
--%>

<%@page import="BaseDatos.Conectar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id_persona = "";
    if (request.getParameter("id_persona") != null) {
        id_persona = request.getParameter("id_persona");
    }
    Statement consulta = null;
    ResultSet rs = null;
    Conectar con = new Conectar();
    String sql = "select placa from vehiculo where id_persona ='"
            + id_persona + "'";
    consulta = con.conn.createStatement();
    rs = consulta.executeQuery(sql);
    String cad = "";
    while (rs.next()) {
        cad = cad + rs.getString("placa") + "&";
    }
    out.print(cad);
%>