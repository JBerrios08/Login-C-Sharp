<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LoginWebMySQL.Register" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Crear cuenta</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" integrity="sha512-dobJzi0u7QGpYUxU31rjwSkrkOpZeG5Y+dGr3G4OVupgX++Pk7F1SGTg0q4F1qfWMVb1rjE3lUZx0w7HJ2+2Vg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body.pastel-body {
            background: linear-gradient(135deg, #fde2e4, #cdeaf7);
            color: #4a4a4a;
        }

        .pastel-wrapper {
            min-height: 100vh;
        }

        .pastel-card {
            background-color: rgba(255, 250, 245, 0.95);
            border: 2px solid #fbc4d6;
            border-radius: 1.5rem;
            box-shadow: 0 1.25rem 2.5rem rgba(250, 196, 214, 0.35);
        }

        .pastel-heading {
            color: #5f5f5f;
        }

        .pastel-subtext {
            color: #7c7c7c;
        }

        .pastel-input-group .input-group-text {
            background-color: #f8edeb;
            border-color: #fbc4d6;
            color: #6d6d6d;
        }

        .pastel-input {
            background-color: #fffdf7;
            border-color: #cddafd;
            color: #4a4a4a;
        }

        .pastel-input:focus {
            box-shadow: 0 0 0 0.25rem rgba(255, 175, 204, 0.35);
            border-color: #ffafcc;
        }

        .pastel-btn-secondary {
            background-color: #ffafcc;
            border-color: #ffafcc;
            color: #3f3f3f;
        }

        .pastel-btn-secondary:hover,
        .pastel-btn-secondary:focus {
            background-color: #ffc8dd;
            border-color: #ffc8dd;
            color: #2f2f2f;
        }

        .pastel-link {
            color: #a0c4ff;
        }

        .pastel-link:hover,
        .pastel-link:focus {
            color: #b5d0ff;
        }
    </style>
</head>
<body class="pastel-body">
    <form id="formRegistro" runat="server" class="container-fluid pastel-wrapper d-flex align-items-center justify-content-center">
        <div class="row w-100 justify-content-center">
            <div class="col-11 col-sm-9 col-md-7 col-lg-5 col-xl-4">
                <div class="card pastel-card border-0">
                    <div class="card-body p-4">
                        <div class="text-center mb-4">
                            <div class="d-flex justify-content-center mb-3">
                                <img src="Content/pastel.png" alt="Pastel" class="rounded-circle border border-3 border-light" width="96" height="96" />
                            </div>
                            <h1 class="h4 fw-semibold pastel-heading mb-2">
                                <i class="fa-solid fa-user-plus me-2"></i>Crear una nueva cuenta
                            </h1>
                            <p class="pastel-subtext mb-0">Completa los siguientes datos para registrarte.</p>
                        </div>

                        <div class="mb-3">
                            <label for="txtUsuario" class="form-label pastel-heading">Usuario</label>
                            <div class="input-group pastel-input-group">
                                <span class="input-group-text">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                                <asp:TextBox
                                    ID="txtUsuario"
                                    runat="server"
                                    CssClass="form-control pastel-input"
                                    MaxLength="12" />
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="txtContrasena" class="form-label pastel-heading">Clave</label>
                            <div class="input-group pastel-input-group">
                                <span class="input-group-text">
                                    <i class="fa-solid fa-lock"></i>
                                </span>
                                <asp:TextBox
                                    ID="txtContrasena"
                                    runat="server"
                                    CssClass="form-control pastel-input"
                                    TextMode="Password"
                                    MaxLength="12" />
                            </div>
                        </div>

                        <asp:Button
                            ID="btnRegistrar"
                            runat="server"
                            Text="Registrarme"
                            CssClass="btn pastel-btn-secondary w-100 fw-semibold"
                            OnClick="btnRegistrar_Click" />

                        <div class="text-center mt-3">
                            <asp:HyperLink
                                ID="lnkLogin"
                                runat="server"
                                NavigateUrl="~/Login.aspx"
                                CssClass="pastel-link link-underline-opacity-0 link-underline-opacity-100-hover fw-semibold">
                                <i class="fa-solid fa-right-to-bracket me-2"></i>Ya tienes cuenta? Inicia sesion
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
