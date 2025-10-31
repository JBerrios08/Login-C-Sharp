using System;
using LoginWebMySQL.Services;

namespace LoginWebMySQL
{
    public partial class Register : System.Web.UI.Page
    {
        private readonly UserService _userService = new UserService();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            var ok = _userService.RegistrarUsuario(txtUsuario.Text, txtContrasena.Text, out var msg);
            litMensaje.Text = msg;

            if (ok)
            {
                txtUsuario.Text = string.Empty;
                txtContrasena.Text = string.Empty;
                txtUsuario.Focus();
            }
        }
    }
}
