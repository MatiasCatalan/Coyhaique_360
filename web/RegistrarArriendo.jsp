<%-- 
    Document   : RegistrarVenta
    Created on : 22-may-2018, 13:20:43
    Author     : Luis Carcamo Espinoza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Clase.*" %>
<%@page import="java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/RegistrarArriendo.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />

        <script type="text/javascript" src="js/Catalogo.js"></script>
        <link  href="css/lightbox.css" rel="stylesheet"  />

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <title>Coyhaique 360º</title>


        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/modal.css" rel="stylesheet">

        <meta property="og:url" content="https://www.your-domain.com/your-page.html"/>
        <meta property="og:type" content="website"/>
        <meta property="og:title" content="Your Website Title"/>
        <meta property="og:description" content="Your description"/>
        <meta property="og:image" content="https://www.your-domain.com/path/image.jpg"/>

        <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,300,700&subset=latin,latin-ext"
              rel="stylesheet" type="text/css">
        <link href="assets/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="assets/libraries/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css">
        <link href="assets/libraries/chartist/chartist.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/leaflet.css" rel="stylesheet" type="text/css">
        <link href="assets/css/leaflet.markercluster.css" rel="stylesheet" type="text/css">
        <link href="assets/css/leaflet.markercluster.default.css" rel="stylesheet" type="text/css">
        <link href="assets/css/villareal-green.css" rel="stylesheet" type="text/css" id="css-primary">
        <link rel="shortcut icon" type="image/x-icon" href="assets/favicon.png">




    </head>



    <body onload="cargar()">

        <%
            String codigo = (String) session.getAttribute("parametroCodigo");

            Usuario usu = Usuario_DB.listarUsuarioPorCodigo(codigo);
            String clientee = usu.getNombreUsuario() + ", " + usu.getApellidosUsuario();
        %>
        <%
            String codigoArriendo = ObtenerCodigo.CodigoArriendo();
            String cliente = (String) session.getAttribute("parametroCliente");
        %>
        <form action="Servlet_Usu" method="post" id="frmCabecera">
            <input type="hidden" value="<%=usu.getTipoUsuario()%>" name="txtTipo" id="txtTipo">
            <table id="tablaCabecera">

                <nav class="navbar navbar-default navbar-fixed-top" role="navigation"> 
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                            <a class="navbar-brand" href="Catalogo.jsp">Coyhaique 360º</a>

                        <ul class="nav navbar-nav">
                            <li class="active"><a href="MiPerfil.jsp?codigoU=<%=usu.getCodigoUsuario()%>" class="link" id="lnkPerfil">Mi Cuenta<span class="sr-only">(current)</span></a></li>
                            <li><a href="RegistrarArriendo.jsp" class="link" id="lnkCompra">Mi carrito</a></li>
                            <li><a href="CuentaAdministrador.jsp" class="link" id="lnkAdm">Administrar</a></li>




                            <li><a href="contacto.jsp" class="link" id="lnkAdm">Contacto</a></li>
                            <li><a class="link" id="lnkUsu" <h5>BIENVENIDO(A): <%=usu.getTipoUsuario()%> SR(A)=<%=usu.getNombreUsuario()%>, <%=usu.getApellidosUsuario()%></h5> </a></li>
                        </ul>


                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
                        <ul class="nav navbar-nav navbar-right">

                            <li class="active"><a href="Login.jsp"  class="link" id="lnkLogin">INGRESAR<span class="sr-only">(current)</span></a></li>
                            <li class="active"><a href="Servlet_Usu?accion=logout" class="link" id="lnkLogout">SALIR<span class="sr-only">(current)</span></a></li>


                        </ul> 
                        </ul> 
                    </div><!-- /.navbar-collapse --> 
                </nav> 






                               <br>
                               <br>
                               <br>

            </table>

            <input type="hidden" name="accion" value="logout">
        </form>

        <form action="Servlet_Arriendo" method="post" id="frmRegistrarVenta" class="jumbotron boxlogin4">
            <br>
            <table  class="table table-bordered" class="jumbotron boxlogin5" id="tablaRegistrarVenta">
                <tr>
                    <th colspan="7" class="TituloDV">
                        <h3>CARRITO DE ARRIENDO</h3>
                        <input type="hidden" name="txtCodigoA" value="<%=codigoArriendo%>">
                    </th>
                </tr>
                <tr>
                    <th colspan="2" class="TituloDV">
                        CLIENTE :  
                    </th>
                    <td colspan="5" class="Contenido">
                        <%=cliente%>
                        <input type="hidden" name="txtCliente" value="<%=cliente%>" size="50" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td colspan="7" class="FilaEnBlanco">
                        <br>
                    </td>
                </tr>
                <tr>
                    <th class="TituloDV">
                        N°
                    </th>
                    <th class="TituloDV">
                        CANCHA 
                    </th>
                    <th class="TituloDV">
                        P/U (S/.)
                    </th>
                    <th class="TituloDV">
                        HORAS 
                    </th>
                    <th class="TituloDV">

                    </th>
                    <th class="TituloDV">
                        SUBTOTAL (S/.)
                    </th>
                    <th class="TituloDV">
                        OPCION
                    </th>
                </tr>

                <%
                    DecimalFormat df = new DecimalFormat("0.00");
                    DecimalFormatSymbols dfs = df.getDecimalFormatSymbols();
                    dfs.setDecimalSeparator('.');
                    df.setDecimalFormatSymbols(dfs);

                    double total = 0;
                    ArrayList<DetalleArriendo> lista = (ArrayList<DetalleArriendo>) session.getAttribute("carrito");

                    if (lista != null) {
                        for (DetalleArriendo dv : lista) {
                %>

                <tr>
                    <td class="Contenido">
                        <%=dv.getNumero()%>
                    </td>
                    <td class="Contenido">
                        <%=dv.getNombreCancha()%>
                        <input type="hidden" name="nombreCancha" value="<%=dv.getNombreCancha()%>">
                    </td>
                    <td class="Contenido">
                        <%=df.format(dv.getPrecio())%>
                        <input type="hidden" name="precioCancha" value="<%=dv.getPrecio()%>">
                    </td>
                    <td class="Contenido">
                        <%=dv.getCantidad()%>
                        <input type="hidden" name="cantidadCancha" value="<%=dv.getCantidad()%>">
                    </td>
                    <td class="Contenido">

                        <input type="hidden" name="descuentoCancha" value="<%=dv.getDescuento()%>">
                    </td>
                    <td class="Contenido">
                        <div> <%=df.format(dv.getSubTotal())%> </div>
                        <input type="hidden" name="subTotalCancha" value="<%=dv.getSubTotal()%>">
                    </td> 
                    <td whidh="100" class="Opcion">
                        <input type="button" name="btnEliminar" id="btnEliminar" class="button" value="Eliminar" onclick="location.href = 'Servlet_Arriendo?numero=<%=dv.getNumero()%>&&accion=quitar'">
                    </td>
                </tr>
                <%
                            total = total + dv.getSubTotal();
                        }
                    }
                %>
                <tr>
                    <th colspan="5" class="TituloDV">
                        <div> TOTAL (S/.)  </div>
                    </th>
                    <th class="Contenido">
                        <div> <%=String.valueOf(df.format(total))%> </div>
                        <input type="hidden" name="txtTotal" value="<%=String.valueOf(df.format(total))%>" readonly="readonly">
                    </th>
                    <th class="FilaEnBlanco">
                    </th>
                </tr>
                <tr>
                    <td colspan="7" class="FilaEnBlanco">
                        <br>
                    </td>
                </tr>
            </table>

            <table id="tablaRegresar">
                <tr>
                    <td>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input  style="width: 120%;padding: 15px 28px 15px 4px;
                               " type="button" name="btnRegistrar" id="btnRegistrarVenta" class="btn btn-success center" value="Registrar Arriendo">
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                    </td>
                </tr>
            </table>        
            <input type="hidden" name="accion" value="RegistrarArriendo"><br>

        </form>

        <!--footer-->


        <div class="footer-wrapper">
            <div class="container">
                <div class="footer-inner">
                    <div class="footer-top">
                        <div class="footer-top-left">
                            <h2>Coyhaique 360°</h2>

                            <p>
                                Villareal is advanced real estate application kit. Template implements specialized
                                components which will help you in the developement of your website or application.
                            </p>

                            <div class="social">
                                <a href="https://www.facebook.com/Coyhaique-360-624265097922243/" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="https://www.instagram.com/coyhaique360/" target="_blank"><i class="fa fa-instagram"></i></a>
                                <a href="" target="_blank"><i class="fa fa-twitter"></i></a>
                            </div><!-- /.social -->
                        </div><!-- /.footer-top-left -->


                    </div><!-- /.footer-top -->

                </div><!-- /.footer-inner -->
            </div><!-- /.container -->
        </div><!-- /.footer-wrapper -->



        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>


        <script src="//maps.googleapis.com/maps/api/js" type="text/javascript"></script>

        <script type="text/javascript" src="assets/js/jquery.js"></script>
        <script type="text/javascript" src="assets/js/jquery.ezmark.min.js"></script>
        <script type="text/javascript" src="assets/js/tether.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/gmap3.min.js"></script>
        <script type="text/javascript" src="assets/js/leaflet.js"></script>
        <script type="text/javascript" src="assets/js/leaflet.markercluster.js"></script>
        <script type="text/javascript" src="assets/libraries/owl-carousel/owl.carousel.min.js"></script>
        <script type="text/javascript" src="assets/libraries/chartist/chartist.min.js"></script>
        <script type="text/javascript" src="assets/js/scrollPosStyler.js"></script>
        <script type="text/javascript" src="assets/js/villareal.js"></script>

    </body>

    <script type="text/lightbox">

        JS 
        $(document).scroll(function(e){ var scrollTop = $(document).scrollTop(); if(scrollTop > 0){ console.log(scrollTop); $('.navbar').removeClass('navbar-static-top').addClass('navbar-fixed-top'); } else { $('.navbar').removeClass('navbar-fixed-top').addClass('navbar-static-top'); } }); 
    </script>
</html>
