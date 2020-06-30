<%-- 
    Document   : mensaje
    Created on : 25/05/2020, 02:26:07 PM
    Author     : Mindchift
--%>
<%@page import="BaseDatos.Persona"%>
<%@page session="true" %>
<% 
if(session.getAttribute("usuario")==null){
    response.sendRedirect("login.jsp");
    return;    
}
    
%>
<head>
    <link rel="icon" type="ico/png" href="imagen/ico.png">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="scss/style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"
    integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <title>Polizas de Seguro | Segundo Previo web</title>
</head>
<div id="ventanaemergente" class="ocultar">
    <div class="oscuro"></div>
    <div  class="ventana-emergente__content">
        <div style="text-align: center; margin: 0 auto;">
            <h1 class="ventana-emergente--h1" id="titulo"></h1>
            <p class="ventana-emergente--p" id="menper"></p>
            <span id="cerrar" onclick="red2()" style="color: red; cursor: pointer">Volver</span>
        </div>
    </div>
</div>
<%
    if (request.getParameter("regpersona") != null) {
        if (request.getParameter("cedula") != ""
                && request.getParameter("nombre") != ""
                && request.getParameter("direccion") != ""
                && request.getParameter("telefono") != ""
                && request.getParameter("edad") != "") {
            Persona p = new Persona();
            if (p.buscar(request.getParameter("cedula"))) {
%>
        <script>
            document.getElementById("titulo").innerHTML = "La persona ya existe, registrar una nueva.";
        </script>
<%
            } else {
                p.nuevo(request.getParameter("cedula"), request.getParameter("nombre"), request.getParameter("edad"),
                        request.getParameter("telefono"), request.getParameter("direccion"), request.getParameter("estadoCivil"));
%>
        <script>
            document.getElementById("titulo").innerHTML = "Registro agregado correctamente";
            var texto2 = document.getElementById("menper");
            let params = new URLSearchParams(location.search);
            var contract = params.get('nombre');
            texto2.innerHTML = contract;
        </script>
<%
            }
        }
    }
%>

<script>
    function dos()
    {
        var nombre2 = document.getElementById('ventanaemergente');
        if (nombre2.className === 'ocultar')
        {
            $('#ventanaemergente').removeClass();
            $('#ventanaemergente').addClass('ventana-emergente');
        }
    }
    $(document).on('click', '#cerrar', function tres()
    {
        var nombre2 = document.getElementById('ventanaemergente');
        if (nombre2.className === 'ventana-emergente')
        {
            $('#ventanaemergente').removeClass();
            $('#ventanaemergente').addClass('ocultar');
        } else {
            $('#ventanaemergente').removeClass();
            $('#ventanaemergente').addClass('ventana-emergente');
        }

    });
    function red2() {
        location.href = "registrarpersona.jsp";
    }
    window.onload = dos;
</script>
