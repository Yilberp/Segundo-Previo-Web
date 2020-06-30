<%-- 
    Document   : login.jsp
    Created on : 26/05/2020, 08:51:54 PM
    Author     : Mindchift
--%>

<%@page import="BaseDatos.Corredor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
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
    </head>
    <body>
        <div class="container__index">
            <header class="header">
                <nav class="header__content">
                    <figure class="header__fig">
                        <a href="index.jsp">
                            <img class="header__picture" src="imagen/logo.png">
                        </a>
                    </figure>
                </nav>
                <div id="sub-menu" class="contenedor-reportes2">
                    <li class="contenedor-reportes--li">
                        <a class="contenedor-reportes--a" href="listavehiculos.jsp">Lista vehiculos</a>
                    </li>
                    <li class="contenedor-reportes--li">
                        <a class="contenedor-reportes--a" href="listavehiculosxpersona.jsp">Vehiculos de propietario</a>
                    </li>
                </div>
            </header>
            <section class="login">
                <article class="login__content">
                    <div class="login__form">
                        <form action="" method="post">
                            <div class="login__form__content">
                                <h2 class="login__form__content--h2">Iniciar sesión</h2>
                                <div class="login__form__container-cmp">
                                    <input class="login__form__content--cmp" type="text" id="usuario" name="usuario" placeholder="Usuario" required>
                                </div>
                                <div class="login__form__container-cmp">
                                    <input class="login__form__content--cmp" type="password" id="clave" name="clave" placeholder="Contraseña" required>
                                </div>
                                <input class="login__form__content--btn" type="submit" name="Boton" id="Boton" value="Continuar">
                                
                            </div>
                        </form>
                    </div>
                    <figure class="login__fig">
                        <img class="login__img" src="imagen/login.jpg">
                    </figure>
                </article>
            </section>
            <%@include file="layout/footer.html"%>
            <%
                if (request.getParameter("Boton") != null) {
                    Corredor c = new Corredor();
                    if (c.buscar(request.getParameter("usuario"), request.getParameter("clave"))) {
                        session.setAttribute("usuario", c.usuariocorredor);

                        response.sendRedirect("index.jsp");
                    } else {
                        out.print("Nombre de usuario o clave incorrecta...");
                    }
                }
            %>
    </body>
</html>
