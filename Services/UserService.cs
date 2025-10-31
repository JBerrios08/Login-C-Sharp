using LoginWebMySQL.Repositories;

namespace LoginWebMySQL.Services
{
    public class UserService
    {
        private readonly UserRepository _repo = new UserRepository();

        public bool RegistrarUsuario(string usuario, string password, out string mensaje)
        {
            var u = (usuario ?? string.Empty).Trim();
            var p = (password ?? string.Empty).Trim();

            if (u.Length == 0 || p.Length == 0)
            {
                mensaje = "<div class='alert alert-warning mt-3'>Escribe usuario y contraseña.</div>";
                return false;
            }

            if (_repo.UsuarioExiste(u))
            {
                mensaje = "<div class='alert alert-warning mt-3'>El usuario ya está registrado.</div>";
                return false;
            }

            var ok = _repo.InsertarUsuario(u, p);
            mensaje = ok
                ? "<div class='alert alert-success mt-3'>Registro creado correctamente.</div>"
                : "<div class='alert alert-danger mt-3'>No se pudo registrar el usuario.</div>";
            return ok;
        }

        public bool ValidarInicioSesion(string usuario, string password, out string mensaje)
        {
            var u = (usuario ?? string.Empty).Trim();
            var p = (password ?? string.Empty).Trim();

            if (u.Length == 0 || p.Length == 0)
            {
                mensaje = "<div class='alert alert-warning mt-3'>Escribe usuario y contraseña.</div>";
                return false;
            }

            var ok = _repo.ValidarCredenciales(u, p);
            mensaje = ok
                ? string.Empty
                : "<div class='alert alert-danger mt-3'>Usuario o contraseña incorrectos.</div>";
            return ok;
        }
    }
}
