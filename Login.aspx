<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoginWebMySQL.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" integrity="sha512-dobJzi0u7QGpYUxU31rjwSkrkOpZeG5Y+dGr3G4OVupgX++Pk7F1SGTg0q4F1qfWMVb1rjE3lUZx0w7HJ2+2Vg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #4c6ef5, #15aabf);
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            color: #1e1e2f;
        }

        .contenedor-inicio {
            padding: 2rem 1rem;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .tarjeta-inicio {
            border: none;
            border-radius: 1rem;
            overflow: hidden;
        }

        .tarjeta-inicio .card-body {
            background: #ffffff;
            border-radius: 1rem;
        }

        .titulo-inicio {
            font-weight: 700;
            color: #1e1e2f;
        }

        .avatar-login {
            width: 96px;
            height: 96px;
            margin: 0 auto 1.5rem auto;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(76, 110, 245, 0.15), rgba(21, 170, 191, 0.15));
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .avatar-login img {
            width: 60px;
            height: 60px;
        }

        .form-label {
            font-weight: 600;
            color: #495057;
        }

        .input-group-text {
            background: #f1f3f5;
            border: none;
            color: #4c6ef5;
        }

        .form-control {
            border-left: none;
        }

        .form-control:focus {
            border-color: #4c6ef5;
            box-shadow: 0 0 0 0.2rem rgba(76, 110, 245, 0.15);
        }

        .btn-inicio {
            background: linear-gradient(135deg, #4c6ef5, #15aabf);
            border: none;
            font-weight: 600;
        }

        .btn-inicio:hover,
        .btn-inicio:focus {
            background: linear-gradient(135deg, #3b5bdb, #1098ad);
        }

        .enlace-registro {
            color: #4c6ef5;
            font-weight: 600;
            text-decoration: none;
        }

        .enlace-registro:hover,
        .enlace-registro:focus {
            color: #3b5bdb;
            text-decoration: underline;
        }

        .alerta-login {
            margin-top: 1.5rem;
        }
    </style>
</head>
<body class="bg-body-tertiary">
    <form id="formulario" runat="server">
        <div class="contenedor-inicio d-flex justify-content-center align-items-center">
            <div class="tarjeta-inicio card shadow-sm" style="max-width: 420px; width: 100%;">
                <div class="card-body p-4">
                    <div class="text-center mb-4">
                        <div class="avatar-login">
                            <i class="fa-solid fa-user-lock fa-2x text-primary"></i>
                        </div>
                        <h1 class="titulo-inicio h4 mb-2">Bienvenido otra vez</h1>
                        <p class="text-muted mb-0">Ingresa tus credenciales para continuar.</p>
                    </div>

                    <div class="mb-3">
                        <label for="txtUsuario" class="form-label">Usuario</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fa-solid fa-user"></i>
                            </span>
                            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" MaxLength="12" />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="txtContrasena" class="form-label">Clave</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fa-solid fa-lock"></i>
                            </span>
                            <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" TextMode="Password" MaxLength="12" />
                        </div>
                    </div>

                    <asp:Button ID="btnIngresar" runat="server" Text="Iniciar sesión" CssClass="btn btn-inicio w-100 text-white" OnClick="btnIngresar_Click" />
                    <div class="text-center mt-3">
                        <asp:HyperLink ID="lnkRegistro" runat="server" NavigateUrl="~/Register.aspx" CssClass="enlace-registro">¿No tienes cuenta? Regístrate</asp:HyperLink>
                    </div>
                    <asp:Literal ID="litMensaje" runat="server" />
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.7.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
</body>
</html>
