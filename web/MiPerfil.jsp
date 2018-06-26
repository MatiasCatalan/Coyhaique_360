<%-- 
    Document   : MiPerfil
    Created on : 13-may-2018, 12:03:49
    Author     : Luis Carcamo Espinoza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/MiPerfil.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <script type="text/javascript" src="js/Catalogo.js"></script>
        <link  href="css/lightbox.css" rel="stylesheet"  />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

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


        <title>Coyhaique 360º</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/modal.css" rel="stylesheet">

        <title>Mis Datos</title>
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
        </form>





    </div>
    <input type="hidden" name="accion" value="logout">
</form>

<br>
<br>
<br>
<br>
<br>

<form action="Servlet_Usu" method="post" id="frmModificarUsuario">
    <table  class="jumbotron boxlogin2" id="tablaModificarUsuario">
        <tr>
            <th colspan="3">
                <h1>MIS DATOS</h1>
            </th>
        </tr>
        <tr>
            <td colspan="3">
                <input type="hidden" name="txtCodigo" value="<%=usu.getCodigoUsuario()%>"> 
            </td>
        </tr>
        <tr>
            <td class="primeraColumna">
                NOMBRE: 
            </td>
            <td>
        <dd class="soloTexto"> <%=usu.getNombreUsuario()%> </dd>
        <dd> <input type="text" name="txtNombre" id="txtNombre" class="campoOculto" value="<%=usu.getNombreUsuario()%>" size="30" maxlength="50"> </dd>

        </td>
        <td></td>
        </tr>
        <tr>
            <td class="primeraColumna">
                APELLIDOS:
            </td>
            <td>
        <dd class="soloTexto"> <%=usu.getApellidosUsuario()%> </dd>
        <dd> <input type="text" name="txtApellidos" id="txtApellido" class="campoOculto" value="<%=usu.getApellidosUsuario()%>" size="30" maxlength="50"> </dd>
        </td>
        <td></td>
        </tr>
        <tr>
            <td class="primeraColumna">
                RUT
            </td>
            <td>
        <dd class="soloTexto"> <%=usu.getDniUsuario()%> </dd>
        <dd> <input type="text" name="txtDni" id="txtDni" class="campoOculto" value="<%=usu.getDniUsuario()%>" size="30" maxlength="8"> </dd>
        </td>
        <td></td>
        </tr>
        <tr>
            <td class="primeraColumna">
                EMAIL:
            </td>
            <td>
        <dd> <%=usu.getEmailUsuario()%> </dd>
        </td>
        <td>
        <dd> <a href="ModificarEmail.jsp?codigoU=<%=usu.getCodigoUsuario()%>" class="Enlace">Cambiar email</a> </dd>
        </td>
        </tr>
        <tr>
            <td class="primeraColumna">
                CONTRASEÑA
            </td>
            <td>
        <dd> ********** </dd>
        </td>
        <td>
        <dd> <a href="ModificarContraseña.jsp?codigoU=<%=usu.getCodigoUsuario()%>" class="Enlace">Cambiar contraseña</a> </dd>
        </td>
        </tr>
        <tr>
            <td class="primeraColumna">
                PROFESION:
            </td>
            <td>
        <dd class="soloTexto"> <%=usu.getCiudadUsuario()%> </dd>
        <dd> <input type="text" name="txtCiudad" id="txtDepartamento" class="campoOculto" value="<%=usu.getCiudadUsuario()%>" size="30" maxlength="20"> </dd>
        </td>
        <td></td>
        </tr>
        <tr>
            <td class="primeraColumna">
                CIUDAD:
            </td>
            <td>
        <dd class="soloTexto"> <%=usu.getRegionUsuario()%> </dd>
        <dd> <input type="text" name="txtRegion" id="txtProvincia" class="campoOculto" value="<%=usu.getRegionUsuario()%>" size="30" maxlength="20"> </dd>
        </td>
        <td></td>
        </tr>
        <tr>
            <td class="primeraColumna">
                PAIS:
            </td>
            <td>
        <dd class="soloTexto"> <%=usu.getPaisUsuario()%> </dd>
        <dd> <input type="text" name="txtPais" id="txtDistrito" class="campoOculto" value="<%=usu.getPaisUsuario()%>" size="30" maxlength="20"> </dd>
        </td>
        <td></td>
        </tr>
        <tr>
            <td class="primeraColumna">
                DIRECCION:
            </td>
            <td>
        <dd class="soloTexto"> <%=usu.getDireccion1Usuario()%> </dd>
        <dd> <input type="text" name="txtDireccion1" id="txtDireccion1" class="campoOculto" value="<%=usu.getDireccion1Usuario()%>" size="30" maxlength="50"> </dd>
        </td>
        <td></td>
        </tr>
        <tr>
            <td class="primeraColumna">
                DIRECCION ALTERNATICA:
            </td>
            <td>
        <dd class="soloTexto"> <%=usu.getDireccion2Usuario()%> </dd>
        <dd> <input type="text" name="txtDireccion2" id="txtDireccion2" class="campoOculto" value="<%=usu.getDireccion2Usuario()%>" size="30" maxlength="50"> </dd>
        </td>
        <td></td>
        </tr>
        <tr>
            <td class="primeraColumna">
                TELEFONO:
            </td>
            <td>
        <dd class="soloTexto"> <%=usu.getTelefonoUsuario()%> </dd>
        <dd> <input type="text" name="txtTelefono" id="txtTelefono" class="campoOculto" value="<%=usu.getTelefonoUsuario()%>" size="30" maxlength="9"> </dd>
        </td>
        <td></td>
        </tr>
        <tr>

        </tr>
        <tr>
            <td colspan="3" class="Botones">
                <br>
                <input type="button" name="btnCancelar" id="btnCancelar" class="btn btn-success" value="ATRAS">
                <input style="padding: 8px 0px 4px 1px;" type="button" name="btnModificar" id="btnModificar" class="btn btn-success" value="MODIFICAR">
                <input type="button" name="btnGuardar" id="btnGuardar" class="campoOculto" value="GUARDAR CAMBIOS ">
            </td>
        </tr>
        <tr> 
            <td>
                <br>
            </td>
        </tr>
    </table>
    <input type="hidden" name="accion" value="modificarUsuario">
</form>
<br>
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
