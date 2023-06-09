<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Register</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #999;
                background: #f5f5f5;
                font-family: 'Roboto', sans-serif;
            }
            .form-control, .form-control:focus, .input-group-addon {
                border-color: #e1e1e1;
                border-radius: 0;
            }
            .signup-form {
                width: 390px;
                margin: 0 auto;
                padding: 30px 0;
            }
            .signup-form h2 {
                color: #636363;
                margin: 0 0 15px;
                text-align: center;
            }
            .signup-form .lead {
                font-size: 14px;
                margin-bottom: 30px;
                text-align: center;
            }
            .signup-form form {
                border-radius: 1px;
                margin-bottom: 15px;
                background: #fff;
                border: 1px solid #f3f3f3;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .signup-form .form-group {
                margin-bottom: 20px;
            }
            .signup-form label {
                font-weight: normal;
                font-size: 13px;
            }
            .signup-form .form-control {
                min-height: 38px;
                box-shadow: none !important;
                border-width: 0 0 1px 0;
            }
            .signup-form .input-group-addon {
                max-width: 42px;
                text-align: center;
                background: none;
                border-bottom: 1px solid #e1e1e1;
                padding-left: 5px;
            }
            .signup-form .btn, .signup-form .btn:active {
                font-size: 16px;
                font-weight: bold;
                background: #28a745 !important;
                border-radius: 3px;
                border: none;
                min-width: 140px;
            }
            .signup-form .btn:hover, .signup-form .btn:focus {
                background: #218838 !important;
            }
            .signup-form a {
                color: #28a745;
                text-decoration: none;
            }
            .signup-form a:hover {
                text-decoration: underline;
            }
            .signup-form .fa {
                font-size: 21px;
                position: relative;
                top: 8px;
            }
            .signup-form .fa-paper-plane {
                font-size: 17px;
            }
            .signup-form .fa-check {
                color: #fff;
                left: 9px;
                top: 18px;
                font-size: 7px;
                position: absolute;
            }
        </style>
    </head>
    <body>
        
        <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
        
        <div class="signup-form">	
            <form action="${pageContext.request.contextPath}/SvUsuario?accion=registrar" method="post">
                <h2>Registrar</h2>
                <p class="lead">Es gratis y sencillo, no toma mas 30 segundos.</p>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" name="username" placeholder="Usuario" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
                        <input type="email" class="form-control" name="email" placeholder="Correo Electronico" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="text" class="form-control" name="password" placeholder="Contraseņa" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-lock"></i>
                            <i class="fa fa-check"></i>
                        </span>
                        <input type="text" class="form-control" name="confirm_password" placeholder="Repite tu contraseņa" required="required">
                    </div>
                </div>        
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block btn-lg">Registrar</button>
                </div>
                <p class="small text-center">Al momento de registrarte, aceptas los <br><a href="#">Terminos y Condiciones</a>, y <a href="#">Politica de Privacidad</a>.<br>@Bazarito Inc, y asociados, registro 2023</p>
            </form>
            <div class="text-center"><a href="main.jsp">Regresar al inicio</a>.</div>
        </div>
        
        
        
        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css"><!-- comment -->
        <script type="text/javascript">
            var status = document.getElementById("status").value;
            if (status == "failed") {
                swal("Ah ocurrido algo inesperado", "Contactar con servicio", "error");
            }else if(status == "failurePass"){
                swal("Sorry", "La contraseņas no coinciden", "error");
            }else if(status == "failureMail"){
                swal("Oh no", "El correo ya esta registrado", "error");
            }
        </script>
    </body>
</html>