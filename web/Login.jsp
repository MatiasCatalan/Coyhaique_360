<%-- 
    Document   : Login
    Created on : 13-may-2018, 12:03:49
    Author     : Luis Carcamo Espinoza
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Clase.*"%>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/Catalogo.js"></script>
        <script type="text/javascript" src="js/Login.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Coyhaique 360º</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

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




    </head>

    <body onload="cargar()">
        <div class="page-wrapper">

            <%
                String codigo = (String) session.getAttribute("parametroCodigo");

                Usuario usu = Usuario_DB.listarUsuarioPorCodigo(codigo);
                String cliente = usu.getNombreUsuario() + ", " + usu.getApellidosUsuario();
            %>

            <form action="Servlet_Usu" method="post" id="frmCabecera">
                <input type="hidden" value="<%=usu.getTipoUsuario()%>" name="txtTipo" id="txtTipo">
                <div id="tablaCabecera">

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
                            </ul> </div><!-- /.navbar-collapse --> 
                    </nav> 


                </div>


                <div class="page-wrapper">



                    <div class="main-wrapper">
                        <div class="main">
                            <div class="main-inner">
                                <div class="content">
                                    <div class="cover cover-center">
                                        <div class="cover-carousel">



                                            <div class="cover-carousel-item">
                                                <div class="cover-image"
                                                     style="background-image: url('assets/img/slider/7d8c3f27c4c456cd162b1218d4e4538c.jpg')"></div>
                                                <!-- /.cover-image -->

                                                <div class="cover-title">  
                                                    <div class="container">
                                                        <div class="cover-title-inner">
                                                            <div class="center">

                                                                <div class=" boxlogin">
                                                                    <form method="post" action="Servlet_Usu" id="frmLogin">
                                                                        <table id="tablaLogin">
                                                                            <tr>
                                                                                <th>
                                                                                    <h1>INICIO DE SESION</h1>
                                                                                </th>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <br>
                                                                                    <input type="text" name="txtUsuario" placeholder="Ingrese usuario" id="txtUsuario" class="form-control">
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <br>
                                                                                    <input type="password" name="txtClave" placeholder="Ingrese contraseña" id="txtClave" class="form-control">
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <input style="width: 100%;padding: 13px 0 5px 0px;" type="submit"  class="btn btn-primary" class="btn btn-success" name="btnIngresar" value="INGRESAR" id="btnIngresar" >
                                                                                </td> 
                                                                            </tr>
                                                                            
                                                                            <tr>
                                                                                <td class="centrarBoton">
                                                                                    <a  style="padding: 9px 112px 5px" type="button" class="btn btn-success" href="RegistrarCliente.jsp" id="lnkRegistrarUsuario"><h5>Registrate aqui</h5></a>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <input type="hidden" name="accion" value="login">
                                                                    </form>
                                                                </div>




                                                            </div><!-- /.cover-title-->
                                                        </div><!-- /.container -->
                                                    </div><!-- /.cover-title -->
                                                </div><!-- /.cover-carousel-item -->

                                            </div><!-- /.cover-carousel -->
                                        </div><!-- /.cover -->




                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    </table>
                </div>
            </form>

        </div>

        <input type="hidden" name="accion" value="logout">
    </form>



</head>





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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>


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
</html>
