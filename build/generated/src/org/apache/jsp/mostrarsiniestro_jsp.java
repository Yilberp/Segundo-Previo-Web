package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import BaseDatos.Persona_Poliza;
import java.sql.ResultSet;
import BaseDatos.Vehiculo;

public final class mostrarsiniestro_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/layout/header.html");
    _jspx_dependants.add("/layout/footer.html");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 
if(session.getAttribute("usuario")==null){
    response.sendRedirect("login.jsp");
    return;    
}
    

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"icon\" type=\"ico/png\" href=\"imagen/ico.png\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap\" rel=\"stylesheet\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"scss/style.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css\" integrity=\"sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk\" crossorigin=\"anonymous\">\n");
      out.write("\t<script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\" integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js\" integrity=\"sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI\" crossorigin=\"anonymous\"></script>\n");
      out.write("\t<script src=\"https://code.jquery.com/jquery-3.2.1.min.js\"\n");
      out.write("        integrity=\"sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <title>Polizas de Seguro | Segundo Previo web</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("<div class=\"container__index\">\n");
      out.write("    <header class=\"header\">\n");
      out.write("        <nav class=\"header__content\">\n");
      out.write("            <figure class=\"header__fig\">\n");
      out.write("                <a href=\"index.jsp\">\n");
      out.write("                    <img class=\"header__picture\" src=\"imagen/logo.png\">\n");
      out.write("                </a>\n");
      out.write("            </figure>\n");
      out.write("            <ul class=\"header__menu\">\n");
      out.write("                <li class=\"header__item\">\n");
      out.write("                    <a class=\"header__item--a\" href=\"registrarpersona.jsp\">Cliente</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"header__item\">\n");
      out.write("                    <a class=\"header__item--a\" href=\"registrarvehiculo.jsp\">Veh&iacute;culo</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"header__item\">\n");
      out.write("                    <a class=\"header__item--a\" href=\"regsoat.jsp\">Poliza SOAT</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"header__item\">\n");
      out.write("                    <a class=\"header__item--a\" href=\"regtodoriesgo.jsp\">Poliza Todo Riesgo</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"header__item\">\n");
      out.write("                    <span style=\"cursor: pointer\" id=\"report\" class=\"header__item--a\">Reportes</span>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"header__item\">\n");
      out.write("                    <a class=\"header__item--a\" href=\"cerrar.jsp\">Cerrar Sesion</a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("        <div id=\"sub-menu\" class=\"contenedor-reportes2\">\n");
      out.write("            <li class=\"contenedor-reportes--li\">\n");
      out.write("                <a class=\"contenedor-reportes--a\" href=\"listavehiculos.jsp\">Lista vehiculos</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"contenedor-reportes--li\">\n");
      out.write("                <a class=\"contenedor-reportes--a\" href=\"listavehiculosxpersona.jsp\">Vehiculos de propietario</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"contenedor-reportes--li\">\n");
      out.write("                <a class=\"contenedor-reportes--a\" href=\"mostrarsiniestro.jsp\">Pago Siniestros</a>\n");
      out.write("            </li>\n");
      out.write("        </div>\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("        <section class=\"lista\">\n");
      out.write("\t\t<article class=\"lista__content\">\n");
      out.write("\t\t\t<h1 style=\"padding-bottom: .5em\">Lista de Vehiculos por persona</h1>\n");
      out.write("\t\t\t<form class=\"form-group\">\n");
      out.write("\t\t\t\t<select class=\"combobox\" name=\"todoriesgo\" id=\"todoriesgo\" onchange=\"Mifuncion(this.value)\">\n");
      out.write("                                ");

                                    Persona_Poliza p = new Persona_Poliza();
                                    ResultSet rs2 = p.buscarTODORIESGO();
                                    while (rs2.next()) {
                                        out.print("<option value='" + rs2.getString("id_persona") + "'>"
                                                + rs2.getString("id_persona")+"</option>");
                                    }
                                
      out.write("\n");
      out.write("                            </select>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t</form>\n");
      out.write("\t\t\t<table  class=\"table table-striped\">\n");
      out.write("\t\t\t\t<thead>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<th scope=\"col\">#</th>\n");
      out.write("\t\t\t\t\t\t<th scope=\"col\">Placa</th>\n");
      out.write("\t\t\t\t\t\t<th scope=\"col\">Modelo</th>\n");
      out.write("\t\t\t\t\t\t<th scope=\"col\">Marca</th>\n");
      out.write("\t\t\t\t\t\t<th scope=\"col\">Serial</th>\n");
      out.write("\t\t\t\t\t\t<th scope=\"col\">Valor</th>\n");
      out.write("\t\t\t\t\t\t<th scope=\"col\">Propietario</th>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t</thead>\n");
      out.write("\t\t\t\t<tbody id=\"salida\">\n");
      out.write("\t\t\t\t\t");

                        Vehiculo v = new Vehiculo();
                        String cad="";
                        if(request.getParameter("Boton")!=null)
                            cad=request.getParameter("Texto");
                        ResultSet rs = v.buscarTexto2(cad);
                        int contador = 0;
                        while (rs.next()) {
                            contador++;
                            out.print("<tr>"
                                    + "<td>" + contador + "</td>"
                                    + "<td>" + rs.getString("placa") + "</td>"
                                    + "<td>" + rs.getString("modelo") + "</td>"
                                    + "<td>" + rs.getString("marca") + "</td>"
                                    + "<td>" + rs.getString("serial") + "</td>"
                                    + "<td>" + rs.getString("valor") + "</td>"
                                    + "<td>" + rs.getString("id_persona") + "</td></tr>");
                        }
                    
      out.write("\n");
      out.write("\t\t\t\t</tbody>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</article>\n");
      out.write("\t</section>\n");
      out.write("        ");
      out.write("<footer class=\"footer\">\n");
      out.write("    <p class=\"footer__text\">Copyrigth |\n");
      out.write("    <p class=\"footer__text--bold\">  2020 YILBER PATI&Ntilde;O 1151509 YEFERSON ASCANIO 1151507</p>\n");
      out.write("</p>\n");
      out.write("</footer>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("\t\t$(document).on('click', '#report', function()\n");
      out.write("\t\t{\n");
      out.write("\t\t\tvar nombre = document.getElementById('sub-menu');\n");
      out.write("\t\t\tif (nombre.className === 'contenedor-reportes2')\n");
      out.write("\t\t\t{\n");
      out.write("\t\t\t\t$('#sub-menu').removeClass();\n");
      out.write("\t\t\t\t$('#sub-menu').addClass('contenedor-reportes');\n");
      out.write("\t\t\t} else {\n");
      out.write("\t\t\t\t$('#sub-menu').removeClass();\n");
      out.write("\t\t\t\t$('#sub-menu').addClass('contenedor-reportes2');\n");
      out.write("\t\t\t}\n");
      out.write("\t\t})\n");
      out.write("\t\t\n");
      out.write("\t</script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
