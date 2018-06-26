<%-- 
    Document   : AnadirCarrito
    Created on : 14-may-2018, 13:20:43
    Author     : Luis Carcamo Espinoza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Clase.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="jsw</script>   
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
            <script type="text/javascript" src="js/Catalogo.js"></script>
            <link type="text/css" rel="stylesheet" href="css/css1.css" />

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Coyhaique 360º</title>
            <!-- Bootstrap -->
            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/modal.css" rel="stylesheet">


            <!-- Bootstrap -->
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



            <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->

            <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
            <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
            <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
        </head>


    </head>

    <body onload="cargar()">
        <div class="page-wrapper">           
            <%
                String cliente = request.getParameter("cliente");
                Cancha c = Cancha_DB.listarCanchaPorCodigo(request.getParameter("codigoC"));
            %>
            <%
                String codigo = (String) session.getAttribute("parametroCodigo");

                Usuario usu = Usuario_DB.listarUsuarioPorCodigo(codigo);
                String clientee = usu.getNombreUsuario() + ", " + usu.getApellidosUsuario();
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
                            <a class="navbar-brand" href="Catalogo.jsp">Coyhaique 360ª</a>

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
                        </
                    </nav> 
                </table>
            </form>



                            <br>
                             <br>
                              <br>
                               <br>                               <br>
                               <br>
                           



        </table>

        <input type="hidden" name="accion" value="logout">
        </form>



        <form name="frm" action="Servlet_Cancha" method="post" id="frmAnadirCarrito">
            <input type="hidden" name="txtCliente" value="<%=cliente%>">
            <table  class="jumbotron boxlogin2" id="tablaAnadirCarrito">
                <tr>
                    <th colspan="2">
                        <h1>Añadir Arriendo</h1>
                    </th>
                </tr>
                <tr>
                    <td colspan="2">
                <dd> <input type="hidden" name="txtCodigo" value="<%=c.getCodigoC()%>" size="20" maxlength="30"> </dd>
                </td>
                </tr>
                <th rowspan="5"><img id="myImg" src="imajenes/<%= c.getImagenC()%>"width="400" height="250"></th>


                <!-- Trigger the Modal -->

                <!-- The Modal -->
                <div id="myModal" class="modal" style="margin: 50px 0 0 0;">

                    <!-- The Close Button -->
                    <span class="close" style="color: red">&times;</span>

                    <!-- Modal Content (The Image) -->
                    <img class="modal-content" id="img01">

                    <!-- Modal Caption (Image Text) -->
                    <div id="caption"></div>
                </div> 
                <tr>
                    <td class="primeraColumna">
                        Nombre Cancha :
                    </td>
                    <td>
                <dd> <input type="text" name="txtNombreC" class="campoNoEditable form-control "  value="<%=c.getClaseCancha()%> <%=c.getSueloCancha()%> - <%=c.getDescripcion()%>" 
                            size="60" readonly="readonly"> </dd>
                </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Precio Hora:
                    </td>
                    <td>
                <dd> <input  type="text" name="txtPrecio" class="campoNoEditable form-control" value="<%=c.getPrecioC()%>" size="20" maxlength="30" readonly="readonly"> </dd>
                </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Horas:
                    </td>
                    <td>
                <dd> <input type="number" name="txtCantidad" value="1" min="1" class="form-control"> </dd>
                </td>
                </tr>
                <tr>
                    <td colspan="3" class="Botones">

                        <input class="btn btn-danger" type="button" name="btnCancelar" id="btnCancelar" class="button" value="CANCELAR">
                        <input style="margin-top: auto;" class="btn btn-primary" type="submit" name="btnGuardar" id="btnGuardar" class="button" value="AGREGAR">

                    </td>
                </tr>

            </table>
            <input type="hidden" name="accion" value="anadirCarrito">
        </form><br>



        <br>
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
    </div>
</body>
<script src="js/main.js"></script>

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

<script type="text/javascript">

        JS
        $(document).scroll(function (e) {
            var scrollTop = $(document).scrollTop();
            if (scrollTop > 0) {
                console.log(scrollTop);
                $('.navbar').removeClass('navbar-static-top').addClass('navbar-fixed-top');
            } else {
                $('.navbar').removeClass('navbar-fixed-top').addClass('navbar-static-top');
            }
        });
</script>

<script type="text/javascript" src="js/main.js"></script>

</html>
