<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoginWebMySQL.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
</head>
<body>
    <form id="formulario" runat="server">
        <div class="contenedor-inicio d-flex justify-content-center align-items-center" style="min-height:100vh;">
            <div class="tarjeta-inicio card shadow-sm" style="max-width: 420px; width:100%;">
                <div class="card-body p-4">
                    <h2 class="titulo-inicio h4 mb-4 text-center">Inicio de sesion</h2>
                    <div class="mb-3">
                        <label for="txtUsuario" class="form-label">Usuario</label>
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" MaxLength="12" />
                    </div>
                    <div class="mb-3">
                        <label for="txtContrasena" class="form-label">Clave</label>
                        <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" TextMode="Password" MaxLength="12" />
                    </div>
                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar"
                        CssClass="btn btn-primary w-100" OnClick="btnIngresar_Click" />
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