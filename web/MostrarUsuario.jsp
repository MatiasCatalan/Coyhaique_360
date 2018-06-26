<%-- 
    Document   : MostrarUsuario
    Created on : 08-may-2018, 13:50:45
    Author     : Luis Carcamo Espinoza
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Clase.*" %> 
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <link  rel="stylesheet" href="css/new.css" />  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>

        <script type="text/javascript" src="js/Catalogo.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <link  href="css/lightbox.css" rel="stylesheet"  />

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

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

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/modal.css" rel="stylesheet">



        <title>Coyhaique 360º</title>

    </head>
    <body onload="cargar()">
        <%
            String codigo = (String) session.getAttribute("parametroCodigo");

            Usuario usuS = Usuario_DB.listarUsuarioPorCodigo(codigo);
            String cliente = usuS.getNombreUsuario() + ", " + usuS.getApellidosUsuario();
        %>

        <form action="Servlet_Usu" method="post" id="frmCabecera">
            <input type="hidden" value="<%=usuS.getTipoUsuario()%>" name="txtTipo" id="txtTipo">
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
                            <li class="active"><a href="MiPerfil.jsp?codigoU=<%=usuS.getCodigoUsuario()%>" class="link" id="lnkPerfil">Mi Cuenta<span class="sr-only">(current)</span></a></li>
                            <li><a href="RegistrarArriendo.jsp" class="link" id="lnkCompra">Mi carrito</a></li>
                            <li><a href="CuentaAdministrador.jsp" class="link" id="lnkAdm">Administrar</a></li>




                            <li><a href="contacto.jsp" class="link" id="lnkAdm">Contacto</a></li>
                            <li><a class="link" id="lnkUsu" <h5>BIENVENIDO(A): <%=usuS.getTipoUsuario()%> SR(A)=<%=usuS.getNombreUsuario()%>, <%=usuS.getApellidosUsuario()%></h5> </a></li>
                        </ul>


                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
                        <ul class="nav navbar-nav navbar-right">

                            <li class="active"><a href="Login.jsp"  class="link" id="lnkLogin">INGRESAR<span class="sr-only">(current)</span></a></li>
                            <li class="active"><a href="Servlet_Usu?accion=logout" class="link" id="lnkLogout">SALIR<span class="sr-only">(current)</span></a></li>


                        </ul> 
                        </ul> </div><!-- /.navbar-collapse --> </nav> 
                <br>







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
                                                            <div class="center" style="position: absolute" >
                                                                <th class="center" style="position: absolute;margin: -43% 0 0 5%;color: white"  >
                                                                    <h1 align="center"> USUARIOS REGISTRADOS </h1>

                                                                    <i align="center"  style="position: absolute;margin: -45px 0 0 259px;">

                                                                        <a type="button" class="btn btn-success" href="CuentaAdministrador.jsp" class="link"><span style="color:white;">REGRESAR</span></a>
                                                                    </i>

                                                                </th>


                                                                <hr>

                                                                <form id="frmMostrarCuerpoUsuario" style="position: absolute;color: white" >
                                                                    <table id="tablaMostrarCuerpoUsuario" style="position: absolute;margin: -606px 0 0 76px;"  >
                                                                        <tr style="background-color: white  ">
                                                                            <th class="Titulo">
                                                                                CODIGO
                                                                            </th>
                                                                            <th class="Titulo">
                                                                                NOMBRE
                                                                            </th>
                                                                            <th class="Titulo">
                                                                                APELLIDO
                                                                            </th>
                                                                            <th class="Titulo">
                                                                                DNI
                                                                            </th>
                                                                            <th class="Titulo">
                                                                                CORREO
                                                                            </th>
                                                                            <th class="Titulo">
                                                                                TELEFONO
                                                                            </th>
                                                                            <th class="Titulo">
                                                                                USUARIO
                                                                            </th>
                                                                            <th class="Titulo">
                                                                                TIPO
                                                                            </th>
                                                                            <th class="Titulo">
                                                                                ESTADO
                                                                            </th>
                                                                            <th class="Titulo">
                                                                                OPCION
                                                                            </th>
                                                                        </tr>    

                                                                        <%
                                                                            ArrayList<Usuario> lista = Usuario_DB.MostrarUsuarioHabilitado();
                                                                            for (int i = 0; i < lista.size(); i++) {
                                                                                Usuario usu = lista.get(i);
                                                                        %>

                                                                        <tr style="background-color: white  " >
                                                                            <td>
                                                                                <%=usu.getCodigoUsuario()%>
                                                                            </td>
                                                                            <td>
                                                                                <%=usu.getNombreUsuario()%>
                                                                            </td>
                                                                            <td>
                                                                                <%=usu.getApellidosUsuario()%>
                                                                            </td>
                                                                            <td>
                                                                                <%=usu.getDniUsuario()%>
                                                                            </td>
                                                                            <td>
                                                                                <%=usu.getEmailUsuario()%>
                                                                            </td>
                                                                            <td>
                                                                                <%=usu.getTelefonoUsuario()%>
                                                                            </td>
                                                                            <td>
                                                                                <%=usu.getIdUsuario()%>
                                                                            </td>
                                                                            <td>
                                                                                <%=usu.getTipoUsuario()%>
                                                                            </td>
                                                                            <td>
                                                                                <%=usu.getEstadoUsuario()%>
                                                                            </td>
                                                                            <td class="Opcion">
                                                                                <input type="button" name="btnEliminar" value="Eliminar" id="btnEliminar" class="button" onclick="location.href = 'Servlet_Usu?codigoU=<%=usu.getCodigoUsuario()%>&&accion=eliminar'">
                                                                            </td>
                                                                        </tr>

                                                                        <%
                                                                            }
                                                                        %>

                                                                    </table>

                                                                </form>

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
                    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                    <!-- Include all compiled plugins (below), or include individual files as needed -->
                    <script src="js/bootstrap.min.js"></script>
                    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                    <!-- Include all compiled plugins (below), or include individual files as needed -->
                    <script src="js/bootstrap.min.js"></script>
                    </body>
                    <script src="js/main.js"></script>
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
