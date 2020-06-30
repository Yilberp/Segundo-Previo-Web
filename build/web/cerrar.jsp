<%-- 
    Document   : cerrar
    Created on : 27/05/2020, 02:41:05 PM
    Author     : Mindchift
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<% 
if(session.getAttribute("usuario")!=null){
    session.removeAttribute("usuario");
    session.invalidate();
}
response.sendRedirect("login.jsp");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
