<%-- 
    Document   : index
    Created on : 24/05/2020, 03:08:47 PM
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
            function Mifuncion(corredor) {
                //compatibilidad del navegador
                if (window.XMLHttpRequest)
                    ajax = new XMLHttpRequest();
                else
                    ajax = new ActiveXObject("Microsoft.XMLHTTP");
                ajax.onreadystatechange = resultadoContacto;
                ajax.open("GET", "comision.jsp?corredor=" + corredor, true);
                ajax.send("");
            }
            function resultadoContacto() {
                //si fue completado
                if (ajax.readyState == 4)
                    if (ajax.status == 200) //si fue correcto
                    {
                        var x = document.getElementById("cantidad");
                        var cad = ajax.responseText;
                        x.innerHTML = cad;
                    }
            }
        </script>
    </head>
    <body>
        <%@include file="layout/header.html"%>
        <h3 class="inicio__text--msj">Bienvenido, <%=session.getAttribute("usuario")%></h3>
        <section class="inicio">
            <article class="inicio__content">
                <div class="inicio__text">
                    <h1 class="inicio__text--msj">Aplicativo web de Poliza de seguros</h1>
                    <p class="inicio__text--descripcion">
                        Cotiza, compara y compra tu Seguro SOAT o Todo Riesgo
                        sin salir de casa
                    </p>
                    <div class="inicio__boton">
                        <button class="inicio__boton--login" value="<%=session.getAttribute("usuario")%>" onclick="Mifuncion(this.value)">Comisión <%=session.getAttribute("usuario")%></button>
                        <p class="inicio__boton--p" id="cantidad"></p>
                    </div>
                </div>
                <figure class="inicio__fig">
                    <img class="inicio__picture" src="imagen/foto.jpeg">
                </figure>
            </article>
        </section>
        <%@include file="layout/footer.html"%>
        <script>
		$(document).on('click', '#report', function()
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
