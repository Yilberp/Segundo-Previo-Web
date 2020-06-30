package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <script src=\"https://code.jquery.com/jquery-3.2.1.min.js\"\n");
      out.write("        integrity=\"sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <title>Polizas de Seguro | Segundo Previo web</title>\n");
      out.write("        <script>\n");
      out.write("            var ajax;\n");
      out.write("            function Mifuncion(corredor) {\n");
      out.write("                //compatibilidad del navegador\n");
      out.write("                if (window.XMLHttpRequest)\n");
      out.write("                    ajax = new XMLHttpRequest();\n");
      out.write("                else\n");
      out.write("                    ajax = new ActiveXObject(\"Microsoft.XMLHTTP\");\n");
      out.write("                ajax.onreadystatechange = resultadoContacto;\n");
      out.write("                ajax.open(\"GET\", \"comision.jsp?corredor=\" + corredor, true);\n");
      out.write("                ajax.send(\"\");\n");
      out.write("            }\n");
      out.write("            function resultadoContacto() {\n");
      out.write("                //si fue completado\n");
      out.write("                if (ajax.readyState == 4)\n");
      out.write("                    if (ajax.status == 200) //si fue correcto\n");
      out.write("                    {\n");
      out.write("                        var x = document.getElementById(\"cantidad\");\n");
      out.write("                        var cad = ajax.responseText;\n");
      out.write("                        x.innerHTML = cad;\n");
      out.write("                    }\n");
      out.write("            }\n");
      out.write("        </script>\n");
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
      out.write("        </div>\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("        <h3 class=\"inicio__text--msj\">Bienvenido, ");
      out.print(session.getAttribute("usuario"));
      out.write("</h3>\n");
      out.write("        <section class=\"inicio\">\n");
      out.write("            <article class=\"inicio__content\">\n");
      out.write("                <div class=\"inicio__text\">\n");
      out.write("                    <h1 class=\"inicio__text--msj\">Aplicativo web de Poliza de seguros</h1>\n");
      out.write("                    <p class=\"inicio__text--descripcion\">\n");
      out.write("                        Cotiza, compara y compra tu Seguro SOAT o Todo Riesgo\n");
      out.write("                        sin salir de casa\n");
      out.write("                    </p>\n");
      out.write("                    <div class=\"inicio__boton\">\n");
      out.write("                        <button class=\"inicio__boton--login\" value=\"");
      out.print(session.getAttribute("usuario"));
      out.write("\" onclick=\"Mifuncion(this.value)\">Comisión ");
      out.print(session.getAttribute("usuario"));
      out.write("</button>\n");
      out.write("                        <p class=\"inicio__boton--p\" id=\"cantidad\"></p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <figure class=\"inicio__fig\">\n");
      out.write("                    <img class=\"inicio__picture\" src=\"imagen/foto.jpeg\">\n");
      out.write("                </figure>\n");
      out.write("            </article>\n");
      out.write("        </section>\n");
      out.write("        ");
      out.write("<footer class=\"footer\">\n");
      out.write("    <p class=\"footer__text\">Copyrigth |\n");
      out.write("    <p class=\"footer__text--bold\">  2020 YILBER PATI&Ntilde;O 1151509 Yeferson Ascanio 1151507</p>\n");
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
