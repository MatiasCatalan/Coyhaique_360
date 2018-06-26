<%-- 
    Document   : RegistrarCliente
    Created on : 08-jun-2018, 13:50:45
    Author     : Luis Carcamo Espinoza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Cliente</title>
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/RegistrarCliente.js"></script>


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



        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>




    <body onload="cargar()">
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
                        </ul> </div><!-- /.navbar-collapse --> </nav> 










            </div>

            <input type="hidden" name="accion" value="logout">
        </form>


        <div class="jumbotron boxlogin">
            <form name="frm" action="Servlet_Usu" method="post" id="frmRegistrarUsuario">
                <input type="hidden" name="accion" value="registrar">
                <table id="tablaRegistrarUsuario">
                    <tr>
                        <th colspan="3">
                            <h1>Registrate ahora</h1>
                        </th>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            NOMBRES : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtNombres" id="txtNombre" class="form-control"  size="30" maxlength="50"> </dd>          
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            APELLIDOS : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtApellidos" id="txtApellido" class="form-control"  size="30" maxlength="50"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            RUT : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtDni" id="txtDni" class="form-control"  size="30" maxlength="8"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            EMAIL : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtEmail" id="txtEmail" class="form-control"  size="30" maxlength="50"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            CONFIRMAR EMAIL : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtConfirmarEmail" id="txtConfirEmail" class="form-control" size="30" maxlength="50"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            CIUDAD : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtCiudad" id="txtCiudad" class="form-control"  size="30" maxlength="20"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            REGION : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtRegion" id="txtRegion" class="form-control"  size="30" maxlength="20"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            PAIS : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtPais" id="txtPais" class="form-control"  size="30" maxlength="20"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            DIRECCION : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtDireccion1" id="txtDireccion1" class="form-control"  size="30" maxlength="50"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            DIRECCION(ALTERNATIVA) : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtDireccion2" id="txtDireccion2" class="form-control"  size="30" maxlength="50"> </dd>
                    </td>
                    <td>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna"> 
                            TELEFONO : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtTelefono" id="txtTelefono" class="form-control"  size="30" maxlength="9"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            NOMBRE DE USUARIO : 
                        </td>
                        <td>
                    <dd> <input type="text" name="txtUsuario" id="txtUsuario" class="form-control"  size="30" maxlength="30"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            CONTRASEÑA : 
                        </td>
                        <td>
                    <dd> <input type="password" name="txtClave" id="txtClave" class="form-control" size="30" maxlength="20"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td class="primeraColumna">
                            CONFIRMAR CONTRASEÑA: 
                        </td>
                        <td>
                    <dd> <input type="password" name="txtConfirmarClave" id="txtConfirClave" class="form-control" size="30" maxlength="20"> </dd>
                    </td>
                    <td>
                    <dd> * </dd>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="Botones">
                            <br>
                            <input type="button" name="btnCancelar" id="btnCancelar" class="btn-success btn" value="ATRAS">
                            <input type="button" name="btnRegistrar" id="btnRegistrar" class="btn-success btn" value="REGISTRAR">
                        </td>
                    </tr>

                </table>

            </form>
        </div>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

    </body>
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


</html>
