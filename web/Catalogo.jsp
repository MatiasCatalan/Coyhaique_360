<!DOCTYPE html>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Clase.*"%>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>

        <script type="text/javascript" src="js/Catalogo.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <link  href="css/lightbox.css" rel="stylesheet"  />

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Coyhaique360</title>

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
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>




    <body class="cover-pull-top header-transparent"onload="cargar()" >
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
                            <a class="navbar-brand" href="Catalogo.jsp">Coyhaique 360º   </a>

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
                            </ul> </div><!-- /.navbar-collapse --> </nav> 
                </div>
            </form>







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
                                                            <strong>$ 25.000</strong>
                                                        </div><!-- /.center -->

                                                        <h1>Campos de hielo </h1>

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

                                                        <h1>Gimansio Regional</h1>

                                                        <p class="large">Coyhaique / Chile</p>


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

                                <div class="container">
                                    <div class="page-header">
                                        <h1>Todas las canchas</h1>


                                    </div><!-- /.page-header -->

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container">
                <div class="pricing-standard">


                    <%
                        ArrayList<Cancha> lista = Cancha_DB.obtenerCanchasHabilitadas();
                        int salto = 0;
                        for (int i = 0; i < lista.size(); i++) {
                            Cancha c = lista.get(i);
                    %>
                    <div class="row">




                        <div class="col-md-4">
                            <div class="listing-box">
                                <div class="listing-box-image"
                                     style="background-image: url('imajenes/<%=c.getImagenC()%>')">
                                    <div class="listing-box-image-label">Destacada</div>
                                    <!-- /.listing-box-image-label -->


                                </div><!-- /.listing-box-image -->

                                <div class="listing-box-title">
                                    <h2><a href="interior-cancha.html"><br>
                                            <%=c.getDescripcion()%><br></a>
                                    </h2>
                                    <h3></h3>
                                </div><!-- /.listing-box-title -->

                                <div class="listing-box-content">
                                    <dl>
                                        <dt>tipo</dt>
                                        <dd><%=c.getClaseCancha()%> </dd>
                                        <dt>Suelo</dt>
                                        <dd> <%=c.getSueloCancha()%> </dd>
                                        <dt>Precio</dt>
                                        <dd> $/ <%=c.getPrecioC()%></dd>
                                        <dt>   <input style="padding: 9px 94px 9px 18px;" type="button" class="BotonModificar btn" name="btnModificar" value="MODIFICAR" onclick="location.href = 'ModificarCancha.jsp?codigoC=<%=c.getCodigoC()%>'">
                                        </dt>
                                        <dt>
                                            <input type="button" class="btn-success btn" name="btnADD" value="ARRENDAR" onclick="location.href = 'AnadirCarrito.jsp?codigoC=<%=c.getCodigoC()%>&&cliente=<%=cliente%>'">

                                        </dt>
                                    </dl>
                                </div><!-- /.listing-box-cotntent -->
                            </div><!-- /.listing-box -->
                        </div><!-- /.col-* -->

                        <%
                            salto++;
                            if (salto == 3) {
                        %>



                        <%
                                    salto = 0;
                                }
                            }
                        %>
                    </div><!-- /.row -->
                </div><!-- /.pricing-standard -->
            </div>
        </div>
        <div class="push-top" id="nosotros">

            <div class="page-header">
                <h1>Quienes Somos</h1>

            </div><!-- /.page-header -->
            <div class="background-white fullwidth">
                <div class="boxes">
                    <div class="row">
                        <div class="col-md-6 col-lg-3">
                            <div class="box">
                                <div class="box-icon">
                                    <i class="fa fa-map"></i>
                                </div><!-- /.box-icon -->

                                <div class="box-content">
                                    <h2>Mision</h2>
                                    <p>Nuestra principal tarea es entregar un servicio de calidad y
                                        serio para la region de aysen</p>
                                </div><!-- /.box-content -->
                            </div><!-- /.box -->
                        </div><!-- /.col-* -->

                        <div class="col-md-6 col-lg-3">
                            <div class="box">
                                <div class="box-icon">
                                    <i class="fa fa-eye"></i>
                                </div><!-- /.box-icon -->

                                <div class="box-content">
                                    <h2>Vision</h2>
                                    <p>Nuestra vision como equipo es suplir las falencias que se presentan en el
                                        arriendo de un recinto deportivo</p>
                                </div><!-- /.box-content -->
                            </div><!-- /.box -->
                        </div><!-- /.col-* -->

                        <div class="col-md-6 col-lg-3">
                            <div class="box">
                                <div class="box-icon">
                                    <i class="fa fa-soccer-ball-o"></i>
                                </div><!-- /.box-icon -->

                                <div class="box-content">
                                    <h2>Perspectiva</h2>
                                    <p>Pretendemos enfocarnos en el crecimiento del mercado deportivo e impactar y entregar un
                                        servicio de calidad para la region</p>
                                </div><!-- /.box-content -->
                            </div><!-- /.box -->
                        </div><!-- /.col-* -->

                        <div class="col-md-6 col-lg-3">
                            <div class="box">
                                <div class="box-icon">
                                    <i class="fa fa-group"></i>
                                </div><!-- /.box-icon -->

                                <div class="box-content">
                                    <h2>Quienes Somos</h2>
                                    <p>Somos un equipo emprendedor quepretende innovar en el ambito informatico en la region y mejorar
                                        la calidad de vida </p>
                                </div><!-- /.box-content -->
                            </div><!-- /.box -->
                        </div><!-- /.col-* -->
                    </div><!-- /.row -->
                </div><!-- /.boxes -->
            </div>
        </div>

    </div>


</div><!-- /.container -->
</div><!-- /.content -->
</div><!-- /.main-inner -->
</div><!-- /.main -->
</div><!-- /.main-wrapper -->








</div>

<input type="hidden" name="accion" value="logout">




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







</div><!-- /.page-wrapper -->
</div>
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

<script type="text/lightbox">

    JS 
    $(document).scroll(function(e){ var scrollTop = $(document).scrollTop(); if(scrollTop > 0){ console.log(scrollTop); $('.navbar').removeClass('navbar-static-top').addClass('navbar-fixed-top'); } else { $('.navbar').removeClass('navbar-fixed-top').addClass('navbar-static-top'); } }); 
</script>

</body>




</html>


