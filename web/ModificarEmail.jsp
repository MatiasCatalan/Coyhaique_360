<%-- 
    Document   : ModificarEmail
    Created on : 13-may-2018, 12:03:49
    Author     : Luis Carcamo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/CambiarEmail.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <title>Coyhaique 360º</title>
        <script type="text/javascript" src="js/Catalogo.js"></script>
        <link  href="css/lightbox.css" rel="stylesheet"  />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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



    </head>



    <%
        Usuario usu = Usuario_DB.listarUsuarioPorCodigo(request.getParameter("codigoU"));
    %>

    <body onload="cargar()">
        <%
            String codigo = (String) session.getAttribute("parametroCodigo");

            String cliente = usu.getNombreUsuario() + ", " + usu.getApellidosUsuario();
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



                     
                            <li><a class="link" id="lnkUsu" <h5>BIENVENIDO(A): <%=usu.getTipoUsuario()%> SR(A)=<%=usu.getNombreUsuario()%>, <%=usu.getApellidosUsuario()%></h5> </a></li>
                        </ul>


                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
                        <ul class="nav navbar-nav navbar-right">

                            <li class="active"><a href="Login.jsp"  class="link" id="lnkLogin">INGRESAR<span class="sr-only">(current)</span></a></li>
                            <li class="active"><a href="Servlet_Usu?accion=logout" class="link" id="lnkLogout">SALIR<span class="sr-only">(current)</span></a></li>


                        </ul> 
                        </ul> </div><!-- /.navbar-collapse --> </nav> 




                <div class="page-wrapper">



                    <div class="main-wrapper">
                        <div class="main">
                            <div class="main-inner">
                                <div class="content">
                                    <div class="cover cover-center">
                                        <div class="cover-carousel">
                                            <div class="cover-carousel-item">
                                                <div class="cover-image"
                                                     style="background-image: url('assets/img/slider/zae2fs6s.bmp')"></div>

                                                <div class="cover-title">
                                                    <div class="container">
                                                        <div class="cover-title-inner">
                                                            <div class="center">
                                                                <strong>$ 18.000</strong>
                                                            </div><!-- /.center -->

                                                            <h1>Campos de hielo </h1>

                                                            <p class="large"> Coyhaique/ Chile</p>

                                                        </div><!-- /.cover-title-->
                                                    </div><!-- /.container -->
                                                </div><!-- /.cover-title -->
                                            </div><!-- /.cover-carousel-item -->

                                            <div class="cover-carousel-item">
                                                <div class="cover-image"
                                                     style="background-image: url('assets/img/slider/gxomui6r.bmp')"></div>
                                                <!-- /.cover-image -->

                                                <div class="cover-title">
                                                    <div class="container">
                                                        <div class="cover-title-inner">
                                                            <div class="center">
                                                                <strong>$ 18.000</strong>
                                                            </div><!-- /.center -->

                                                            <h1>Cancha Almirante</h1>

                                                            <p class="large">Coyhaique / Chile</p>


                                                        </div><!-- /.cover-title-->
                                                    </div><!-- /.container -->
                                                </div><!-- /.cover-title -->
                                            </div><!-- /.cover-carousel-item -->

                                            <div class="cover-carousel-item">
                                                <div class="cover-image"
                                                     style="background-image: url('assets/img/slider/7d8c3f27c4c456cd162b1218d4e4538c.jpg')"></div>
                                                <!-- /.cover-image -->

                                                <div class="cover-title">
                                                    <div class="container">
                                                        <div class="cover-title-inner">
                                                            <div class="center">
                                                                <strong>$ 25.000</strong>
                                                            </div><!-- /.center -->

                                                            <h1>Gimnacio Regional</h1>

                                                            <p class="large">Coyhaique/ Chile</p>


                                                        </div><!-- /.cover-title-->
                                                    </div><!-- /.container -->
                                                </div><!-- /.cover-title -->
                                            </div><!-- /.cover-carousel-item -->

                                        </div><!-- /.cover-carousel -->
                                    </div><!-- /.cover -->

                                    <div class="information-bar">
                                        <div class="container">
                                            <i class="fa fa-soccer-ball-o"></i> Coyhaique 360° esla primera plataforma de arriendo de
                                            los diferentes recintos deportivos de manera seria y segura en la region.
                                        </div><!-- /.container -->
                                    </div><!-- /.information-bar -->


                                </div>

                            </div>
                        </div>
                    </div> 
                </div>
                <form action="Servlet_Usu" method="post" id="frmModificarEmail">
                    <table id="tablaModificarEmail">
                        <tr>
                            <th colspan="2">
                                <h1>Cambiar E-mail</h1>
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="hidden" name="txtCodigo" value="<%=usu.getCodigoUsuario()%>">
                                <input type="hidden" name="txtCaracter" value="<%=usu.getClaveUsuario()%>">
                            </td>
                        </tr>
                        <tr>
                            <td class="primeraColumna">
                                Correo actual : 
                            </td>
                            <td>
                        <dd> <%=usu.getEmailUsuario()%> </dd>
                        </td>
                        </tr>
                        <tr>
                            <td class="primeraColumna">
                                Ingrese nuevo Email : 
                            </td>
                            <td>
                        <dd> <input type="text" name="txtEmail" id="txtEmail" class="textBox" size="30" maxlength="50"> </dd>
                        </td>
                        </tr>
                        <tr>
                            <td class="primeraColumna">
                                Confirmar su Email :
                            </td>
                            <td>
                        <dd> <input type="text" name="txtConfirmarEmail" id="txtConfirEmail" class="textBox" size="30" maxlength="50"> </dd>
                        </td>
                        </tr>
                        <tr>
                            <td class="primeraColumna">
                                Ingrese su contraseña :
                            </td>
                            <td>
                        <dd> <input type="password" name="txtPass" id="txtPass" class="textBox" size="30" maxlength="50"> </dd>
                        </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="Botones">
                                <br>
                                <input type="button" name="btnCancelar" id="btnCancelar" class="button" value="ATRAS">
                                <input type="button" name="btnGuardar" id="btnGuardar" class="button" value="MODIFICAR">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br>
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" name="accion" value="modificarEmail">
                </form>
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

