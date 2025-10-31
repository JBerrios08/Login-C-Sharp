<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoginWebMySQL.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="Content/Site.css" rel="stylesheet" />
    <style type="text/css">
        body { background: linear-gradient(135deg, #0d6efd 0%, #6610f2 100%); }
        .auth-wrapper { min-height: 100vh; padding: 2rem; display: flex; align-items: center; justify-content: center; background: rgba(255, 255, 255, 0.1); backdrop-filter: blur(6px); }
        .auth-card { width: 100%; max-width: 900px; border-radius: 1.5rem; overflow: hidden; }
        .auth-image { background: #0b5ed7; }
        .auth-image img { width: 100%; height: 100%; object-fit: cover; display: block; }
        .auth-form { background: #ffffff; height: 100%; }
        .auth-form-inner { padding: 2.5rem; height: 100%; display: flex; flex-direction: column; justify-content: center; }
        .auth-icon { display: inline-flex; align-items: center; justify-content: center; width: 64px; height: 64px; border-radius: 50%; background: rgba(13, 110, 253, 0.12); color: #0d6efd; font-size: 1.5rem; }
        .auth-form .form-label { font-weight: 600; color: #212529; }
        .auth-form .input-group-text { border-radius: 0.75rem 0 0 0.75rem; border-right: 0; background: transparent; color: #6c757d; }
        .auth-form .form-control { border-radius: 0 0.75rem 0.75rem 0; border-left: 0; padding-left: 0; }
        .auth-form .form-control:focus { box-shadow: none; border-color: #0d6efd; }
        .auth-form .btn-primary { border-radius: 0.75rem; padding-top: 0.75rem; padding-bottom: 0.75rem; font-weight: 600; }
        .auth-form .text-muted { font-size: 0.9rem; }
        @media (max-width: 767.98px) {
            .auth-wrapper { padding: 1.5rem; }
            .auth-form-inner { padding: 2rem; }
        }
    </style>
</head>
<body>
    <form id="formulario" runat="server">
        <div class="auth-wrapper">
            <div class="auth-card card border-0 shadow-lg">
                <div class="row g-0 align-items-stretch">
                    <div class="col-md-5 d-none d-md-block auth-image">
                        <img src="Content/Images/login-illustration.jpg" alt="Acceso al panel CRUD" />
                    </div>
                    <div class="col-12 col-md-7 auth-form">
                        <div class="auth-form-inner">
                            <div class="text-center mb-4">
                                <span class="auth-icon"><i class="fa-solid fa-right-to-bracket"></i></span>
                                <h1 class="h4 fw-semibold mt-3 mb-1">Bienvenido</h1>
                                <p class="text-muted mb-0">Accede al panel CRUD con tus credenciales</p>
                            </div>
                            <div class="mb-3">
                                <label for="txtUsuario" class="form-label">Usuario</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
                                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control border-start-0 shadow-none" MaxLength="12" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="txtContrasena" class="form-label">Clave</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
                                    <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control border-start-0 shadow-none" TextMode="Password" MaxLength="12" />
                                </div>
                            </div>
                            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary w-100" OnClick="btnIngresar_Click" />
                            <div class="text-center mt-3">
                                <asp:HyperLink ID="lnkRegistro" runat="server" NavigateUrl="~/Register.aspx" CssClass="text-decoration-none">¿No tienes cuenta? Regístrate</asp:HyperLink>
                            </div>
                            <div class="mt-3">
                                <asp:Literal ID="litMensaje" runat="server" />
                            </div>
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
