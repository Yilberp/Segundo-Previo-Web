<%-- 
    Document   : registrarpersona
    Created on : 24/05/2020, 03:18:56 PM
    Author     : Mindchift
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<% 
if(session.getAttribute("usuario")==null){
    response.sendRedirect("login.jsp");
    return;    
}
    
%>
<!DOCTYPE html>
<html lang="es">
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
        
        <%@include file="layout/header.html"%>
        <section class="login">
            <article class="login__content">
                <div class="login__form">
                    <form action="mensaje.jsp" method="get">
                        <div class="login__form__content">
                            <h2 class="login__form__content--h2">Registrar propietario</h2>
                            <div class="login__form__container-cmp">
                                <input class="login__form__content--cmp" type="number" id="cedula" name="cedula" placeholder="Cédula" required>
                            </div>
                            <div class="login__form__container-cmp">
                                <input class="login__form__content--cmp" type="text" id="nombre" name="nombre" placeholder="Nombre" required>
                            </div>
                            <div class="login__form__container-cmp">
                                <input class="login__form__content--cmp" type="number" id="telefono" name="telefono" placeholder="Teléfono" required>
                            </div>
                            <div class="login__form__container-cmp">
                                <input class="login__form__content--cmp" type="number" id="edad" name="edad" placeholder="Edad" required>
                            </div>
                            <select class="combobox" name="estadoCivil" id="estadocivil">
                                <option value="soltero/a">Soltero</option>
                                <option value="casado/a">Casado</option>
                                <option value="separado/a">Separado</option>
                                <option value="viudo/a">Viudo</option>                      
                            </select>
                            <div class="login__form__container-cmp">
                                <input class="login__form__content--cmp" type="text" id="direccion" name="direccion" placeholder="Dirección" required>
                            </div>

                            <input class="login__form__content--btn" type="submit" name="regpersona" id="regpersona" value="Registrar">
                        </div>
                    </form>
                </div>
                <figure class="login__fig">
                    <img class="login__img" src="imagen/imgregpersona.jpeg">
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
