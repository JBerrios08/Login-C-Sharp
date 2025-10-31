<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoginWebMySQL.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" integrity="sha512-dobJzi0u7QGpYUxU31rjwSkrkOpZeG5Y+dGr3G4OVupgX++Pk7F1SGTg0q4F1qfWMVb1rjE3lUZx0w7HJ2+2Vg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="Content/Site.css" rel="stylesheet" />
</head>
<body class="bg-body-tertiary">
    <form id="formulario" runat="server">
        <div class="container min-vh-100 d-flex align-items-center justify-content-center py-5">
            <div class="row justify-content-center w-100">
                <div class="col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4">
                    <div class="card shadow border-0">
                        <div class="card-body p-4 p-md-5">
                            <div class="d-flex justify-content-center mb-4">
                                <div class="rounded-circle bg-primary bg-gradient bg-opacity-10 d-flex align-items-center justify-content-center" style="width: 96px; height: 96px;">
                                    <img src="Content/user.png" alt="Usuario" class="img-fluid" style="width: 56px; height: 56px;" />
                                </div>
                            </div>
                            <h2 class="h4 text-center fw-bold mb-4">Bienvenido</h2>
                            <div class="mb-3">
                                <label for="txtUsuario" class="form-label fw-semibold">Usuario</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-body-tertiary text-primary border-end-0"><i class="fas fa-user"></i></span>
                                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control border-start-0" MaxLength="12" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="txtContrasena" class="form-label fw-semibold">Clave</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-body-tertiary text-primary border-end-0"><i class="fas fa-lock"></i></span>
                                    <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control border-start-0" TextMode="Password" MaxLength="12" />
                                </div>
                            </div>
                            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary w-100 py-2 fw-semibold" OnClick="btnIngresar_Click" />
                            <div class="text-center mt-4">
                                <asp:HyperLink ID="lnkRegistro" runat="server" NavigateUrl="~/Register.aspx" CssClass="link-primary fw-semibold text-decoration-none">
                                    ¿No tienes cuenta? Regístrate
                                </asp:HyperLink>
                            </div>
                            <asp:Literal ID="litMensaje" runat="server" CssClass="d-block text-center mt-4 text-danger fw-semibold" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.7.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
</body>
</html>
