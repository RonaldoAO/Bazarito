<%@page import="domain.Usuario"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String status = (String) request.getAttribute("status");
%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


        <style>
            .card-deck{
                padding:20px;
            }
            .card .card-buttoms {
                padding:10px;
            }
            img{
                width:180px;
                height:180px;
            }
        </style>
        <title>Bazarito</title>
    </head>

    <body>

        <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">

        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <a class="navbar-brand" href="SvProductos">Bazarito</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                    <li class="nav-item">
                        <a class="nav-link" href="#">Acerca de Nosotros</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Categorías
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="SvProductos?id=1">Ropa</a>
                            <a class="dropdown-item" href="SvProductos?id=2">Muebles</a>
                            <a class="dropdown-item" href="SvProductos?id=3">Automovil</a>
                            <a class="dropdown-item" href="SvProductos?id=5">Tecnologia</a>
                            <a class="dropdown-item" href="SvProductos?id=4">Juegueteria</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="SvProductos?id=6">Otros</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">......</a>
                    </li>
                </ul>

                <%
                    if (usuario != null) {
                %>
                <nav class="navbar navbar-light bg-light">
                    <a class="navbar-brand" href="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                        <img src="/docs/4.0/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="">
                        ${usuario.nombre}
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="SvProductos?id=editar">Tus productos</a>
                        <a class="dropdown-item" href="registrarProducto.jsp">Vender</a>
                        <form action="${pageContext.request.contextPath}/SvUsuario?accion=logout" method="post">
                            <button type="submit" class="btn btn-success btn-sm" style=" width:80% ; margin: 10px 15px;">Salir</button>
                        </form>
                    </div>
                </nav>
                <%
                } else {
                %>
                <form class="form-inline my-2 my-lg-0" style="margin-left:10px;">            
                    <button type ="button" class="btn btn-success btn-block" data-toggle="modal" data-target="#myModal">Ingresar</button>
                </form>    
                <%
                    }
                %>
            </div>
        </nav>
        <!-- Modal -->
        <div id="myModal" class="modal fade" >
            <div class="modal-dialog modal-login">
                <div class="modal-content">
                    <div class="modal-header">				
                        <h4 class="modal-title">Inicia Sesión</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/SvUsuario?accion=login" method="post">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" class="form-control" name="username"  placeholder="Usuario o Correo" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <input type="text" class="form-control" name="password" placeholder="Contraseña" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block btn-lg">Ingresar</button>
                            </div>
                            <p class="hint-text"><a href="#">¿Olvidaste tu contraseña?</a></p>
                        </form>
                    </div>
                    <div class="modal-footer"  ><p>No tienes cuenta?<a href="register.jsp"> Registrate</a><p></div>
                </div>
            </div>
        </div>
    </div>

    <br/>


    <!-- Content -->
    <div class ="container" style="margin-top:40px; text-align: center;">
        <h1>Acerca de nosotros</h1> 
        <br/>
        <p>Esta página fue creada como proyecto final de la materia
            <b>Ingenieria de Sofware</b> bajo la asesoría del Docente Rogelio N. Limón Cordero</p><!-- comment -->
        
        <p class = "text-justify">Somos un grupo de estudiantes del Instituto Tecnológico de Oaxaca apasionados por la tecnología y la sostenibilidad. Nos hemos unido para crear una plataforma en línea llamada "Bazarito", donde puedes comprar y vender productos de segunda mano de forma segura y conveniente.

            Nuestra misión es fomentar una economía circular y promover la reutilización de productos, reduciendo así el impacto ambiental y brindando una segunda oportunidad a aquellos artículos que aún tienen vida útil. Creemos en la importancia de darle valor a los objetos y evitar el desperdicio innecesario, alentando a las personas a adoptar un estilo de vida más sostenible.

        </p>
        <p class = "text-justify"> En "Bazarito", nos esforzamos por ofrecer una experiencia de compra y venta excepcional. Hemos creado una plataforma intuitiva y fácil de usar, donde puedes explorar una amplia variedad de productos en diferentes categorías, desde electrónica y moda hasta muebles y carros. Estamos aquí para responder a tus preguntas, resolver cualquier problema y garantizar una experiencia sin contratiempos.

            Nos apasiona ayudar a la comunidad estudiantil y a todos aquellos que buscan ahorrar dinero, encontrar tesoros ocultos y contribuir al cuidado del medio ambiente. Creemos en el poder de la colaboración y la solidaridad, por lo que te invitamos a unirte a nuestra comunidad "Bazarito" y formar parte de este movimiento hacia un consumo más responsable.
        </p>
        <br/>
        
    </div>

    <div class="container">
   
        <div class="row">
            <div class="col-md-3">
                <div class="text-center">
                    <img src="img/ronaldo.jpeg" class="rounded-circle" alt="Imagen de Persona">
                </div>
                <h5 class="text-center">Ronaldo Acevedo Ojeda</h5>
                <p class="text-center">Programador Backend</p>
            </div>
            <div class="col-md-3">
                <div class="text-center">
                    <img src="img/leon.jpg" class="rounded-circle" alt="Imagen de Persona">
                </div>
                <h5 class="text-center">León Cruz Eric Moisés</h5>
                <p class="text-center">Programador, Tester
                </p>
            </div>
            <div class="col-md-3">
                <div class="text-center">
                    <img src="img/loi.jpg" class="rounded-circle" alt="Imagen de Persona">
                </div>
                <h5 class="text-center">Curiel Perea Loibeth </h5>
                <p class="text-center">Programadora Front-end, Diseñadora</p>
            </div>
            <div class="col-md-3">
                <div class="text-center">
                    <img src="img/magali.jpg" class="rounded-circle" alt="Imagen de Persona">
                </div>
                <h5 class="text-center">Cruz Rosales Magali</h5>
                <p class="text-center">Programadora, Arquitecta de producto</p>
            </div>
        </div>
    </div>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status == "failure") {
            swal("Oh no", "Usuario o contraseña invalida", "error");
        } else if (status == "failurePass") {
            swal("Sorry", "La contraseñas no coinciden", "error");
        } else if (status == "failureMail") {
            swal("Oh no", "El correo ya esta registrado", "error");
        }
    </script>
</body>

</html>