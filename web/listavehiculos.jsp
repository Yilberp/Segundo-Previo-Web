<%-- 
    Document   : listavehiculos.jsp
    Created on : 26/05/2020, 08:39:29 PM
    Author     : Mindchift
--%>

<%@page import="BaseDatos.Persona_Poliza"%>
<%@page import="java.sql.ResultSet"%>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <title>Polizas de Seguro | Segundo Previo web</title>
    </head>
    <body>
        <%@include file="layout/header.html"%>
        <section class="lista">
		<article class="lista__content">
			<h1 style="padding-bottom: .5em">Lista de Vehiculos asegurados por corredor</h1>
			<table  class="table table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Placa</th>
						<th scope="col">Modelo</th>
						<th scope="col">Marca</th>
						<th scope="col">Serial</th>
						<th scope="col">Valor</th>
						<th scope="col">Propietario</th>
					</tr>
				</thead>
				<tbody >
					<%
                                Persona_Poliza p = new Persona_Poliza();
                                String cad = session.getAttribute("usuario").toString();
                                ResultSet rs = p.buscarTexto(cad);
                                int contador = 0;
                                while (rs.next()) {
                                    contador++;
                                    out.print("<tr>"
                                            + "<td>"+ contador + "</td>"
                                            + "<td>"+ rs.getString("placa") + "</td>"
                                            + "<td>"+ rs.getString("modelo") + "</td>"
                                            + "<td>"+ rs.getString("marca") + "</td>"
                                            + "<td>"+ rs.getString("serial") + "</td>"
                                            + "<td>"+ rs.getString("valor") + "</td>"
                                            + "<td>"+ rs.getString("id_persona") + "</td></tr>");
                                }                
                           %>
				</tbody>
			</table>
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
