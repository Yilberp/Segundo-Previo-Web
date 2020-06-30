<%-- 
    Document   : comision
    Created on : 27/05/2020, 07:18:28 PM
    Author     : Mindchift
--%>


<%@page import="BaseDatos.Corredor"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="BaseDatos.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String corredor = "";
    if (request.getParameter("corredor") != null) {
        corredor = request.getParameter("corredor");
    }
    Conectar con = new Conectar();
    Statement consulta = null;
    ResultSet rs = null;
    consulta = con.conn.createStatement();
    rs = consulta.executeQuery("SELECT SUM((totalPagar * 0.15)) AS comision from persona_poliza WHERE id_corredor ='" + corredor + "'");
    String cad = "";
    if (rs.next()) {
        cad = rs.getString("comision");
    }
    Corredor c = new Corredor();
    c.modificar(cad, session.getAttribute("usuario").toString());
    out.print(cad);
%>