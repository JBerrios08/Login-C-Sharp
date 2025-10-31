using System;
using LoginWebMySQL.Services;

namespace LoginWebMySQL
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly UserService _userService = new UserService();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            var ok = _userService.ValidarInicioSesion(txtUsuario.Text, txtContrasena.Text, out var msg);
            if (ok)
            {
                litMensaje.Text = string.Empty;
                Response.Redirect("~/Crud.aspx");
                return;
            }

            litMensaje.Text = msg;
        }
    }
}
