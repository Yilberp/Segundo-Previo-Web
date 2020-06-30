<%-- 
    Document   : mostrarsiniestro
    Created on : 28/05/2020, 09:22:13 AM
    Author     : Mindchift
--%>

<%@page import="BaseDatos.Persona_Poliza"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="BaseDatos.Vehiculo"%>
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
        <script>
            var ajax;
            function Mifuncion(id_persona) {
                //compatibilidad del navegador
                if (window.XMLHttpRequest)
                    ajax = new XMLHttpRequest();
                else
                    ajax = new ActiveXObject("Microsoft.XMLHTTP");
                ajax.onreadystatechange = resultadoContacto;
                ajax.open("GET", "vehtodoriesgo.jsp?id_persona=" + id_persona, true);
                ajax.send("");
            }
            function resultadoContacto() {
                //si fue completado
                if (ajax.readyState == 4)
                    if (ajax.status == 200) //si fue correcto
                    {
                        var x = document.getElementById("vehiculo");
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
        <section class="lista">
		<article class="lista__content">
			<h1 style="padding-bottom: .5em">Lista de Vehiculos por persona</h1>
			<form class="form-group">
				<select class="combobox" name="todoriesgo" id="todoriesgo" onchange="Mifuncion(this.value)">
                                <%
                                    Persona_Poliza p = new Persona_Poliza();
                                    ResultSet rs2 = p.buscarTODORIESGO();
                                    while (rs2.next()) {
                                        out.print("<option value='" + rs2.getString("id_persona") + "'>"
                                                + rs2.getString("id_persona")+"</option>");
                                    }
                                %>
                                <script>
                                    let primeracarga = document.getElementById("todoriesgo").value;
                                    window.onload = Mifuncion(primeracarga);
                                </script>
                            </select>
			<select class="combobox" name="vehiculo" id="vehiculo">
                                	
			 </select>	
                         <button type="submit" name="Boton" class="btn btn-primary mb-2">Buscar</button>
			</form>
			<table  class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Perdida Total</th>
						<th scope="col">Daños a terceros</th>
						<th scope="col">Gastos en salud</th>
					</tr>
				</thead>
				<tbody id="salida">
					<%
                        Persona_Poliza pp = new Persona_Poliza();
                        String cad="";
                        if(request.getParameter("Boton")!=null)
                            cad=request.getParameter("vehiculo");
                        ResultSet rs = pp.buscarValorVehiculo(cad);
                        if (rs.next()) {
                            int valor = Integer.parseInt(rs.getString("valor"));
                            int perdida= (int) (valor * 0.80);
                            int daños = (int) (valor * 0.90);
                            int gastos = (int) (valor * 0.60);
                            out.print("<tr>"
                                    + "<td>" + perdida + "</td>"
                                    + "<td>" + daños + "</td>"
                                    + "<td>" + gastos + "</td>"+"</tr>");
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
