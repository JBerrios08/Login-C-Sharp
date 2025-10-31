<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoginWebMySQL.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" integrity="sha512-dobJzi0u7QGpYUxU31rjwSkrkOpZeG5Y+dGr3G4OVupgX++Pk7F1SGTg0q4F1qfWMVb1rjE3lUZx0w7HJ2+2Vg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-dark text-light">
    <form id="formulario" runat="server" class="container-fluid min-vh-100 d-flex align-items-center justify-content-center">
        <div class="row w-100 justify-content-center">
            <div class="col-11 col-sm-9 col-md-7 col-lg-5 col-xl-4">
                <div class="card bg-secondary border-0 shadow-lg">
                    <div class="card-body p-4">
                        <div class="text-center mb-4">
                            <div class="d-flex justify-content-center mb-3">
                                <img src="Content/user.png" alt="Usuario" class="rounded-circle border border-3 border-dark-subtle" width="96" height="96" />
                            </div>
                            <h1 class="h4 fw-semibold text-white mb-2">
                                <i class="fa-solid fa-right-to-bracket me-2"></i>Bienvenido otra vez
                            </h1>
                            <p class="text-light-emphasis mb-0">Ingresa tus credenciales para continuar.</p>
                        </div>

                        <div class="mb-3">
                            <label for="txtUsuario" class="form-label text-light">Usuario</label>
                            <div class="input-group">
                                <span class="input-group-text bg-dark border-dark text-secondary">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                                <asp:TextBox
                                    ID="txtUsuario"
                                    runat="server"
                                    CssClass="form-control bg-dark text-light border-dark"
                                    MaxLength="12" />
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="txtContrasena" class="form-label text-light">Clave</label>
                            <div class="input-group">
                                <span class="input-group-text bg-dark border-dark text-secondary">
                                    <i class="fa-solid fa-lock"></i>
                                </span>
                                <asp:TextBox
                                    ID="txtContrasena"
                                    runat="server"
                                    CssClass="form-control bg-dark text-light border-dark"
                                    TextMode="Password"
                                    MaxLength="12" />
                            </div>
                        </div>

                        <asp:Button
                            ID="btnIngresar"
                            runat="server"
                            Text="Iniciar sesión"
                            CssClass="btn btn-primary w-100 fw-semibold"
                            OnClick="btnIngresar_Click" />

                        <div class="text-center mt-3">
                            <asp:HyperLink
                                ID="lnkRegistro"
                                runat="server"
                                NavigateUrl="~/Register.aspx"
                                CssClass="link-light link-underline-opacity-0 link-underline-opacity-100-hover fw-semibold">
                                <i class="fa-solid fa-user-plus me-2"></i>¿No tienes cuenta? Regístrate
                            </asp:HyperLink>
                        </div>

                        <div class="mt-3">
                            <asp:Literal ID="litMensaje" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.7.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
