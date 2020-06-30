<%-- 
    Document   : registrarvehiculo
    Created on : 24/05/2020, 06:52:38 PM
    Author     : Mindchift
--%>

<%@page import="BaseDatos.Vehiculo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="BaseDatos.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<% 
if(session.getAttribute("usuario")==null){
    response.sendRedirect("login.jsp");
    return;    
}
    
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="ico/png" href="imagen/ico.png">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="scss/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <title>Polizas de Seguro | Segundo Previo web</title>
        <script>
            var ajax;
            function Mifuncion(MARCA) {
                //compatibilidad del navegador
                if (window.XMLHttpRequest)
                    ajax = new XMLHttpRequest();
                else
                    ajax = new ActiveXObject("Microsoft.XMLHTTP");
                ajax.onreadystatechange = resultadoContacto;
                ajax.open("GET", "modelo.jsp?MARCA=" + MARCA, true);
                ajax.send("");
            }
            function resultadoContacto() {
                //si fue completado
                if (ajax.readyState == 4)
                    if (ajax.status == 200) //si fue correcto
                    {
                        var x = document.getElementById("modelo");
                        x.options.length = 0;
                        var cad = ajax.responseText;
                        var res = cad.split("&");
                        for (a in res) {
                            if (res[a].localeCompare("") != 0) {
                                var option = document.createElement("option");
                                option.text = res[a];
                                x.add(option);
                            }
                        }
                    }
            }
        </script>
    </head>
    <body>
        <%@include file="layout/header.html"%>
        <section class="login">
            <article class="login__content">
                <div class="login__form">
                    <form action="mensajevehiculo.jsp" method="get">
                        <div class="login__form__content">
                            <h2 class="login__form__content--h2">Registrar vehiculo</h2>
                            <div class="login__form__container-cmp">
                                <input class="login__form__content--cmp" type="text" id="placa" name="placa" placeholder="Placa" required>
                            </div>
                            <select class="combobox" name="marca" id="marca" onchange="Mifuncion(this.value)">
                                <%
                                    Vehiculo va = new Vehiculo();
                                    ResultSet rs3 = va.buscarMarca();
                                    while (rs3.next()) {
                                        out.print("<option value='" + rs3.getString("MARCA") + "'>"
                                                + rs3.getString("MARCA") +"</option>");
                                    }
                                %>
                                <script>
                                    let primeracarga = document.getElementById("marca").value;
                                    window.onload = Mifuncion(primeracarga);
                                </script>
                            </select>
                            <select class="combobox" name="modelo" id="modelo">
                                                  
                            </select>
                            <div class="login__form__container-cmp">
                                <input class="login__form__content--cmp" type="text" id="serial" name="serial" placeholder="Serial Carroceria" required>
                            </div>
                            <select class="combobox" name="propietario" id="propietario">
                                <%
                                    Persona p = new Persona();
                                    String cad = "";
                                    ResultSet rs2 = p.buscarTexto2();
                                    while (rs2.next()) {
                                        out.print("<option value='" + rs2.getString("cedula") + "'>"
                                                + rs2.getString("cedula") + " - " + rs2.getString("nombre") + "</option>");
                                    }
                                %>                   
                            </select>                    
                            <input class="login__form__content--btn" type="submit" name="regvehiculo" id="regvehiculo" value="Registrar">
                        </div>
                    </form>
                </div>
                <figure class="login__fig">
                    <img class="login__img" src="imagen/vehiculo.jpeg">
                </figure>
            </article>
        </section>

        <%@include file="layout/footer.html"%>
        <script>
            $(document).on('click', '#report', function ()
            {
                var nombre = document.getElementById('sub-menu');
                if (nombre.className === 'contenedor-reportes2')
                {
                    $('#sub-menu').removeClass();
                    $('#sub-menu').addClass('contenedor-reportes');
                } else {
                    $('#sub-menu').removeClass();
                    $('#sub-menu').addClass('contenedor-reportes2');
                }
            })
        </script>
    </body>
</html>
