<%-- 
    Document   : mensajeregsoat
    Created on : 25/05/2020, 10:45:46 PM
    Author     : Mindchift
--%>
<%@page import="BaseDatos.Persona_Poliza"%>
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
    if (request.getParameter("regsoat") != null) {
        if (request.getParameter("persona") != "" && request.getParameter("vehiculo") != "") {
            Persona_Poliza pp = new Persona_Poliza();
            if (pp.buscarS(request.getParameter("persona"),request.getParameter("vehiculo"))) {
%>
        <script> 
            document.getElementById("titulo").innerHTML = "El soat ya existe, registrar uno nuevo.";
        </script>
<%
            } else {
                pp.nuevoS(request.getParameter("persona"), request.getParameter("vehiculo"),session.getAttribute("usuario").toString());
%>
        <script>
            document.getElementById("titulo").innerHTML = "Soat agregado correctamente";
            var texto2 = document.getElementById("menper");
            let params = new URLSearchParams(location.search);
            var contract = params.get('persona');
            var contract2 = params.get('vehiculo');
            texto2.innerHTML = contract2 + " - " + contract;
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
        location.href = "regsoat.jsp";
    }
    window.onload = dos;
</script>
