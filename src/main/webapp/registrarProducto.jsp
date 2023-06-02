<%@page import="domain.Usuario"%>
<%@page import="domain.Producto" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Producto producto = (Producto) request.getAttribute("producto");
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

        </style>
        <title>Bazarito</title>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <a class="navbar-brand" href="main.jsp">Bazarito</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                    <li class="nav-item">
                        <a class="nav-link" href="aboutUs.jsp">Acerca de Nosotros</a>
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
                            <a class="dropdown-item" href="SvProductos?id=4">Tecnologia</a>
                            <a class="dropdown-item" href="SvProductos?id=5">Juegueteria</a>
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
                        <a class="dropdown-item" href="#">Tus productos</a>
                        <a class="dropdown-item" href="#">Vender</a>
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
        <div id="myModal" class="modal fade">
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
                                    <input type="text" class="form-control" name="username"  placeholder="Username" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <input type="text" class="form-control" name="password" placeholder="Password" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block btn-lg">Ingresar</button>
                            </div>
                            <p class="hint-text"><a href="#">¿Olvidaste tu contraseña?</a></p>
                        </form>
                    </div>
                    <div class="modal-footer">No tienes cuenta? <a href="register.jsp"> Registrate</a></div>
                </div>
            </div>
        </div>
    </div>

    <br/>
    <br/>
    <br/>


    <%
        if (producto == null) {
    %>
    <form style="margin:50px;" action="${pageContext.request.contextPath}/SvProductos" method="post">
    <%
    } else {
        request.setAttribute("idProducto", producto.getIdProducto());
    %>
    <form style="margin:50px;" action="${pageContext.request.contextPath}/SvProductos?accion=update&idProducto=${producto.idProducto}" method="post">    
    <%
        }
    %>
    
        <div class="form-group">
            <label for="exampleFormControlInput1">Nombre</label>
            <input value="${producto.nombre}" type="text" class="form-control" id="exampleFormControlInput1" placeholder="${producto.nombre}" name="nombre">
        </div>
        <div class="form-group">
            <label for="exampleFormControlTextarea1">Descripcion</label>
            <textarea value=""  class="form-control" id="exampleFormControlTextarea1" rows="3" name="descripcion">${producto.descripcion}</textarea>
        </div>
        <div class="form-group">
            <label for="exampleFormControlSelect1">Categoria</label>
            <select class="form-control" id="exampleFormControlSelect1" name="categoria">
                <option value = "1">Ropa</option>
                <option value = "2">Mueble</option>
                <option value = "3">Automovil</option>
                <option value = "4">Juguetería</option>
                <option value = "5">Tecnologia</option>
                <option value = "6">Otro</option>
            </select>
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput1">Precio en pesos mexicanos</label>
            <input type="number"  step="0.01" min="20" value="${producto.precio}" class="form-control" id="exampleFormControlInput1" name="precio" placeholder="20">
        </div>

        <%
            if (producto == null) {
        %>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg">Guardar</button>
        </div>
        <%
        } else {
            request.setAttribute("idProducto", producto.getIdProducto());
        %>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg">Actualizar</button>
        </div>
        <%
            }
        %>
    </form>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
</body>

</html>